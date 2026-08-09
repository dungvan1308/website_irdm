from django.test import TestCase, override_settings
from django.urls import reverse

from .models import ContactRequest


@override_settings(
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
