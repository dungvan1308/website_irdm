from datetime import date
import base64
from io import BytesIO
import shutil
import tempfile
from unittest.mock import patch

from django import forms
from django.test import TestCase, override_settings
from django.urls import reverse
from django.core.files.uploadedfile import SimpleUploadedFile
from django.contrib.auth import get_user_model
from PIL import Image

from .forms import KnowledgeArticleAdminForm, KnowledgeNewsItemAdminForm
from .models import (
	KnowledgeArticle,
	KnowledgeActivityNews,
	KnowledgeContentTypeCard,
	KnowledgeDownloadRequest,
	KnowledgeListingPage,
	KnowledgeNewsItem,
)
from .rich_text import RichTextImageError, _validate_public_host, normalize_rich_text, sanitize_rich_text


@override_settings(
	STORAGES={
		"default": {"BACKEND": "django.core.files.storage.FileSystemStorage"},
		"staticfiles": {"BACKEND": "django.contrib.staticfiles.storage.StaticFilesStorage"},
	}
)
class RichTextNormalizationTests(TestCase):
	def setUp(self):
		self.media_root = tempfile.mkdtemp()
		self.settings_override = override_settings(MEDIA_ROOT=self.media_root)
		self.settings_override.enable()

	def tearDown(self):
		self.settings_override.disable()
		shutil.rmtree(self.media_root, ignore_errors=True)

	def test_plain_text_is_converted_to_paragraphs(self):
		result = normalize_rich_text("Đoạn một.\n\nĐoạn hai.\nDòng tiếp theo.")

		self.assertEqual(result, "<p>Đoạn một.</p><p>Đoạn hai.<br>Dòng tiếp theo.</p>")
		self.assertEqual(sanitize_rich_text("Nội dung từ seed."), "<p>Nội dung từ seed.</p>")

	def test_unsafe_html_is_removed(self):
		result = normalize_rich_text(
			'<p onclick="alert(1)">Nội dung</p><script>alert(1)</script>'
			'<a href="javascript:alert(1)">Link</a>'
		)

		self.assertIn("<p>Nội dung</p>", result)
		self.assertNotIn("script", result)
		self.assertNotIn("onclick", result)
		self.assertNotIn("javascript:", result)

	def test_clipboard_image_is_saved_to_media(self):
		buffer = BytesIO()
		Image.new("RGB", (2, 2), "red").save(buffer, format="PNG")
		payload = base64.b64encode(buffer.getvalue()).decode("ascii")

		result = normalize_rich_text(
			f'<figure class="image"><img src="data:image/png;base64,{payload}" alt="Ảnh"><figcaption>Chú thích</figcaption></figure>'
		)

		self.assertIn('src="/media/knowledge/articles/body/', result)
		self.assertIn("<figcaption>Chú thích</figcaption>", result)
		self.assertNotIn("data:image", result)

	def test_remote_pasted_image_is_copied_to_media(self):
		buffer = BytesIO()
		Image.new("RGB", (2, 2), "green").save(buffer, format="PNG")

		with patch("apps.knowledge.rich_text._download_remote_image", return_value=buffer.getvalue()):
			result = normalize_rich_text(
				'<p>Nội dung</p><img src="https://news.example.com/photo.png" alt="Ảnh nguồn">'
			)

		self.assertIn('src="/media/knowledge/articles/body/', result)
		self.assertNotIn("news.example.com", result)

	@patch("apps.knowledge.rich_text.socket.getaddrinfo")
	def test_private_image_host_is_rejected(self, getaddrinfo):
		getaddrinfo.return_value = [(None, None, None, None, ("127.0.0.1", 0))]

		with self.assertRaises(RichTextImageError):
			_validate_public_host("internal.example")

	def test_article_admin_form_sanitizes_body(self):
		form = KnowledgeArticleAdminForm(data={
			"title": "Bài rich text",
			"slug": "bai-rich-text",
			"summary": '<p>Tóm tắt <strong>in đậm</strong>.</p><script>alert(1)</script>',
			"body": '<h2>Tiêu đề</h2><p onclick="alert(1)">Nội dung</p>',
			"read_time": 5,
			"display_order": 0,
		})

		self.assertTrue(form.is_valid(), form.errors)
		self.assertIn("width: 100%", form.fields["title"].widget.attrs["style"])
		self.assertIn("width: 100%", form.fields["slug"].widget.attrs["style"])
		self.assertEqual(form.cleaned_data["summary"], "<p>Tóm tắt <strong>in đậm</strong>.</p>")
		self.assertEqual(form.cleaned_data["body"], "<h2>Tiêu đề</h2><p>Nội dung</p>")

	def test_news_admin_form_uses_wide_widgets_and_sanitizes_summary(self):
		form = KnowledgeNewsItemAdminForm(data={
			"title": "Tin tức có tiêu đề dài",
			"slug": "tin-tuc-co-tieu-de-dai",
			"summary": '<p>Nội dung <strong>quan trọng</strong>.</p><script>alert(1)</script>',
			"source_url": "https://example.com/tin-tuc",
			"display_order": 0,
		})

		self.assertTrue(form.is_valid(), form.errors)
		self.assertIsInstance(form.fields["title"].widget, forms.Textarea)
		self.assertEqual(form.fields["title"].widget.attrs["rows"], 2)
		self.assertIn("width: 100%", form.fields["source_url"].widget.attrs["style"])
		self.assertEqual(
			form.cleaned_data["summary"],
			"<p>Nội dung <strong>quan trọng</strong>.</p>",
		)

	def test_article_detail_renders_sanitized_rich_html(self):
		article = KnowledgeArticle.objects.create(
			title="Bài hiển thị HTML",
			slug="bai-hien-thi-html",
			summary='<p>Dòng một<br>Dòng hai <strong>in đậm</strong>.</p><script>alert(1)</script>',
			body='<h2>Tiêu đề phần</h2><p>Nội dung <strong>quan trọng</strong>.</p><script>alert(1)</script>',
			is_published=True,
			is_active=True,
		)

		response = self.client.get(article.get_absolute_url())

		self.assertContains(response, "<h2>Tiêu đề phần</h2>", html=True)
		self.assertContains(response, "<strong>quan trọng</strong>", html=True)
		self.assertContains(response, "Dòng một<br>Dòng hai <strong>in đậm</strong>.", html=True)
		self.assertNotContains(response, "<script>")

	def test_news_listing_renders_sanitized_rich_summary(self):
		KnowledgeNewsItem.objects.create(
			title="Tin có tóm tắt định dạng",
			slug="tin-co-tom-tat-dinh-dang",
			summary='<p>Dòng một<br>Dòng hai <strong>in đậm</strong>.</p><script>alert(1)</script>',
			is_press_article=True,
			is_published=True,
			is_active=True,
		)

		response = self.client.get(reverse("knowledge:listing"))

		self.assertContains(response, "Dòng một<br>Dòng hai <strong>in đậm</strong>.", html=True)
		self.assertNotContains(response, "<script>")

	def test_ckeditor_upload_requires_staff_and_stores_image(self):
		buffer = BytesIO()
		Image.new("RGB", (2, 2), "blue").save(buffer, format="PNG")
		upload = SimpleUploadedFile("clipboard.png", buffer.getvalue(), content_type="image/png")
		upload_url = reverse("ck_editor_5_upload_file")

		anonymous_response = self.client.post(upload_url, {"upload": upload})
		self.assertEqual(anonymous_response.status_code, 403)

		user = get_user_model().objects.create_user(
			username="content-editor", password="test-password", is_staff=True,
		)
		self.client.force_login(user)
		upload.seek(0)
		staff_response = self.client.post(upload_url, {"upload": upload})

		self.assertEqual(staff_response.status_code, 200)
		self.assertTrue(staff_response.json()["url"].startswith("/media/knowledge/articles/body/"))


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
