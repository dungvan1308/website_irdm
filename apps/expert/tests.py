from django.test import TestCase, override_settings
from django.urls import reverse

from .models import Expert


@override_settings(DEBUG=True)
class ExpertDetailErrorPageTests(TestCase):
	def test_unpublished_expert_uses_friendly_404_page(self):
		expert = Expert.objects.create(
			name="Chuyên gia bản nháp",
			slug="chuyen-gia-ban-nhap",
			is_active=True,
			is_published=False,
		)

		response = self.client.get(
			reverse("expert:detail", kwargs={"slug": expert.slug})
		)

		self.assertEqual(response.status_code, 404)
		self.assertTemplateUsed(response, "errors/404.html")
		self.assertContains(
			response,
			"Nội dung hiện chưa khả dụng",
			status_code=404,
		)
