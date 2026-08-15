from datetime import date

from django.test import TestCase, override_settings
from django.urls import reverse

from .models import (
	KnowledgeActivityNews,
	KnowledgeContentTypeCard,
	KnowledgeDownloadRequest,
	KnowledgeListingPage,
)


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


@override_settings(
	STORAGES={
		"default": {"BACKEND": "django.core.files.storage.FileSystemStorage"},
		"staticfiles": {"BACKEND": "django.contrib.staticfiles.storage.StaticFilesStorage"},
	}
)
class KnowledgeDownloadRequestTests(TestCase):
	def setUp(self):
		self.listing_page = KnowledgeListingPage.objects.create(
			heading="Tri thức & Góc nhìn ngành",
			hero_cta_primary_label="Khám phá tri thức",
			hero_cta_primary_url="#kham-pha-loai-noi-dung",
			hero_cta_secondary_label="Đăng ký tải tài liệu",
			hero_cta_secondary_url="#tai-lieu-tai-ve",
			pub_section_heading="Tài liệu tải về",
			is_active=True,
		)
		KnowledgeContentTypeCard.objects.create(
			listing_page=self.listing_page,
			title="Báo cáo & tài liệu",
			is_published=True,
			is_active=True,
		)

	def test_primary_cta_targets_content_type_section(self):
		response = self.client.get(reverse("knowledge:listing"))

		self.assertEqual(response.status_code, 200)
		self.assertContains(response, 'href="#kham-pha-loai-noi-dung"')
		self.assertContains(response, 'id="kham-pha-loai-noi-dung"', count=1)
		self.assertNotContains(response, 'href="#featured"')

	def test_download_cta_targets_publication_section(self):
		response = self.client.get(reverse("knowledge:listing"))

		self.assertEqual(response.status_code, 200)
		self.assertContains(response, 'href="#tai-lieu-tai-ve"')
		self.assertContains(response, 'id="tai-lieu-tai-ve"')
		self.assertContains(response, 'class="relative scroll-mt-24')

	def test_valid_download_request_is_saved_and_returns_to_section(self):
		response = self.client.post(
			reverse("knowledge:listing"),
			{
				"full_name": "Nguyễn Văn A",
				"organization": "Đơn vị A",
				"email": "reader@example.com",
				"note": "Quan tâm báo cáo thường niên",
			},
		)

		self.assertRedirects(
			response,
			f'{reverse("knowledge:listing")}?pub_form=success#tai-lieu-tai-ve',
			fetch_redirect_response=False,
		)
		self.assertTrue(
			KnowledgeDownloadRequest.objects.filter(email="reader@example.com").exists()
		)

	def test_invalid_download_request_renders_errors_at_section(self):
		response = self.client.post(
			reverse("knowledge:listing"),
			{"full_name": "", "organization": "", "email": "invalid-email"},
		)

		self.assertEqual(response.status_code, 200)
		self.assertContains(response, 'id="tai-lieu-tai-ve"')
		self.assertIn("email", response.context["pub_form"].errors)
		self.assertEqual(KnowledgeDownloadRequest.objects.count(), 0)
