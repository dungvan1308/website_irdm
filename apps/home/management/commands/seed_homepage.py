"""
Management command: seed_homepage

Populates the database with initial homepage content from the Figma design.
Safe to run multiple times — uses get_or_create to avoid duplicates.
Loads real assets from assets_irdm_web/Home page/ when available.
"""

from pathlib import Path

from django.conf import settings
from django.core.files.base import ContentFile
from django.core.management.base import BaseCommand

from apps.core.models import FooterLink, FooterSection, MenuItem, SiteSettings
from apps.home.models import (
    AudienceSegment,
    AudienceSectionHeader,
    AudienceTag,
    CTABanner,
    CapabilitiesSectionHeader,
    CoreCapability,
    EvidenceSectionHeader,
    HeroPillTag,
    HeroSection,
    KnowledgeCategory,
    KnowledgeSectionHeader,
    MethodologySectionHeader,
    MethodologyStep,
    PartnerLogo,
    PhilosophyPrinciple,
    PhilosophySectionHeader,
    StatisticItem,
)

ASSETS_DIR = Path(settings.BASE_DIR) / "assets_irdm_web" / "Home page"


def _load_asset(relative_path: str) -> ContentFile | None:
    """Load a real PNG asset relative to ASSETS_DIR, return None if not found."""
    full = ASSETS_DIR / relative_path
    if full.exists():
        with open(full, "rb") as f:
            return ContentFile(f.read(), name=full.name)
    return None


