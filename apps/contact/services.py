"""SMTP configuration and contact notification delivery."""

import base64
import hashlib
import logging
from email.utils import formataddr

from cryptography.fernet import Fernet, InvalidToken
from django.conf import settings
from django.core.exceptions import ImproperlyConfigured
from django.core.mail import EmailMultiAlternatives, get_connection
from django.template.loader import render_to_string
from django.utils import timezone

from .models import ContactRequest, EmailSettings

logger = logging.getLogger(__name__)


def _fernet() -> Fernet:
	raw_key = settings.EMAIL_CREDENTIAL_KEY
	if not raw_key:
		raise ImproperlyConfigured("EMAIL_CREDENTIAL_KEY is not configured.")
	key = base64.urlsafe_b64encode(hashlib.sha256(raw_key.encode("utf-8")).digest())
	return Fernet(key)


def encrypt_password(password: str) -> str:
	return _fernet().encrypt(password.encode("utf-8")).decode("ascii")


def decrypt_password(encrypted_password: str) -> str:
	try:
		return _fernet().decrypt(encrypted_password.encode("ascii")).decode("utf-8")
	except InvalidToken as exc:
		raise ImproperlyConfigured(
			"The SMTP password cannot be decrypted. Check EMAIL_CREDENTIAL_KEY."
		) from exc


def _connection(config: EmailSettings):
	return get_connection(
		backend=settings.EMAIL_BACKEND,
		host=config.host,
		port=config.port,
		username=config.username,
		password=decrypt_password(config.encrypted_password),
		use_tls=config.security == EmailSettings.Security.STARTTLS,
		use_ssl=config.security == EmailSettings.Security.SSL,
		timeout=config.timeout,
		fail_silently=False,
	)


def _from_email(config: EmailSettings) -> str:
	return formataddr((config.from_name, config.from_email))


def test_smtp_connection(config: EmailSettings) -> None:
	try:
		connection = _connection(config)
		connection.open()
		connection.close()
	except Exception as exc:
		config.last_tested_at = timezone.now()
		config.last_test_succeeded = False
		config.last_test_message = str(exc)[:500]
		config.save(update_fields=["last_tested_at", "last_test_succeeded", "last_test_message"])
		raise
	config.last_tested_at = timezone.now()
	config.last_test_succeeded = True
	config.last_test_message = "SMTP connection succeeded."
	config.save(update_fields=["last_tested_at", "last_test_succeeded", "last_test_message"])


def send_test_email(config: EmailSettings) -> None:
	email = EmailMultiAlternatives(
		subject="[IRDM] SMTP test email",
		body="Cấu hình SMTP của Website IRDM đang hoạt động.",
		from_email=_from_email(config),
		to=[config.contact_recipient],
		connection=_connection(config),
	)
	email.send(fail_silently=False)


def send_contact_notification(contact_request: ContactRequest) -> bool:
	config = EmailSettings.get_solo()
	if not config or not config.enabled:
		contact_request.notification_status = ContactRequest.NotificationStatus.DISABLED
		contact_request.notification_error = "Email notifications are not configured or are disabled."
		contact_request.save(update_fields=["notification_status", "notification_error"])
		return False

	contact_request.notification_attempts += 1
	try:
		subject_name = contact_request.full_name.replace("\r", " ").replace("\n", " ")
		subject = f"[IRDM] Yêu cầu hợp tác mới - {subject_name} - {contact_request.get_inquiry_type_display()}"
		context = {"contact_request": contact_request}
		email = EmailMultiAlternatives(
			subject=subject,
			body=render_to_string("contact/email/request.txt", context),
			from_email=_from_email(config),
			to=[config.contact_recipient],
			reply_to=[contact_request.email],
			connection=_connection(config),
		)
		email.attach_alternative(render_to_string("contact/email/request.html", context), "text/html")
		email.send(fail_silently=False)
	except Exception as exc:
		contact_request.notification_status = ContactRequest.NotificationStatus.FAILED
		contact_request.notification_error = f"{type(exc).__name__}: {exc}"[:2000]
		contact_request.save(update_fields=[
			"notification_status", "notification_attempts", "notification_error",
		])
		logger.exception("Unable to send contact notification for request %s", contact_request.pk)
		return False

	contact_request.notification_status = ContactRequest.NotificationStatus.SENT
	contact_request.notification_sent_at = timezone.now()
	contact_request.notification_error = ""
	contact_request.save(update_fields=[
		"notification_status", "notification_sent_at", "notification_attempts", "notification_error",
	])
	return True
