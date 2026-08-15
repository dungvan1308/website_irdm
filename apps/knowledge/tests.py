from datetime import date

from django.test import TestCase, override_settings
from django.urls import reverse

from .models import KnowledgeActivityNews


@override_settings(
	STORAGES={
		"default": {"BACKEND": "django.core.files.storage.FileSystemStorage"},
		"staticfiles": {"BACKEND": "django.contrib.staticfiles.storage.StaticFilesStorage"},
	}
)
class KnowledgeActivityNewsDetailTests(TestCase):
	def setUp(self):
		self.activity = KnowledgeActivityNews.objects.create(
			title="IRDM triển khai hoạt động nghiên cứu",
			slug="irdm-trien-khai-hoat-dong-nghien-cuu",
			summary="Tóm tắt tin hoạt động.",
			body="Đoạn nội dung thứ nhất.\n\nĐoạn nội dung thứ hai.",
			published_date=date(2026, 8, 15),
			is_published=True,
			is_active=True,
		)

	def test_published_activity_detail_is_visible(self):
		response = self.client.get(self.activity.get_absolute_url())

		self.assertEqual(response.status_code, 200)
		self.assertContains(response, self.activity.title)
		self.assertContains(response, "Đoạn nội dung thứ nhất.")
		self.assertTemplateUsed(response, "knowledge/activity_detail.html")

	def test_unpublished_activity_detail_returns_404(self):
		self.activity.is_published = False
		self.activity.save(update_fields=["is_published"])

		response = self.client.get(self.activity.get_absolute_url())

		self.assertEqual(response.status_code, 404)

	def test_internal_cta_uses_detail_page(self):
		self.assertEqual(self.activity.get_cta_url(), self.activity.get_absolute_url())
		self.assertEqual(self.activity.get_cta_target(), "_self")

	def test_custom_cta_url_is_preserved(self):
		self.activity.cta_url = "https://example.com/tin-goc"
		self.activity.cta_target = "_blank"

		self.assertEqual(self.activity.get_cta_url(), "https://example.com/tin-goc")
		self.assertEqual(self.activity.get_cta_target(), "_blank")

	def test_listing_links_activity_to_resolved_url(self):
		response = self.client.get(reverse("knowledge:listing"))

		self.assertEqual(response.status_code, 200)
		self.assertContains(response, f'href="{self.activity.get_absolute_url()}"', count=3)
		self.assertContains(
			response,
			'class="flex-shrink-0 w-36 h-24 rounded-lg overflow-hidden bg-slate-100 block"',
		)