class Command(BaseCommand):
    help = "Seed the database with initial homepage content from the Figma design."

    def handle(self, *args, **options) -> None:
        self.stdout.write("Seeding homepage data...")
        self._seed_site_settings()
        self._seed_navigation()
        self._seed_footer()
        self._seed_hero()
        self._seed_audience()
        self._seed_methodology()
        self._seed_capabilities()
        self._seed_philosophy()
        self._seed_evidence()
        self._seed_knowledge()
        self._seed_cta_banner()
        self.stdout.write(self.style.SUCCESS("Homepage seeding complete."))

    # ─── Site Settings ────────────────────────────────────────────────────────

    def _seed_site_settings(self) -> None:
        site, created = SiteSettings.objects.get_or_create(
            site_name="IRDM",
            defaults={
                "site_tagline": "Viện Nghiên cứu Phát triển Nguồn lực Việt",
                "site_description": (
                    "Viện Nghiên cứu Phát triển Nguồn lực Việt (IRDM) là tổ chức Khoa học, "
                    "Công nghệ và Đổi mới sáng tạo, hoạt động nghiên cứu và ứng dụng các "
                    "giải pháp phát triển bền vững."
                ),
                "email": "vienncptnlv@irdm.edu.vn",
                "phone": "(+84) 33 656 7701",
                "address": "8C Trần Huy Liệu, Phường Phú Nhuận, TP.HCM",
                "operating_hours": "Thứ 2 đến Thứ 6 | 8h00 – 17h00",
                "facebook_url": "https://facebook.com/irdm",
                "youtube_url": "https://youtube.com/@irdm",
                "linkedin_url": "https://linkedin.com/company/irdm",
                "is_active": True,
                "display_order": 0,
            },
        )
        action = "Created" if created else "Already exists"
        self.stdout.write(f"  SiteSettings: {action}")

    # ─── Navigation ───────────────────────────────────────────────────────────

    def _seed_navigation(self) -> None:
        header_items = [
            ("Trang chủ", "/", 10),
            ("Giải pháp", "/giai-phap/", 20),
            ("Tri thức & Góc nhìn", "/tri-thuc-goc-nhin/", 30),
            ("Đội ngũ chuyên gia", "/chuyen-gia/", 40),
            ("Đối tác & Khách hàng", "/doi-tac/", 50),
            ("Về IRDM", "/ve-irdm/", 60),
        ]
        for label, url, order in header_items:
            obj, created = MenuItem.objects.get_or_create(
                menu=MenuItem.MENU_HEADER,
                label=label,
                parent=None,
                defaults={"url": url, "display_order": order, "is_active": True},
            )
            if created:
                self.stdout.write(f"  Header nav: {label}")

        footer_items = [
            ("Trang chủ", "/", 10),
            ("Giải pháp", "/giai-phap/", 20),
            ("Tri thức & Góc nhìn", "/tri-thuc-goc-nhin/", 30),
            ("Đội ngũ chuyên gia", "/chuyen-gia/", 40),
            ("Về IRDM", "/ve-irdm/", 50),
        ]
        for label, url, order in footer_items:
            MenuItem.objects.get_or_create(
                menu=MenuItem.MENU_FOOTER,
                label=label,
                parent=None,
                defaults={"url": url, "display_order": order, "is_active": True},
            )

    # ─── Footer ───────────────────────────────────────────────────────────────

    def _seed_footer(self) -> None:
        sections_data = [
            ("Giải pháp", [
                ("Cơ quan quản lý", "/giai-phap/co-quan-quan-ly/"),
                ("Hệ thống y tế", "/giai-phap/he-thong-y-te/"),
                ("Trường Đại học", "/giai-phap/giao-duc/"),
                ("Doanh nghiệp", "/giai-phap/doanh-nghiep/"),
                ("Tổ chức quốc tế", "/giai-phap/to-chuc-quoc-te/"),
            ]),
            ("Tri thức & Góc nhìn", [
                ("Xuất bản & Tài liệu", "/tri-thuc-goc-nhin/"),
                ("Sự kiện & Diễn đàn", "/tri-thuc-goc-nhin/"),
                ("Góc nhìn từ Đối tác", "/tri-thuc-goc-nhin/"),
                ("Truyền thông", "/tri-thuc-goc-nhin/"),
            ]),
            ("Về IRDM", [
                ("Giới thiệu", "/ve-irdm/"),
                ("Đội ngũ chuyên gia", "/chuyen-gia/"),
                ("Đối tác", "/doi-tac/"),
                ("Liên hệ", "/lien-he/"),
            ]),
        ]
        for order, (title, links) in enumerate(sections_data, start=10):
            section, _ = FooterSection.objects.get_or_create(
                title=title,
                defaults={"display_order": order * 10, "is_active": True},
            )
            for link_order, (label, url) in enumerate(links, start=10):
                FooterLink.objects.get_or_create(
                    section=section,
                    label=label,
                    defaults={"url": url, "display_order": link_order * 10, "is_active": True},
                )

    # ─── Hero ─────────────────────────────────────────────────────────────────

    def _seed_hero(self) -> None:
        # Remove any legacy record that has the full combined heading (pre-split schema)
        legacy_qs = HeroSection.objects.exclude(heading="KIẾN TẠO GIẢI PHÁP TỪ")
        if legacy_qs.exists():
            count = legacy_qs.count()
            legacy_qs.delete()
            self.stdout.write(f"  HeroSection: removed {count} legacy record(s)")

        hero, created = HeroSection.objects.get_or_create(
            heading="KIẾN TẠO GIẢI PHÁP TỪ",
            defaults={
                "heading_accent": "NGHIÊN CỨU, DỮ LIỆU VÀ TRI THỨC LIÊN NGÀNH",
                "eyebrow_text": (
                    "VIỆN NGHIÊN CỨU, KHOA HỌC, CÔNG NGHỆ VÀ ĐỔI MỚI SÁNG TẠO "
                    "ĐỊNH HƯỚNG ỨNG DỤNG"
                ),
                "description": (
                    "Viện IRDM đồng hành cùng cơ quan quản lý, hệ thống y tế, cơ sở giáo dục, "
                    "doanh nghiệp và tổ chức quốc tế trong các bài toán liên ngành. "
                    "Từ nhận diện vấn đề đến thiết kế mô hình, thí điểm và chuyển giao, "
                    "Viện IRDM hướng tới những giải pháp có thể ứng dụng thực tiễn."
                ),
                "primary_cta_label": "Khám phá thêm Giải pháp",
                "primary_cta_url": "/giai-phap/",
                "secondary_cta_label": "Xem Năng lực IRDM",
                "secondary_cta_url": "/capabilities/",
                "quote_strip_text": "Từ nghiên cứu đến tác động ở tầm hệ thống",
                "is_active": True,
                "display_order": 0,
            },
        )

        # Always ensure heading_accent is set on existing records
        if not hero.heading_accent:
            hero.heading_accent = "NGHIÊN CỨU, DỮ LIỆU VÀ TRI THỨC LIÊN NGÀNH"
            hero.save(update_fields=["heading_accent"])
            self.stdout.write("  HeroSection: heading_accent updated")

        action = "Created" if created else "Already exists"
        self.stdout.write(f"  HeroSection: {action}")

        # Load background overlay image
        if not hero.background_image:
            asset = _load_asset("BG.png")
            if asset:
                hero.background_image.save("home/hero/hero-bg.png", asset, save=True)
                self.stdout.write("  HeroSection: background image loaded.")

        # Load right-panel hero illustration
        if not hero.hero_image:
            asset = _load_asset("Homepage-HeroSection.png")
            if asset:
                hero.hero_image.save("home/hero/hero-illustration.png", asset, save=True)
                self.stdout.write("  HeroSection: hero illustration loaded.")

        tags = [
            ("Nghiên cứu ứng dụng", 10),
            ("Khoa học dữ liệu", 20),
            ("Đổi mới sáng tạo", 30),
            ("Phát triển năng lực", 40),
        ]
        for label, order in tags:
            HeroPillTag.objects.get_or_create(
                hero=hero, label=label,
                defaults={"display_order": order, "is_active": True},
            )

    # ─── Audience ─────────────────────────────────────────────────────────────

    def _seed_audience(self) -> None:
        AudienceSectionHeader.objects.get_or_create(
            heading="IRDM đồng hành với ai?",
            defaults={
                "section_label": "IRDM ĐỒNG HÀNH VỚI AI?",
                "description": (
                    "Các bài toán IRDM tham gia thường không nằm trong một chuyên môn đơn lẻ. "
                    "Đó là những vấn đề cần đồng thời hiểu bối cảnh, tổ chức dữ liệu, "
                    "huy động tri thức liên ngành và thiết kế cách triển khai phù hợp."
                ),
                "cta_label": "Khám phá tất cả Giải pháp",
                "cta_url": "/giai-phap/",
                "is_active": True,
                "display_order": 0,
            },
        )

        segments_data = [
            (
                "Cơ quan quản lý & Chính sách", "building-office",
                "IRDM đồng hành với ai/Cơ quan quản lý & Chính sách.png",
                (
                    "Cung cố căn cứ khoa học, dữ liệu và cơ chế phối hợp cho các chương trình, "
                    "dự án và nhiệm vụ KHCN & MST."
                ),
                "Khám phá Giải pháp", "/giai-phap/co-quan-quan-ly/",
                ["Chính sách", "Dữ liệu", "Điều hành", "KHCN & MST"], 10,
            ),
            (
                "Hệ thống y tế", "heart",
                "IRDM đồng hành với ai/Hệ thống y tế.png",
                (
                    "Làm rõ bài toán ưu tiên, dữ liệu sẵn có và lộ trình thí điểm phù hợp "
                    "để hỗ trợ quản trị, chất lượng dịch vụ, phát triển năng lực."
                ),
                "Khám phá Giải pháp", "/giai-phap/he-thong-y-te/",
                ["Bệnh viện số", "Dữ liệu y tế", "Workforce", "Wellbeing", "Chuyển đổi số"], 20,
            ),
            (
                "Trường Đại học & Giáo dục", "academic-cap",
                "IRDM đồng hành với ai/Trường đại học & Giáo dục.png",
                (
                    "Hỗ trợ nhà trường đổi mới chương trình, phát triển người học, khai thác "
                    "dữ liệu giáo dục và xây dựng môi trường học tập."
                ),
                "Khám phá Giải pháp", "/giai-phap/giao-duc/",
                ["Giáo dục", "Người học", "E-Learning", "Green University"], 30,
            ),
            (
                "Doanh nghiệp", "briefcase",
                "IRDM đồng hành với ai/Doanh nghiệp.png",
                (
                    "Thiết kế các sáng kiến phát triển con người, năng lực làm việc, văn hóa "
                    "phối hợp và trách nhiệm xã hội gắn với mục tiêu."
                ),
                "Khám phá Giải pháp", "/giai-phap/doanh-nghiep/",
                ["Lãnh đạo", "Hiệu quả Đội nhóm", "Wellbeing", "ESG"], 40,
            ),
            (
                "Tổ chức quốc tế", "globe-alt",
                "IRDM đồng hành với ai/Tổ chức quốc tế.png",
                (
                    "Kết nối tri thức quốc tế với bối cảnh Việt Nam để thiết kế, triển khai "
                    "và đánh giá các sáng kiến liên ngành có khả năng nhân rộng."
                ),
                "Khám phá Giải pháp", "/giai-phap/to-chuc-quoc-te/",
                ["Bối cảnh địa phương", "Nghiên cứu", "Đồng thiết kế", "Triển khai"], 50,
            ),
        ]

        for title, icon, asset_path, desc, cta_label, cta_url, tags, order in segments_data:
            segment, created = AudienceSegment.objects.get_or_create(
                title=title,
                defaults={
                    "icon": icon, "description": desc,
                    "cta_label": cta_label, "cta_url": cta_url,
                    "display_order": order, "is_active": True,
                },
            )
            if created or not segment.image:
                asset = _load_asset(asset_path)
                if asset:
                    segment.image.save(f"home/audience/{segment.pk}.png", asset, save=True)
            if created:
                for tag_order, tag_label in enumerate(tags, start=10):
                    AudienceTag.objects.create(
                        segment=segment, label=tag_label,
                        display_order=tag_order * 10, is_active=True,
                    )

    # ─── Methodology ──────────────────────────────────────────────────────────

    def _seed_methodology(self) -> None:
        MethodologySectionHeader.objects.get_or_create(
            heading="Cách IRDM tạo ra tác động",
            defaults={
                "section_label": "PHƯƠNG PHÁP LÀM VIỆC",
                "description": (
                    "Viện IRDM tiếp cận mỗi dự án như một tiến trình đi từ bằng chứng, "
                    "đồng thiết kế và chuyển hóa thành giải pháp có thể tác động ở tầm hệ thống."
                ),
                "cta_label": "Tìm hiểu Năng lực cốt lõi",
                "cta_url": "/ve-irdm/",
                "is_active": True,
                "display_order": 0,
            },
        )

        steps_data = [
            (1, "magnifying-glass", "Nhận diện đúng vấn đề",
             "Làm rõ bài toán cốt lõi, nhóm liên quan, bối cảnh vận hành và ưu tiên hành động."),
            (2, "chart-bar", "Tạo bằng chứng đáng tin cậy",
             "Thiết kế nghiên cứu, khảo sát, phân tích dữ liệu và tổng hợp thông tin trên nền tảng khoa học."),
            (3, "squares-2x2", "Đồng thiết kế giải pháp",
             "Kết nối chuyên gia, dữ liệu, công nghệ và kinh nghiệm triển khai để hình thành mô hình, chương trình, công cụ."),
            (4, "beaker", "Thí điểm và đánh giá",
             "Triển khai thí trong điều kiện thực tế, theo dõi kết quả, điều chỉnh cách làm và rút ra bài học."),
            (5, "arrow-trending-up", "Tối ưu để mở rộng hoặc chuyển giao",
             "Chuyển kết quả thành giải pháp có thể sử dụng lâu dài trong tổ chức hoặc hệ thống."),
        ]

        for num, icon, title, body in steps_data:
            MethodologyStep.objects.get_or_create(
                step_number=num,
                defaults={
                    "icon": icon, "title": title, "body": body,
                    "display_order": num * 10, "is_active": True,
                },
            )

    # ─── Capabilities ─────────────────────────────────────────────────────────

    def _seed_capabilities(self) -> None:
        CapabilitiesSectionHeader.objects.get_or_create(
            heading="NĂNG LỰC CỐT LÕI",
            defaults={
                "section_label": "NỀN TẢNG CHUYÊN MÔN",
                "description": (
                    "Các năng lực dưới đây tạo nên nền tảng chuyên môn của IRDM — "
                    "là cơ sở để đồng hành, thiết kế và triển khai các giải pháp."
                ),
                "cta_label": "Xem tất cả Năng lực",
                "cta_url": "/ve-irdm/",
                "is_active": True,
                "display_order": 0,
            },
        )

        capabilities_data = [
            ("Nghiên cứu ứng dụng & khoa học dữ liệu",
             "Chuyển hóa vấn đề thực tiễn thành câu hỏi nghiên cứu, dữ liệu thành tri thức, "
             "và kết quả phân tích thành căn cứ cho quyết định.", 10),
            ("AI, y tế số & hỗ trợ ra quyết định",
             "Hỗ trợ tổ chức nhận diện use case, đánh giá dữ liệu, thiết kế lộ trình thí điểm "
             "và phối hợp phát triển công cụ số.", 20),
            ("Giáo dục & phát triển năng lực",
             "Thiết kế chương trình học tập, tập huấn và phát triển năng lực theo hướng ứng dụng, "
             "gắn với thay đổi hành vi và mục tiêu.", 30),
            ("Sức khỏe tâm thần & wellbeing",
             "Phát triển các sáng kiến phòng ngừa, nâng đỡ tâm lý - xã hội, năng lực phục hồi "
             "và môi trường học tập - làm việc lành mạnh.", 40),
            ("ESG, Green University & Green Hospital",
             "Đồng hành cùng tổ chức xây dựng lộ trình phát triển bền vững, kết nối quản trị, "
             "con người, môi trường và trách nhiệm xã hội.", 50),
            ("Phổ biến tri thức & truyền thông cộng đồng",
             "Chuyển hóa nghiên cứu, dữ liệu và hiểu biết chuyên môn thành nội dung dễ tiếp cận, "
             "có giá trị ứng dụng cho cộng đồng và đối tác.", 60),
            ("Sức khỏe môi trường & mô hình can thiệp phục hồi",
             "Kết nối môi trường sống, sức khỏe thể chất, sức khỏe tâm thần và trải nghiệm phục hồi "
             "để phát triển các chương trình can thiệp.", 70),
        ]

        for title, desc, order in capabilities_data:
            CoreCapability.objects.get_or_create(
                title=title,
                defaults={
                    "description": desc,
                    "display_order": order, "is_active": True,
                },
            )

    # ─── Philosophy ───────────────────────────────────────────────────────────

    def _seed_philosophy(self) -> None:
        PhilosophySectionHeader.objects.get_or_create(
            heading="Hướng tiếp cận đặc biệt của IRDM",
            defaults={
                "section_label": "TRIẾT LÝ & HƯỚNG TIẾP CẬN",
                "description": (
                    "Viện IRDM kết nối tư duy khoa học, năng lực triển khai và trách nhiệm "
                    "đồng hành để tạo ra các giải pháp không chỉ đúng mà còn có thể triển khai được."
                ),
                "is_active": True,
                "display_order": 0,
            },
        )

        principles_data = [
            (1, "link", "Gắn nghiên cứu với triển khai",
             "Viện IRDM không dừng ở mô tả hiện trạng, mà chuyển hóa tri thức khoa học thành "
             "bằng chứng, công cụ, chương trình, mô hình có thể triển khai thực tế.", 10),
            (2, "share", "Kết nối năng lực liên ngành",
             "Viện IRDM tiếp cận mỗi sáng kiến từ nhiều lớp chuyên môn, bao gồm lĩnh vực, "
             "dữ liệu, công nghệ, xã hội học, tâm lý học và chính sách.", 20),
            (3, "hand-raised", "Đồng hành bằng trách nhiệm",
             "Viện IRDM xem trọng hiệu quả sử dụng nguồn lực, giá trị con người, tác động "
             "dài hạn và khả năng duy trì sau giai đoạn can thiệp.", 30),
            (4, "star", "Hành động từ giá trị cốt lõi",
             "Viện IRDM sống và làm việc trên nền tảng chính trực, cam kết, thấu cảm và "
             "chuyên hóa.", 40),
        ]

        for num, icon, title, body, order in principles_data:
            PhilosophyPrinciple.objects.get_or_create(
                number=num,
                defaults={
                    "icon": icon, "title": title, "body": body,
                    "display_order": order, "is_active": True,
                },
            )

    # ─── Evidence ─────────────────────────────────────────────────────────────

    def _seed_evidence(self) -> None:
        EvidenceSectionHeader.objects.get_or_create(
            heading="Các tổ chức IRDM đã đồng hành",
            defaults={
                "section_label": "BẰNG CHỨNG NĂNG LỰC",
                "description": (
                    "Viện IRDM đã đồng hành cùng cơ quan quản lý, tổ chức y tế, "
                    "trường đại học, doanh nghiệp và đối tác trong các bài toán thực tiễn."
                ),
                "cta_label": "Xem Tin IRDM",
                "cta_url": "/tri-thuc-goc-nhin/",
                "partners_label": "ĐỐI TÁC TIÊU BIỂU",
                "is_active": True,
                "display_order": 0,
            },
        )

        partners_data = [
            ("Sở Khoa học và Công nghệ TP.HCM",  "Các tổ chức IRDM đã đồng hành/Sở Khoa học và Công nghệ TP.HCM.png",  "", 10),
            ("Sở Y tế TP.HCM",                   "Các tổ chức IRDM đã đồng hành/Sở Y tế TP.HCM.png",                   "", 20),
            ("Đại học Bách Khoa TP.HCM",          "Các tổ chức IRDM đã đồng hành/Đại học Bách Khoa TP.HCM.png",          "", 30),
            ("Đại học Y Dược TP.HCM",             "Các tổ chức IRDM đã đồng hành/Đại học Y Dược TP.HCM.png",             "", 40),
            ("Đại học Y Khoa Phạm Ngọc Thạch",    "Các tổ chức IRDM đã đồng hành/Đại học Y Khoa Phạm Ngọc Thạch.png",    "", 50),
            ("Bệnh viện Nguyễn Tri Phương",        "Các tổ chức IRDM đã đồng hành/Bệnh viện Nguyễn Tri Phương.png",        "", 60),
            ("Bệnh viện Chấn thương Chỉnh hình",  "Các tổ chức IRDM đã đồng hành/Bệnh viện Chấn thương Chỉnh hình.png",  "", 70),
            ("Bệnh viện Bệnh Nhiệt đới",           "Các tổ chức IRDM đã đồng hành/Bệnh viện Bệnh Nhiệt đới.png",           "", 80),
            ("Bệnh viện Răng Hàm Mặt TP.HCM",     "Các tổ chức IRDM đã đồng hành/Bệnh viện Răng Hàm Mặt TP.HCM.png",     "", 90),
            ("TalentNet",                          "Các tổ chức IRDM đã đồng hành/TalentNet.png",                          "", 100),
            ("Sanofi",                             "Các tổ chức IRDM đã đồng hành/Sanofi.png",                             "", 110),
            ("Merit Medica",                       "Các tổ chức IRDM đã đồng hành/Merit Medica.png",                       "", 120),
        ]

        for name, asset_path, url, order in partners_data:
            partner, created = PartnerLogo.objects.get_or_create(
                name=name,
                defaults={"website_url": url, "display_order": order, "is_active": True},
            )
            if created or not partner.logo:
                asset = _load_asset(asset_path)
                if asset:
                    partner.logo.save(f"home/partners/{partner.pk}.png", asset, save=True)

        stats_data = [
            ("11+", "Đối tác & tổ chức", "", 10),
            ("5+", "Lĩnh vực chuyên môn", "", 20),
            ("7", "Năng lực cốt lõi", "", 30),
            ("TP.HCM", "Trụ sở chính", "", 40),
        ]

        for value, label, desc, order in stats_data:
            StatisticItem.objects.get_or_create(
                label=label,
                defaults={
                    "value": value, "description": desc,
                    "display_order": order, "is_active": True,
                },
            )

    # ─── Knowledge ────────────────────────────────────────────────────────────

    def _seed_knowledge(self) -> None:
        KnowledgeSectionHeader.objects.get_or_create(
            heading="Tri thức & Diễn đàn chuyên môn",
            defaults={
                "section_label": "TRI THỨC & GÓC NHÌN",
                "description": (
                    "Viện IRDM tham gia các diễn đàn chuyên môn, hội thảo và hoạt động "
                    "phổ biến tri thức với vai trò tổ chức chủ trì nghiên cứu và ứng dụng."
                ),
                "cta_label": "Xem Tri thức & Góc nhìn",
                "cta_url": "/tri-thuc-goc-nhin/",
                "is_active": True,
                "display_order": 0,
            },
        )

        categories_data = [
            ("document-text", "XUẤT BẢN & TÀI LIỆU", "Bài viết, báo cáo & policy brief",
             "Tri thức & Diễn đàn chuyên môn/Bài viết, báo cáo & policy brief.png",
             "Xem tài liệu", "/tri-thuc-goc-nhin/", 10),
            ("calendar", "SỰ KIỆN & DIỄN ĐÀN", "Hội thảo, tọa đàm & diễn đàn chuyên môn",
             "Tri thức & Diễn đàn chuyên môn/Hội thảo, tọa đàm & diễn đàn chuyên môn.png",
             "Xem sự kiện", "/tri-thuc-goc-nhin/", 20),
            ("chat-bubble-left-ellipsis", "GÓC NHÌN TỪ ĐỐI TÁC", "Cảm nhận từ đối tác & người học",
             "Tri thức & Diễn đàn chuyên môn/Cảm nhận từ đối tác & người học.png",
             "Đọc chia sẻ", "/tri-thuc-goc-nhin/", 30),
            ("newspaper", "TRUYỀN THÔNG", "Báo chí & diễn đàn chuyên môn",
             "Tri thức & Diễn đàn chuyên môn/Báo chí & diễn đàn chuyên môn.png",
             "Xem trên báo chí", "/tri-thuc-goc-nhin/", 40),
        ]

        for icon, cat_label, title, asset_path, cta_label, cta_url, order in categories_data:
            cat, created = KnowledgeCategory.objects.get_or_create(
                category_label=cat_label,
                defaults={
                    "icon": icon, "title": title,
                    "cta_label": cta_label, "cta_url": cta_url,
                    "display_order": order, "is_active": True,
                },
            )
            if created or not cat.image:
                asset = _load_asset(asset_path)
                if asset:
                    cat.image.save(f"home/knowledge/{cat.pk}.png", asset, save=True)

    # ─── CTA Banner ───────────────────────────────────────────────────────────

    def _seed_cta_banner(self) -> None:
        banner, created = CTABanner.objects.get_or_create(
            heading="CÙNG THIẾT KẾ GIẢI PHÁP PHÙ HỢP VỚI BỐI CẢNH VÀ MỤC TIÊU PHÁT TRIỂN CỦA TỔ CHỨC",
            defaults={
                "section_label": "KẾT NỐI VỚI IRDM",
                "description": (
                    "Kết nối với Viện IRDM để cùng thiết kế giải pháp phù hợp với bối cảnh, "
                    "dữ liệu và mục tiêu phát triển của tổ chức của bạn."
                ),
                "cta_label": "Liên hệ hợp tác",
                "cta_url": "/lien-he/",
                "is_active": True,
                "display_order": 0,
            },
        )
        if created or not banner.background_image:
            asset = _load_asset("Kết nối với IRDM.png")
            if asset:
                banner.background_image.save("home/cta/cta-banner.png", asset, save=True)
