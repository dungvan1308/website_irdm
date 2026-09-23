from unittest.mock import patch

from django.contrib.auth import get_user_model
from django.core import mail
from django.test import TestCase, override_settings
from django.urls import reverse

from .forms import EmailSettingsAdminForm
from .models import ContactRequest, EmailSettings
from .services import decrypt_password, encrypt_password, send_test_email


@override_settings(
	EMAIL_BACKEND="django.core.mail.backends.locmem.EmailBackend",
	EMAIL_CREDENTIAL_KEY="contact-test-encryption-key",
	STORAGES={
		"default": {
			"BACKEND": "django.core.files.storage.FileSystemStorage",
		},
		"staticfiles": {
			"BACKEND": "django.contrib.staticfiles.storage.StaticFilesStorage",
		},
	},
)
class ContactPageTests(TestCase):
	def setUp(self):
		self.url = reverse("contact:index")
		self.email_settings, _ = EmailSettings.objects.update_or_create(
			pk=1,
			defaults={
				"enabled": True,
				"host": "smtp.gmail.com",
				"port": 587,
				"security": EmailSettings.Security.STARTTLS,
				"username": "supportirdm@gmail.com",
				"encrypted_password": encrypt_password("gmail-app-password"),
				"from_name": "Website IRDM",
				"from_email": "supportirdm@gmail.com",
				"contact_recipient": "vienncptnlv@irdm.edu.vn",
			},
		)

	def test_contact_page_renders_form(self):
		response = self.client.get(self.url)

		self.assertEqual(response.status_code, 200)
		self.assertTemplateUsed(response, "contact/index.html")
		self.assertContains(response, "Cùng bắt đầu một cuộc trao đổi có giá trị")
		self.assertContains(response, 'name="csrfmiddlewaretoken"')

	def test_valid_submission_creates_request_and_redirects_to_success(self):
		response = self.client.post(
			self.url,
			{
				"full_name": "Nguyễn Văn A",
				"email": "nguyenvana@example.com",
				"phone": "0900000000",
				"organization": "Bệnh viện A",
				"inquiry_type": ContactRequest.InquiryType.CONSULTING,
				"message": "Chúng tôi cần trao đổi về một chương trình chuyển đổi dài hạn.",
				"source_url": "/giai-phap/",
			},
		)

		self.assertRedirects(
			response,
			f"{self.url}?sent=1#contact-form",
			fetch_redirect_response=False,
		)
		request = ContactRequest.objects.get()
		self.assertEqual(request.full_name, "Nguyễn Văn A")
		self.assertEqual(request.status, ContactRequest.Status.NEW)
		self.assertEqual(request.source_url, "/giai-phap/")
		self.assertEqual(request.notification_status, ContactRequest.NotificationStatus.SENT)
		self.assertEqual(request.notification_attempts, 1)
		self.assertIsNotNone(request.notification_sent_at)
		self.assertEqual(len(mail.outbox), 1)
		email = mail.outbox[0]
		self.assertEqual(email.to, ["vienncptnlv@irdm.edu.vn"])
		self.assertEqual(email.reply_to, ["nguyenvana@example.com"])
		self.assertIn("Nguyễn Văn A", email.body)
		self.assertIn("0900000000", email.body)
		self.assertIn("Bệnh viện A", email.body)
		self.assertIn("Tư vấn và thiết kế giải pháp", email.body)
		self.assertIn("chương trình chuyển đổi dài hạn", email.body)
		self.assertIn("/giai-phap/", email.body)

		success_response = self.client.get(f"{self.url}?sent=1")
		self.assertContains(success_response, "IRDM đã nhận được thông tin")

	def test_invalid_submission_does_not_create_request(self):
		response = self.client.post(
			self.url,
			{
				"full_name": "Nguyễn Văn A",
				"email": "not-an-email",
				"inquiry_type": ContactRequest.InquiryType.OTHER,
				"message": "Quá ngắn",
			},
		)

		self.assertEqual(response.status_code, 400)
		self.assertContains(response, "Vui lòng nhập nội dung ít nhất 20 ký tự.", status_code=400)
		self.assertEqual(ContactRequest.objects.count(), 0)
		self.assertEqual(len(mail.outbox), 0)

	def test_smtp_password_is_encrypted_at_rest(self):
		self.assertNotIn("gmail-app-password", self.email_settings.encrypted_password)
		self.assertEqual(decrypt_password(self.email_settings.encrypted_password), "gmail-app-password")

	def test_email_settings_form_encrypts_new_app_password(self):
		form = EmailSettingsAdminForm(
			instance=self.email_settings,
			data={
				"enabled": True,
				"host": "smtp.gmail.com",
				"port": 587,
				"security": EmailSettings.Security.STARTTLS,
				"username": "supportirdm@gmail.com",
				"smtp_password": "new-gmail-app-password",
				"from_name": "Website IRDM",
				"from_email": "supportirdm@gmail.com",
				"contact_recipient": "vienncptnlv@irdm.edu.vn",
				"timeout": 10,
			},
		)

		self.assertTrue(form.is_valid(), form.errors)
		config = form.save()
		self.assertNotIn("new-gmail-app-password", config.encrypted_password)
		self.assertEqual(decrypt_password(config.encrypted_password), "new-gmail-app-password")

	def test_test_email_uses_configured_recipient(self):
		send_test_email(self.email_settings)

		self.assertEqual(len(mail.outbox), 1)
		self.assertEqual(mail.outbox[0].to, ["vienncptnlv@irdm.edu.vn"])

	def test_email_settings_admin_is_superuser_only_and_hides_password(self):
		admin_url = reverse("admin:contact_emailsettings_change", args=[self.email_settings.pk])
		staff_user = get_user_model().objects.create_user(
			username="contact-staff", password="test-password", is_staff=True,
		)
		self.client.force_login(staff_user)
		self.assertEqual(self.client.get(admin_url).status_code, 403)

		superuser = get_user_model().objects.create_superuser(
			username="contact-admin", password="test-password", email="admin@example.com",
		)
		self.client.force_login(superuser)
		response = self.client.get(admin_url)

		self.assertEqual(response.status_code, 200)
		self.assertContains(response, 'name="smtp_password"')
		self.assertContains(response, 'name="_test_connection"')
		self.assertContains(response, 'name="_send_test_email"')
		self.assertNotContains(response, self.email_settings.encrypted_password)

	@patch("apps.contact.services.EmailMultiAlternatives.send", side_effect=OSError("SMTP unavailable"))
	def test_smtp_failure_keeps_request_and_records_failure(self, send):
		response = self.client.post(
			self.url,
			{
				"full_name": "Nguyễn Văn B",
				"email": "nguyenvanb@example.com",
				"inquiry_type": ContactRequest.InquiryType.RESEARCH,
				"message": "Chúng tôi cần trao đổi về hợp tác nghiên cứu dài hạn.",
			},
		)

		self.assertEqual(response.status_code, 302)
		request = ContactRequest.objects.get()
		self.assertEqual(request.notification_status, ContactRequest.NotificationStatus.FAILED)
		self.assertEqual(request.notification_attempts, 1)
		self.assertIn("SMTP unavailable", request.notification_error)
