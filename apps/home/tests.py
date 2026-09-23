from django.core.files.uploadedfile import SimpleUploadedFile
from django.test import TestCase
from django.urls import reverse

from .models import (
	EvidenceSectionHeader,
	PartnerCooperationItem,
	PartnerLogo,
	PartnerPageConfig,
	PartnerPageStatistic,
	StatisticItem,
)


class PartnerPageTests(TestCase):
	def setUp(self):
		EvidenceSectionHeader.objects.create(
			section_label="Bằng chứng năng lực",
			heading="Tiêu đề chỉ dành cho homepage",
			description="Hợp tác dựa trên nhu cầu thực tiễn.",
			partners_label="Đối tác tiêu biểu",
			is_active=True,
		)
		self.partner_page = PartnerPageConfig.objects.get()
		self.partner_page.meta_title = "Đối tác IRDM"
		self.partner_page.hero_label = "Mạng lưới hợp tác"
		self.partner_page.hero_heading = "Nội dung riêng của trang Đối tác"
		self.partner_page.hero_description = "Mô tả trang đối tác."
		self.partner_page.partners_label = "Đối tác tiêu biểu"
		self.partner_page.partners_heading = "Mạng lưới đa ngành"
		self.partner_page.cooperation_heading = "Hợp tác thực tiễn"
		self.partner_page.cta_heading = "Cùng hợp tác"
		self.partner_page.cta_button_label = "Liên hệ"
		self.partner_page.is_active = True
		self.partner_page.save()
		self.partner_page.statistics.all().delete()
		self.partner_page.cooperation_items.all().delete()
		self.active_partner = PartnerLogo.objects.create(
			name="Đối tác đang hoạt động",
			logo=SimpleUploadedFile("active.gif", b"GIF89a", content_type="image/gif"),
			is_active=True,
		)
		PartnerLogo.objects.create(
			name="Đối tác đã ẩn",
			logo=SimpleUploadedFile("hidden.gif", b"GIF89a", content_type="image/gif"),
			is_active=False,
		)
		StatisticItem.objects.create(value="99+", label="Thống kê homepage", is_active=True)
		PartnerPageStatistic.objects.create(
			page=self.partner_page, value="12+", label="Đối tác", is_active=True,
		)
		PartnerCooperationItem.objects.create(
			page=self.partner_page,
			number=1,
			title="Nghiên cứu ứng dụng",
			description="Nội dung hợp tác riêng.",
			is_active=True,
		)

	def test_partner_page_renders_active_cms_content(self):
		response = self.client.get(reverse("home:partners"))

		self.assertEqual(response.status_code, 200)
		self.assertTemplateUsed(response, "home/partners.html")
		self.assertContains(response, "Nội dung riêng của trang Đối tác")
		self.assertContains(response, self.active_partner.name)
		self.assertContains(response, "12+")
		self.assertContains(response, "Nghiên cứu ứng dụng")
		self.assertNotContains(response, "Tiêu đề chỉ dành cho homepage")
		self.assertNotContains(response, "99+")
		self.assertNotContains(response, "Đối tác đã ẩn")
