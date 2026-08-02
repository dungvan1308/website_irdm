"""
Management command: seed_about

Populates the database with realistic About page content matching the Figma design.
Safe to run multiple times — uses get_or_create to avoid duplicates.
"""

from django.core.management.base import BaseCommand

from apps.about.models import (
    AboutCTABanner,
    AboutCapabilityEcosystem,
    AboutContactBanner,
    AboutCoreValue,
    AboutCoreValueSection,
    AboutEcosystemPartnerGroup,
    AboutEcosystemPartnerItem,
    AboutEcosystemStatistic,
    AboutHero,
    AboutHeroStatistic,
    AboutHighlightCard,
    AboutIntroduction,
    AboutLegalInfo,
    AboutLegalBadge,
    AboutLegalOrgAttribute,
    AboutLegalTimelineItem,
    AboutNetworkSectionHeader,
    AboutPageSEO,
    AboutPartnerBenefit,
    AboutPartnerBenefitSection,
    AboutProfessionalNetwork,
    AboutPurpose,
    AboutTargetAudience,
    AboutTargetAudienceSection,
    AboutVisionMission,
    AboutVisionMissionCard,
    AboutVisionMissionIcon,
)


class Command(BaseCommand):
    help = "Seed the database with initial About page content."

    def handle(self, *args, **options) -> None:
        self.stdout.write("Seeding About page data...")
        self._seed_seo()
        self._seed_hero()
        self._seed_introduction()
        self._seed_purpose()
        self._seed_vision_mission()
        self._seed_core_values()
        self._seed_legal()
        self._seed_cta()
        self._seed_partner_benefits()
        self._seed_network()
        self._seed_target_audience()
        self._seed_ecosystem()
        self._seed_contact()
        self.stdout.write(self.style.SUCCESS("About page seeded successfully."))

    # ─── SEO ──────────────────────────────────────────────────────────────────

    def _seed_seo(self) -> None:
        AboutPageSEO.objects.get_or_create(
            meta_title="Về IRDM — Viện Nghiên cứu Phát triển Liên ngành",
            defaults={
                "meta_description": "Tìm hiểu về sứ mệnh, tầm nhìn, giá trị cốt lõi và đội ngũ của Viện Nghiên cứu & Phát triển Liên ngành (IRDM).",
                "meta_keywords": "IRDM, viện nghiên cứu, phát triển liên ngành, về IRDM",
                "og_title": "Về IRDM — Viện Nghiên cứu Phát triển Liên ngành",
                "og_description": "Khám phá sứ mệnh, tầm nhìn và hệ sinh thái tri thức của IRDM.",
                "is_active": True,
            }
        )
        self.stdout.write("  ✓ SEO")

    # ─── Hero ─────────────────────────────────────────────────────────────────

    def _seed_hero(self) -> None:
        hero, _ = AboutHero.objects.get_or_create(
            title="VỀ IRDM",
            defaults={
                "eyebrow": "Viện nghiên cứu, khoa học, công nghệ và đổi mới sáng tạo định hướng ứng dụng",
                "subtitle": "Kết nối Tri thức — Kiến tạo Tác động",
                "description": (
                    "Kết nối nghiên cứu, dữ liệu, công nghệ và phát triển con người để kiến tạo giải pháp có thể triển khai.\n\n"
                    "IRDM đồng hành cùng cơ quan quản lý, hệ thống y tế, cơ sở giáo dục, doanh nghiệp và tổ chức "
                    "quốc tế trong các bài toán cần bằng chứng khoa học, dữ liệu đáng tin cậy, năng lực chuyên gia "
                    "phù hợp và lộ trình triển khai sát bối cảnh thực tiễn."
                ),
                "primary_cta_label": "Khám phá năng lực IRDM",
                "primary_cta_url": "/capabilities/",
                "secondary_cta_label": "Xem Giải pháp",
                "secondary_cta_url": "/giai-phap/",
                "quote_text": "TỪ NGHIÊN CỨU ĐẾN TÁC ĐỘNG Ở TẦM HỆ THỐNG",
                "quote_show": True,
                "is_active": True,
                "display_order": 0,
            }
        )
        # Update existing record if title matches
        if not _:
            hero.eyebrow = "Viện nghiên cứu, khoa học, công nghệ và đổi mới sáng tạo định hướng ứng dụng"
            hero.description = (
                "Kết nối nghiên cứu, dữ liệu, công nghệ và phát triển con người để kiến tạo giải pháp có thể triển khai.\n\n"
                "IRDM đồng hành cùng cơ quan quản lý, hệ thống y tế, cơ sở giáo dục, doanh nghiệp và tổ chức "
                "quốc tế trong các bài toán cần bằng chứng khoa học, dữ liệu đáng tin cậy, năng lực chuyên gia "
                "phù hợp và lộ trình triển khai sát bối cảnh thực tiễn."
            )
            hero.primary_cta_label = "Khám phá năng lực IRDM"
            hero.secondary_cta_label = "Xem Giải pháp"
            hero.secondary_cta_url = "/giai-phap/"
            hero.quote_text = "TỪ NGHIÊN CỨU ĐẾN TÁC ĐỘNG Ở TẦM HỆ THỐNG"
            hero.quote_show = True
            hero.save()

        stats_data = [
            ("500+", "Chuyên gia", 0),
            ("50+", "Dự án", 1),
            ("10+", "Năm", 2),
        ]
        for number, label, order in stats_data:
            AboutHeroStatistic.objects.get_or_create(
                hero=hero, label=label,
                defaults={"number": number, "display_order": order, "animation_enabled": True, "is_active": True}
            )
        self.stdout.write("  ✓ Hero")

    # ─── Introduction ─────────────────────────────────────────────────────────

    def _seed_introduction(self) -> None:
        intro, _ = AboutIntroduction.objects.get_or_create(
            title="IRDM LÀ AI?",
            defaults={
                "section_label": "NHẬN DIỆN TỔ CHỨC",
                "subtitle": "",
                "description": (
                    "Viện Nghiên cứu Phát triển Nguồn lực Việt (IRDM) là tổ chức khoa học, công nghệ và đổi mới "
                    "sáng tạo định hướng ứng dụng, hoạt động trong các lĩnh vực y tế, giáo dục, môi trường và "
                    "phát triển nguồn lực."
                ),
                "is_active": True,
                "display_order": 0,
            }
        )

        cards_data = [
            (
                "Kết nối tri thức khoa học",
                "Huy động nhà khoa học, chuyên gia liên ngành và bằng chứng từ nghiên cứu ứng dụng để định hướng giải pháp.",
                0,
            ),
            (
                "Tạo bằng chứng từ dữ liệu",
                "Chuyển hoá dữ liệu, khảo sát và kinh nghiệm thực tiễn thành Insight rõ ràng, có thể được sử dụng cho quyết định và chính sách.",
                1,
            ),
            (
                "Đồng thiết kế giải pháp có thể triển khai",
                "Thiết kế chương trình, công cụ và mô hình thí điểm phù hợp với bối cảnh, dữ liệu và năng lực con người của đối tác.",
                2,
            ),
        ]
        for title, description, order in cards_data:
            AboutHighlightCard.objects.get_or_create(
                intro=intro, title=title,
                defaults={"description": description, "display_order": order, "is_active": True}
            )
        self.stdout.write("  ✓ Introduction")

    # ─── Purpose ──────────────────────────────────────────────────────────────

    def _seed_purpose(self) -> None:
        AboutPurpose.objects.get_or_create(
            title="VÌ SAO IRDM TỒN TẠI?",
            defaults={
                "section_label": "LÝ DO TỒN TẠI",
                "description": (
                    "IRDM tồn tại để kết nối nghiên cứu, dữ liệu, công nghệ và phát triển con người trong việc "
                    "giải quyết những vấn đề thực tiễn ngày càng phức hợp của tổ chức và xã hội.\n\n"
                    "Nhiều tổ chức đã có dữ liệu, kinh nghiệm và nhu cầu đổi mới, nhưng chưa dễ chuyển hóa thành "
                    "bằng chứng, quyết định hoặc chương trình hành động rõ ràng. Nhiều sáng kiến về công nghệ, AI, "
                    "đào tạo, wellbeing hoặc phát triển bền vững có ý tưởng tốt, nhưng cần được thiết kế sát hơn "
                    "với bối cảnh vận hành, năng lực dữ liệu, năng lực con người và khả năng duy trì sau giai đoạn dự án."
                ),
                "highlight_box_text": (
                    "\"IRDM tin rằng mọi chuyển đổi bền vững đều bắt đầu từ con người.\""
                ),
                "quote_body": (
                    "Công nghệ, dữ liệu hay mô hình quản trị chỉ tạo ra tác động khi con người có đủ năng lực "
                    "để hiểu, sử dụng, thích ứng và chuyển hóa chúng thành hành động."
                ),
                "diagram_title": "3 Thành tố kết nối",
                "diagram_caption": "Ba thành tố này giao thoa để tạo ra giá trị bền vững.",
                "is_active": True,
                "display_order": 0,
            }
        )
        self.stdout.write("  ✓ Purpose")

    # ─── Vision / Mission ──────────────────────────────────────────────────────

    def _seed_vision_mission(self) -> None:
        section, _ = AboutVisionMission.objects.get_or_create(
            title="TẦM NHÌN - SỨ MỆNH - TRIẾT LÝ PHÁT TRIỂN",
            defaults={
                "section_label": "NỀN TẢNG CHIẾN LƯỢC",
                "description": "Ba trụ cột định hướng mọi hoạt động của IRDM",
                "bottom_panel_title": "Định hướng giá trị",
                "bottom_panel_description": (
                    "Mọi hoạt động của IRDM hướng đến những thay đổi bền vững, "
                    "có thể quan sát được ở cấp độ tổ chức và hệ thống."
                ),
                "bottom_panel_text": "",
                "is_active": True,
                "display_order": 0,
            }
        )
        if not _:
            # Update existing record with new fields
            section.section_label = "NỀN TẢNG CHIẾN LƯỢC"
            section.title = "TẦM NHÌN - SỨ MỆNH - TRIẾT LÝ PHÁT TRIỂN"
            section.bottom_panel_title = "Định hướng giá trị"
            section.bottom_panel_description = (
                "Mọi hoạt động của IRDM hướng đến những thay đổi bền vững, "
                "có thể quan sát được ở cấp độ tổ chức và hệ thống."
            )
            section.save()

        cards_data = [
            (
                "vision", "Tầm nhìn",
                "Trở thành tổ chức khoa học, công nghệ và đổi mới sáng tạo định hướng ứng dụng có năng lực kết nối tri thức liên ngành, dữ liệu, công nghệ và phát triển con người; góp phần kiến tạo nguồn lực bền vững và các mô hình phát triển có tác động cho Việt Nam.",
                "Định hướng tương lai", "bg-primary-900", 0,
            ),
            (
                "mission", "Sứ mệnh",
                "Đồng hành cùng các tổ chức trong việc chuyển hóa vấn đề thực tiễn thành bằng chứng, chương trình, công cụ, mô hình thí điểm và giải pháp có thể triển khai; qua đó nâng cao năng lực con người, cải thiện vận hành tổ chức và thúc đẩy phát triển bền vững.",
                "Hướng dẫn hành động", "bg-primary-900", 1,
            ),
            (
                "philosophy", "Triết lý phát triển",
                "Định hình giá trị cốt lõi - Chuyển hóa hành vi - Khai phóng tiềm năng con người.",
                "Giá trị cốt lõi", "bg-primary-900", 2,
            ),
        ]
        for card_type, title, body, highlight_label, bg_color, order in cards_data:
            card, created = AboutVisionMissionCard.objects.get_or_create(
                section=section, card_type=card_type,
                defaults={
                    "title": title, "body": body,
                    "highlight_label": highlight_label,
                    "bg_color": bg_color,
                    "display_order": order, "is_active": True,
                }
            )
            if not created:
                card.title = title
                card.body = body
                card.highlight_label = highlight_label
                card.bg_color = bg_color
                card.save()

        self.stdout.write("  ✓ Vision/Mission/Philosophy")

    # ─── Core Values ──────────────────────────────────────────────────────────

    def _seed_core_values(self) -> None:
        section, _ = AboutCoreValueSection.objects.get_or_create(
            title="GIÁ TRỊ CỐT LÕI",
            defaults={
                "section_label": "Giá trị",
                "description": (
                    "Các giá trị cốt lõi định hướng cách IRDM nghiên cứu, tư vấn, đào tạo và đồng hành cùng đối tác. "
                    "Với IRDM, giá trị không chỉ là nguyên tắc vận hành tổ chức, mà còn là nền tảng để phát triển "
                    "con người một cách chính trực, nhân văn, bền vững và có khả năng chuyển hóa."
                ),
                "is_active": True,
            }
        )
        if not _:
            section.description = (
                "Các giá trị cốt lõi định hướng cách IRDM nghiên cứu, tư vấn, đào tạo và đồng hành cùng đối tác. "
                "Với IRDM, giá trị không chỉ là nguyên tắc vận hành tổ chức, mà còn là nền tảng để phát triển "
                "con người một cách chính trực, nhân văn, bền vững và có khả năng chuyển hóa."
            )
            section.save()

        # Deactivate old values, seed 4 new Figma values
        AboutCoreValue.objects.all().update(is_active=False)

        values_data = [
            ("Chính trực", "IRDM đặt trung thực học thuật, minh bạch chuyên môn và trách nhiệm với dữ liệu, đối tác, cộng đồng thụ hưởng làm nền tảng cho mọi hoạt động.", "blue", 0),
            ("Thấu cảm", "IRDM bắt đầu từ việc lắng nghe bối cảnh, con người và nhu cầu thực tế của từng tổ chức.", "teal", 1),
            ("Cam kết phát triển bền vững", "IRDM hướng tới các giải pháp có giá trị dài hạn, sử dụng nguồn lực hiệu quả và có khả năng duy trì sau giai đoạn dự án.", "amber", 2),
            ("Chuyển hóa", "IRDM không dừng ở tri thức, báo cáo hoặc ý tưởng. Trọng tâm là chuyển hóa nghiên cứu thành bằng chứng, bằng chứng thành giải pháp và giải pháp thành thay đổi quan sát được.", "orange", 3),
        ]
        for title, description, color, order in values_data:
            obj, created = AboutCoreValue.objects.get_or_create(
                title=title,
                defaults={"description": description, "color_theme": color, "display_order": order, "is_active": True}
            )
            if not created:
                obj.description = description
                obj.color_theme = color
                obj.display_order = order
                obj.is_active = True
                obj.save()
        self.stdout.write("  ✓ Core Values")

    # ─── Legal Foundation ─────────────────────────────────────────────────────

    def _seed_legal(self) -> None:
        legal, _ = AboutLegalInfo.objects.get_or_create(
            title="PHÁP LÝ VÀ PHẠM VI HOẠT ĐỘNG",
            defaults={
                "section_label": "THÔNG TIN PHÁP LÝ",
                "description": (
                    "IRDM là tổ chức khoa học và công nghệ được thành lập, đăng ký hoạt động và vận hành theo các quy "
                    "định pháp luật hiện hành liên quan đến tổ chức khoa học và công nghệ tại Việt Nam."
                ),
                "org_card_label": "THÔNG TIN TỔ CHỨC",
                "org_name": "Viện Nghiên cứu Phát triển Nguồn lực Việt",
                "timeline_card_title": "CỘT MỐC PHÁP LÝ",
                "footer_note": (
                    "Lưu ý trước khi public: Đối chiếu lần cuối thông tin pháp lý với bản scan/hồ sơ gốc của IRDM "
                    "và đồng bộ với footer/trang Liên hệ."
                ),
                "footer_note_show": True,
                "is_active": True,
                "display_order": 0,
            }
        )
        if not _:
            legal.section_label = "THÔNG TIN PHÁP LÝ"
            legal.org_card_label = "THÔNG TIN TỔ CHỨC"
            legal.org_name = "Viện Nghiên cứu Phát triển Nguồn lực Việt"
            legal.timeline_card_title = "CỘT MỐC PHÁP LÝ"
            legal.footer_note_show = True
            legal.save()

        # Deactivate old timeline, recreate to match Figma
        AboutLegalTimelineItem.objects.filter(legal_info=legal).delete()

        # Org badges
        AboutLegalBadge.objects.filter(legal_info=legal).delete()
        for i, label in enumerate(["#IRDM", "A-2157", "0316181955"]):
            AboutLegalBadge.objects.create(legal_info=legal, label=label, display_order=i, is_active=True)

        # Org key-value attributes
        AboutLegalOrgAttribute.objects.filter(legal_info=legal).delete()
        for key, value, order in [
            ("Loại hình", "Tổ chức khoa học và công nghệ định hướng ứng dụng", 0),
            ("Mã số định danh", "079211913489", 1),
        ]:
            AboutLegalOrgAttribute.objects.create(
                legal_info=legal, key=key, value=value, display_order=order, is_active=True
            )

        # Timeline — real IRDM legal milestones per Figma
        for year, title, description, order in [
            ("2019", "Thành lập", "Quyết định thành lập số 1111/QĐ-LHHVN do Liên hiệp các Hội Khoa học và Kỹ thuật Việt Nam cấp ngày 01/11/2019.", 0),
            ("2019", "Đăng ký hoạt động KHCN", "Giấy chứng nhận đăng ký hoạt động KHCN số A-2157 do Bộ Khoa học và Công nghệ cấp ngày 29/11/2019.", 1),
            ("2020", "Đăng ký thuế", "Mã số thuế 0316181955. Giấy chứng nhận đăng ký thuế do Bộ Tài chính cấp ngày 04/03/2020.", 2),
            ("2020", "Phạm vi hoạt động", "Y tế, giáo dục, môi trường, phát triển nguồn lực, nghiên cứu ứng dụng, dữ liệu, công nghệ, phát triển năng lực và các sáng kiến KHCN&ĐMST phù hợp với chức năng của Viện.", 3),
        ]:
            AboutLegalTimelineItem.objects.create(
                legal_info=legal, year=year, title=title, description=description,
                display_order=order, is_active=True,
            )
        self.stdout.write("  ✓ Legal Foundation")

    # ─── CTA ──────────────────────────────────────────────────────────────────

    def _seed_cta(self) -> None:
        AboutCTABanner.objects.get_or_create(
            title="SẴN SÀNG HỢP TÁC CÙNG IRDM?",
            defaults={
                "description": "Hãy kết nối với chúng tôi để cùng xây dựng các giải pháp nghiên cứu và phát triển bền vững cho tổ chức của bạn.",
                "primary_cta_label": "Liên hệ ngay",
                "primary_cta_url": "/lien-he/",
                "secondary_cta_label": "Xem năng lực của IRDM",
                "secondary_cta_url": "/capabilities/",
                "is_active": True,
                "display_order": 0,
            }
        )
        self.stdout.write("  ✓ CTA Banner")

    # ─── Partner Benefits ─────────────────────────────────────────────────────

    def _seed_partner_benefits(self) -> None:
        # update_or_create so re-running the seed refreshes banner / KPI fields
        section, _ = AboutPartnerBenefitSection.objects.update_or_create(
            title="ĐỐI TÁC NHẬN ĐƯỢC GÌ KHI LÀM VIỆC VỚI IRDM?",
            defaults={
                "banner_badge": "GIÁ TRỊ ĐỐI TÁC",
                "banner_quote": (
                    "Hợp tác với IRDM giúp chúng tôi chuyển dữ liệu thành quyết định "
                    "- với bằng chứng, lộ trình và năng lực thực thi."
                ),
                "kpi_label": "KPI",
                "kpi_value": "6 giá trị cốt lõi",
                "section_label": "THÔNG TIN PHÁP LÝ",
                "description": (
                    "Viện IRDM đồng hành với đối tác theo hướng thực tế, có căn cứ và có thể kiểm chứng. "
                    "Thay vì đưa ra một giải pháp chung cho mọi tổ chức, IRDM giúp mỗi đơn vị xác định "
                    "đúng vấn đề, lựa chọn cách tiếp cận phù hợp và chuẩn bị điều kiện triển khai."
                ),
                "is_active": True,
                "display_order": 0,
            },
        )

        # Sync benefit cards to match Figma exactly (6 cards, 3×2 grid)
        figma_benefits = [
            {
                "title": "Vấn đề được làm rõ trước khi đề xuất giải pháp",
                "description": "Khảo sát, dữ liệu và thực tiễn được tổng hợp thành bằng chứng có thể sử dụng.",
                "color_theme": "teal",
                "display_order": 0,
            },
            {
                "title": "Dữ liệu, khảo sát và kinh nghiệm thực tiễn được tổ chức thành bằng chứng",
                "description": "Tổng hợp thông tin một cách có hệ thống để tạo nền tảng cho quyết định.",
                "color_theme": "blue",
                "display_order": 1,
            },
            {
                "title": "Giải pháp được đóng thiết kế theo bối cảnh vận hành",
                "description": "Phù hợp năng lực dữ liệu và năng lực con người của từng tổ chức.",
                "color_theme": "orange",
                "display_order": 2,
            },
            {
                "title": "Tổ hợp chuyên gia được huy động theo đúng bài toán",
                "description": "Thay vì theo danh sách chuyên môn có sẵn – IRDM tập hợp đúng người cho vấn đề.",
                "color_theme": "blue",
                "display_order": 3,
            },
            {
                "title": "Kết quả được theo dõi, đánh giá và chuyển hóa thành giá trị",
                "description": "Đánh giá tác động và chuyển hóa thành giá trị sử dụng trong thực tế.",
                "color_theme": "blue",
                "display_order": 4,
            },
            {
                "title": "Tư vấn chiến lược với góc nhìn thực tiễn",
                "description": "Đề xuất dựa trên dữ liệu và kinh nghiệm triển khai – giúp quyết định nhanh và chắc chắn.",
                "color_theme": "amber",
                "display_order": 5,
            },
        ]
        figma_titles = {b["title"] for b in figma_benefits}

        # Deactivate old cards that are not in the Figma list
        AboutPartnerBenefit.objects.filter(section=section).exclude(
            title__in=figma_titles
        ).update(is_active=False)

        for data in figma_benefits:
            AboutPartnerBenefit.objects.update_or_create(
                section=section,
                title=data["title"],
                defaults={
                    "description": data["description"],
                    "color_theme": data["color_theme"],
                    "display_order": data["display_order"],
                    "is_active": True,
                },
            )
        self.stdout.write("  ✓ Partner Benefits")

    # ─── Network ──────────────────────────────────────────────────────────────

    def _seed_network(self) -> None:
        AboutNetworkSectionHeader.objects.get_or_create(
            title="MẠNG LƯỚI ĐỐI TÁC & TỔ CHỨC",
            defaults={
                "section_label": "Hệ sinh thái",
                "description": "IRDM kết nối với các trường đại học, viện nghiên cứu, tổ chức quốc tế và doanh nghiệp hàng đầu",
                "cta_label": "Trở thành đối tác",
                "cta_url": "/lien-he/",
                "is_active": True,
            }
        )

        orgs_data = [
            ("Đại học Quốc gia Hà Nội", "/"),
            ("Đại học Quốc gia TP.HCM", "/"),
            ("Viện Hàn lâm KH&CN Việt Nam", "/"),
            ("Bộ Khoa học & Công nghệ", "/"),
            ("UNDP Việt Nam", "/"),
            ("World Bank Vietnam", "/"),
            ("ADB", "/"),
            ("NUS Singapore", "/"),
        ]
        for i, (name, url) in enumerate(orgs_data):
            AboutProfessionalNetwork.objects.get_or_create(
                name=name,
                defaults={"link_url": url, "display_order": i, "is_active": True}
            )
        self.stdout.write("  ✓ Professional Network")

    # ─── Target Audience ──────────────────────────────────────────────────────

    def _seed_target_audience(self) -> None:
        section, _ = AboutTargetAudienceSection.objects.get_or_create(
            title="IRDM ĐỒNG HÀNH CÙNG NHỮNG AI?",
            defaults={
                "section_label": "Đối tượng phục vụ",
                "description": "Chúng tôi hợp tác với đa dạng các tổ chức và cá nhân muốn tạo ra tác động tích cực",
                "cta_label": "Tìm hiểu cách hợp tác",
                "cta_url": "/lien-he/",
                "is_active": True,
                "display_order": 0,
            }
        )

        audiences_data = [
            ("Cơ quan Chính phủ & Bộ ngành", "Tư vấn chính sách, nghiên cứu đánh giá tác động, hỗ trợ xây dựng chiến lược phát triển quốc gia và địa phương.", "Tìm hiểu thêm", "/lien-he/", 0),
            ("Tổ chức Quốc tế & NGO", "Nghiên cứu nền tảng, đánh giá chương trình, phân tích bối cảnh để triển khai các dự án phát triển hiệu quả.", "Tìm hiểu thêm", "/lien-he/", 1),
            ("Doanh nghiệp & Tập đoàn", "Nghiên cứu thị trường, phân tích xu hướng, tư vấn chiến lược ESG và phát triển bền vững.", "Tìm hiểu thêm", "/lien-he/", 2),
            ("Trường Đại học & Viện NC", "Hợp tác nghiên cứu liên ngành, chia sẻ nguồn lực và xây dựng năng lực nghiên cứu.", "Tìm hiểu thêm", "/lien-he/", 3),
            ("Nhà khoa học & Chuyên gia", "Tham gia mạng lưới nghiên cứu, chia sẻ tri thức và đóng góp vào các dự án có tác động xã hội.", "Tham gia mạng lưới", "/chuyen-gia/", 4),
            ("Tổ chức xã hội dân sự", "Hỗ trợ nghiên cứu vận động chính sách, đánh giá nhu cầu và theo dõi tác động xã hội.", "Tìm hiểu thêm", "/lien-he/", 5),
        ]
        for title, description, cta_label, cta_url, order in audiences_data:
            AboutTargetAudience.objects.get_or_create(
                section=section, title=title,
                defaults={"description": description, "cta_label": cta_label, "cta_url": cta_url, "display_order": order, "is_active": True}
            )
        self.stdout.write("  ✓ Target Audience")

    # ─── Ecosystem ────────────────────────────────────────────────────────────

    def _seed_ecosystem(self) -> None:
        ecosystem, _ = AboutCapabilityEcosystem.objects.get_or_create(
            title="HỆ SINH THÁI NĂNG LỰC & ĐỐI TÁC",
            defaults={
                "section_label": "Hệ sinh thái",
                "description": "IRDM vận hành như một hệ sinh thái tri thức mở, kết nối nhiều tầng lớp đối tác và chuyên gia",
                "is_active": True,
                "display_order": 0,
            }
        )

        groups_data = [
            ("Nghiên cứu & Học thuật", "blue", [
                "Đại học Quốc gia Hà Nội", "Đại học Quốc gia TP.HCM",
                "Viện Hàn lâm KH&CN", "Đại học Bách khoa HN",
            ]),
            ("Tổ chức Quốc tế", "orange", [
                "UNDP", "World Bank", "ADB", "GIZ", "JICA",
            ]),
            ("Chính phủ & Nhà nước", "teal", [
                "Bộ KH&CN", "Bộ GD&ĐT", "Bộ TN&MT", "UBND các tỉnh",
            ]),
            ("Doanh nghiệp & Tư nhân", "purple", [
                "Vingroup", "FPT", "Viettel", "VNPT", "Masan Group",
            ]),
        ]
        for group_title, color, items in groups_data:
            group, _ = AboutEcosystemPartnerGroup.objects.get_or_create(
                ecosystem=ecosystem, title=group_title,
                defaults={"color": color, "is_active": True}
            )
            for i, item_name in enumerate(items):
                AboutEcosystemPartnerItem.objects.get_or_create(
                    group=group, name=item_name,
                    defaults={"display_order": i, "is_active": True}
                )

        stats_data = [
            ("500+", "Chuyên gia & Nhà khoa học", 0),
            ("50+", "Đối tác chiến lược", 1),
            ("100+", "Dự án hoàn thành", 2),
            ("15+", "Quốc gia hợp tác", 3),
        ]
        for number, label, order in stats_data:
            AboutEcosystemStatistic.objects.get_or_create(
                ecosystem=ecosystem, label=label,
                defaults={"number": number, "display_order": order, "is_active": True}
            )
        self.stdout.write("  ✓ Capability & Ecosystem")

    # ─── Contact ──────────────────────────────────────────────────────────────

    def _seed_contact(self) -> None:
        AboutContactBanner.objects.get_or_create(
            title="KẾT NỐI VỚI IRDM",
            defaults={
                "description": "Liên hệ với chúng tôi để tìm hiểu thêm về các cơ hội hợp tác và nghiên cứu",
                "hotline": "024 3826 xxxx",
                "email": "contact@irdm.vn",
                "facebook_url": "https://facebook.com/irdm.vn",
                "linkedin_url": "https://linkedin.com/company/irdm",
                "youtube_url": "https://youtube.com/@irdmvn",
                "is_active": True,
                "display_order": 0,
            }
        )
        self.stdout.write("  ✓ Contact Banner")
