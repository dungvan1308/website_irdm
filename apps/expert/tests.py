from django.test import TestCase, override_settings
from django.urls import reverse

from .models import Expert, ExpertListingPage, ResearchArea


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


@override_settings(
	STORAGES={
		"default": {"BACKEND": "django.core.files.storage.FileSystemStorage"},
		"staticfiles": {"BACKEND": "django.contrib.staticfiles.storage.StaticFilesStorage"},
	}
)
class ExpertListingHeroTests(TestCase):
	def setUp(self):
		ExpertListingPage.objects.create(
			hero_badge_text="Đội ngũ chuyên gia",
			hero_heading="MẠNG LƯỚI NHÀ KHOA HỌC\n& CHUYÊN GIA LIÊN NGÀNH",
			hero_description="Nội dung giới thiệu mạng lưới chuyên gia.",
			hero_btn1_label="Tìm chuyên gia",
			hero_btn1_url="#tim-kiem",
			hero_btn1_icon="arrow-right",
			hero_btn2_label="Xem lĩnh vực chuyên môn",
			hero_btn2_url="#ban-do-chuyen-mon",
			hero_btn2_icon="arrow-right",
			is_active=True,
		)
		ResearchArea.objects.create(
			name="Y tế và sức khỏe",
			slug="y-te-suc-khoe",
			is_active=True,
		)

	def test_hero_uses_light_figma_styling(self):
		response = self.client.get(reverse("expert:listing"))

		self.assertEqual(response.status_code, 200)
		self.assertContains(response, "bg-blue-50 min-h-[620px]")
		self.assertContains(response, "text-[#094977] uppercase tracking-normal")
		self.assertNotContains(response, "from-primary-950/90")
		self.assertNotContains(response, "text-white uppercase mb-5")

	def test_hero_ctas_target_matching_sections(self):
		response = self.client.get(reverse("expert:listing"))

		self.assertContains(response, 'href="#tim-kiem"')
		self.assertContains(response, 'id="tim-kiem"', count=1)
		self.assertContains(response, 'href="#ban-do-chuyen-mon"')
		self.assertContains(response, 'id="ban-do-chuyen-mon"', count=1)
