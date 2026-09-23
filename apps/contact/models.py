"""Models for public contact enquiries."""

from django.db import models
from django.utils.translation import gettext_lazy as _


class EmailSettings(models.Model):
	class Security(models.TextChoices):
		STARTTLS = "tls", "STARTTLS"
		SSL = "ssl", "SSL/TLS"
		NONE = "none", _("No encryption")

	enabled = models.BooleanField(_("enable email notifications"), default=False)
	host = models.CharField(_("SMTP host"), max_length=255, default="smtp.gmail.com")
	port = models.PositiveIntegerField(_("SMTP port"), default=587)
	security = models.CharField(
		_("security"), max_length=10, choices=Security.choices, default=Security.STARTTLS,
	)
	username = models.EmailField(_("SMTP username"), blank=True)
	encrypted_password = models.TextField(_("encrypted SMTP password"), blank=True, editable=False)
	from_name = models.CharField(_("sender name"), max_length=100, default="Website IRDM")
	from_email = models.EmailField(_("sender email"), blank=True)
	contact_recipient = models.EmailField(
		_("contact notification recipient"), default="vienncptnlv@irdm.edu.vn",
	)
	timeout = models.PositiveIntegerField(_("timeout (seconds)"), default=10)
	last_tested_at = models.DateTimeField(_("last tested at"), null=True, blank=True, editable=False)
	last_test_succeeded = models.BooleanField(_("last test succeeded"), null=True, editable=False)
	last_test_message = models.CharField(_("last test message"), max_length=500, blank=True, editable=False)

	class Meta:
		verbose_name = _("email configuration")
		verbose_name_plural = _("email configuration")

	def save(self, *args, **kwargs):
		self.pk = 1
		return super().save(*args, **kwargs)

	@classmethod
	def get_solo(cls):
		return cls.objects.filter(pk=1).first()

	def __str__(self) -> str:
		return str(_("Email configuration"))


class ContactRequest(models.Model):
	class InquiryType(models.TextChoices):
		CONSULTING = "consulting", _("Tư vấn và thiết kế giải pháp")
		RESEARCH = "research", _("Nghiên cứu và hợp tác chuyên môn")
		TRAINING = "training", _("Đào tạo và phát triển năng lực")
		EXPERT = "expert", _("Kết nối chuyên gia")
		OTHER = "other", _("Nhu cầu khác")

	class Status(models.TextChoices):
		NEW = "new", _("Mới tiếp nhận")
		IN_PROGRESS = "in_progress", _("Đang xử lý")
		COMPLETED = "completed", _("Đã hoàn tất")

	class NotificationStatus(models.TextChoices):
		PENDING = "pending", _("Pending")
		SENT = "sent", _("Sent")
		FAILED = "failed", _("Failed")
		DISABLED = "disabled", _("Email disabled")

	full_name = models.CharField(_("full name"), max_length=200)
	email = models.EmailField(_("email"))
	phone = models.CharField(_("phone"), max_length=50, blank=True)
	organization = models.CharField(_("organization"), max_length=300, blank=True)
	inquiry_type = models.CharField(
		_("inquiry type"),
		max_length=30,
		choices=InquiryType.choices,
	)
	message = models.TextField(_("message"))
	status = models.CharField(
		_("status"),
		max_length=20,
		choices=Status.choices,
		default=Status.NEW,
		db_index=True,
	)
	source_url = models.CharField(_("source URL"), max_length=500, blank=True)
	notification_status = models.CharField(
		_("email notification status"),
		max_length=20,
		choices=NotificationStatus.choices,
		default=NotificationStatus.PENDING,
		db_index=True,
	)
	notification_sent_at = models.DateTimeField(_("email sent at"), null=True, blank=True)
	notification_attempts = models.PositiveIntegerField(_("email attempts"), default=0)
	notification_error = models.TextField(_("email error"), blank=True)
	created_at = models.DateTimeField(_("created at"), auto_now_add=True, db_index=True)
	updated_at = models.DateTimeField(_("updated at"), auto_now=True)

	class Meta:
		ordering = ["-created_at"]
		verbose_name = _("contact request")
		verbose_name_plural = _("contact requests")

	def __str__(self) -> str:
		return f"{self.full_name} - {self.get_inquiry_type_display()}"
