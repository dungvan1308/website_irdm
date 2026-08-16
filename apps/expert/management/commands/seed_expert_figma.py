"""
seed_expert_figma — Seed ResearchArea + Expert theo Figma "Nhà khoa học & Chuyên gia"

Idempotent: dùng update_or_create, chạy nhiều lần không bị trùng.
Cũng tự bật show_expert_grid và gắn 8 ResearchArea vào InfoGroup.

Chạy:
    python manage.py seed_expert_figma
"""
import os
import re
import unicodedata

from django.core.management.base import BaseCommand
from django.conf import settings

from apps.expert.models import Expert, ExpertGroup, InfoGroup, ResearchArea


# ── 1. Lĩnh vực chuyên môn (ResearchArea) ────────────────────────────────────

RESEARCH_AREAS = [
    {
        "name": "Y tế & Quản trị y tế",
        "slug": "y-te-quan-tri-y-te",
        "description": (
            "Chuyên môn về hệ thống y tế, quản trị bệnh viện, "
            "chất lượng chăm sóc và phát triển dịch vụ."
        ),
        "icon": "heart",
        "color": "#be123c",
        "display_order": 1,
    },
    {
        "name": "AI, Dữ liệu & Chuyển đổi số",
        "slug": "ai-du-lieu-chuyen-doi-so",
        "description": (
            "Hỗ trợ nhận diện use case, đánh giá dữ liệu, thiết kế dashboard, "
            "công cụ số và lộ trình thí điểm."
        ),
        "icon": "cpu",
        "color": "#0891b2",
        "display_order": 2,
    },
    {
        "name": "Giáo dục & Phát triển năng lực",
        "slug": "giao-duc-phat-trien-nang-luc",
        "description": (
            "Thiết kế chương trình học tập, đào tạo, E-Learning, microlearning "
            "và phát triển năng lực đội ngũ."
        ),
        "icon": "academic-cap",
        "color": "#b45309",
        "display_order": 3,
    },
    {
        "name": "Tâm lý & Sức khỏe tâm thần",
        "slug": "tam-ly-suc-khoe-tam-than",
        "description": (
            "Nghiên cứu, thiết kế sáng kiến phòng ngừa, "
            "nâng đỡ tâm lý - xã hội và wellbeing."
        ),
        "icon": "heart",
        "color": "#7c3aed",
        "display_order": 4,
    },
    {
        "name": "Xã hội học & Chính sách công",
        "slug": "xa-hoi-hoc-chinh-sach-cong",
        "description": (
            "Phân tích bối cảnh xã hội, nhóm thụ hưởng, tác động chính sách "
            "và các vấn đề phát triển hệ thống."
        ),
        "icon": "building-library",
        "color": "#0f766e",
        "display_order": 5,
    },
    {
        "name": "Môi trường & Phát triển bền vững",
        "slug": "moi-truong-phat-trien-ben-vung",
        "description": (
            "Kết nối môi trường sống, ESG, Green University, Green Hospital "
            "và các sáng kiến bền vững."
        ),
        "icon": "leaf",
        "color": "#15803d",
        "display_order": 6,
    },
    {
        "name": "Quản trị nhân sự & Tổ chức",
        "slug": "quan-tri-nhan-su-to-chuc",
        "description": (
            "Phát triển lãnh đạo, năng lực phối hợp, "
            "văn hóa tổ chức và hiệu quả làm việc."
        ),
        "icon": "briefcase",
        "color": "#7c3aed",
        "display_order": 7,
    },
    {
        "name": "Quản trị kinh tế & Tác động xã hội",
        "slug": "quan-tri-kinh-te-tac-dong-xa-hoi",
        "description": (
            "Hỗ trợ phân tích hiệu quả, nguồn lực, mô hình vận hành "
            "và giá trị xã hội của sáng kiến."
        ),
        "icon": "chart-bar",
        "color": "#1d4ed8",
        "display_order": 8,
    },
]


# ── 2. Chuyên gia theo Figma ──────────────────────────────────────────────────
# avatar: tên file trong media/expert/avatars/ — None nếu chưa có ảnh

EXPERTS = [
    # Y tế & Quản trị y tế
    {
        "academic_title": "GS.TS.BS.", "name": "Phạm Lê An",
        "avatar": "PhamLeAn.png",
        "areas": ["y-te-quan-tri-y-te"],
        "display_order": 1,
    },
    {
        "academic_title": "TS.", "name": "Ngô Gia Lương",
        "avatar": None,
        "areas": ["y-te-quan-tri-y-te", "moi-truong-phat-trien-ben-vung",
                  "quan-tri-kinh-te-tac-dong-xa-hoi"],
        "display_order": 2,
    },
    {
        "academic_title": "TS.BS.", "name": "Trần Thị Minh Hạnh",
        "avatar": None,
        "areas": ["y-te-quan-tri-y-te"],
        "display_order": 3,
    },
    {
        "academic_title": "TS.DS.", "name": "Trần Lê Diễm Anh",
        "avatar": None,
        "areas": [
            "y-te-quan-tri-y-te", "ai-du-lieu-chuyen-doi-so",
            "giao-duc-phat-trien-nang-luc", "tam-ly-suc-khoe-tam-than",
            "xa-hoi-hoc-chinh-sach-cong", "quan-tri-nhan-su-to-chuc",
            "quan-tri-kinh-te-tac-dong-xa-hoi",
        ],
        "display_order": 4,
    },
    {
        "academic_title": "BS.CKII.", "name": "Huỳnh Anh Lan",
        "avatar": None,
        "areas": ["y-te-quan-tri-y-te"],
        "display_order": 5,
    },
    {
        "academic_title": "ThS.", "name": "Nguyễn Quốc Định",
        "avatar": None,
        "areas": ["y-te-quan-tri-y-te", "ai-du-lieu-chuyen-doi-so"],
        "display_order": 6,
    },

    # AI, Dữ liệu & Chuyển đổi số
    {
        "academic_title": "PGS.TS.", "name": "Nguyễn Thanh Bình",
        "avatar": None,
        "areas": ["ai-du-lieu-chuyen-doi-so"],
        "display_order": 7,
    },
    {
        "academic_title": "TS.", "name": "Trần Trung Hiếu",
        "avatar": None,
        "areas": ["ai-du-lieu-chuyen-doi-so", "quan-tri-nhan-su-to-chuc"],
        "display_order": 8,
    },
    {
        "academic_title": "TS.", "name": "Huỳnh Ngọc Tín",
        "avatar": None,
        "areas": ["ai-du-lieu-chuyen-doi-so"],
        "display_order": 9,
    },
    {
        "academic_title": "ThS.", "name": "Tạ Thị Phấn",
        "avatar": None,
        "areas": [
            "ai-du-lieu-chuyen-doi-so", "giao-duc-phat-trien-nang-luc",
            "xa-hoi-hoc-chinh-sach-cong", "quan-tri-kinh-te-tac-dong-xa-hoi",
        ],
        "display_order": 10,
    },
    {
        "academic_title": "ThS.", "name": "Bùi Thanh Tùng",
        "avatar": None,
        "areas": ["ai-du-lieu-chuyen-doi-so"],
        "display_order": 11,
    },
    {
        "academic_title": "Kỹ sư", "name": "Minh Nguyễn",
        "avatar": None,
        "areas": ["ai-du-lieu-chuyen-doi-so"],
        "display_order": 12,
    },
    {
        "academic_title": "Kỹ sư", "name": "Nguyễn Ngọc Liêm",
        "avatar": None,
        "areas": ["ai-du-lieu-chuyen-doi-so"],
        "display_order": 13,
    },

    # Giáo dục & Phát triển năng lực
    {
        "academic_title": "PGS.TS.", "name": "Lê Quang Minh",
        "avatar": "PGS_LeQuangMinh.jpg",
        "areas": ["giao-duc-phat-trien-nang-luc"],
        "display_order": 14,
    },
    {
        "academic_title": "GS.TS.DS.", "name": "Nguyễn Đức Tuấn",
        "avatar": None,
        "areas": ["giao-duc-phat-trien-nang-luc"],
        "display_order": 15,
    },
    {
        "academic_title": "PGS.TS.", "name": "Nguyễn Thị Vân Hạnh",
        "avatar": None,
        "areas": ["giao-duc-phat-trien-nang-luc"],
        "display_order": 16,
    },
    {
        "academic_title": "TS.", "name": "Phạm Thị Thủy",
        "avatar": None,
        "areas": ["giao-duc-phat-trien-nang-luc", "tam-ly-suc-khoe-tam-than",
                  "xa-hoi-hoc-chinh-sach-cong"],
        "display_order": 17,
    },
    {
        "academic_title": "TS.", "name": "Bùi Hồng Quân",
        "avatar": None,
        "areas": ["giao-duc-phat-trien-nang-luc"],
        "display_order": 18,
    },
    {
        "academic_title": "TS.", "name": "Nguyễn Thị Minh",
        "avatar": None,
        "areas": ["giao-duc-phat-trien-nang-luc"],
        "display_order": 19,
    },
    {
        "academic_title": "ThS.", "name": "Lương Dũng Nhân",
        "avatar": None,
        "areas": ["giao-duc-phat-trien-nang-luc"],
        "display_order": 20,
    },
    {
        "academic_title": "ThS.", "name": "Lê Ngọc Anh Khoa",
        "avatar": None,
        "areas": ["giao-duc-phat-trien-nang-luc"],
        "display_order": 21,
    },
    {
        "academic_title": "ThS.", "name": "Trịnh Thúy Linh",
        "avatar": None,
        "areas": ["giao-duc-phat-trien-nang-luc", "tam-ly-suc-khoe-tam-than"],
        "display_order": 22,
    },

    # Tâm lý & Sức khỏe tâm thần
    {
        "academic_title": "PGS.TS.", "name": "Phan Thị Mai Hương",
        "avatar": None,
        "areas": ["tam-ly-suc-khoe-tam-than"],
        "display_order": 23,
    },
    {
        "academic_title": "ThS.", "name": "Ngô Minh Uy",
        "avatar": None,
        "areas": ["tam-ly-suc-khoe-tam-than"],
        "display_order": 24,
    },

    # Xã hội học & Chính sách công
    {
        "academic_title": "TS.", "name": "Phạm Đức Trọng",
        "avatar": None,
        "areas": ["xa-hoi-hoc-chinh-sach-cong", "quan-tri-kinh-te-tac-dong-xa-hoi"],
        "display_order": 25,
    },
    {
        "academic_title": "TS.", "name": "Nguyễn Minh Nhựt",
        "avatar": None,
        "areas": ["xa-hoi-hoc-chinh-sach-cong", "quan-tri-kinh-te-tac-dong-xa-hoi"],
        "display_order": 26,
    },
    {
        "academic_title": "ThS.", "name": "Trần Quyết Thắng",
        "avatar": None,
        "areas": ["xa-hoi-hoc-chinh-sach-cong", "quan-tri-kinh-te-tac-dong-xa-hoi"],
        "display_order": 27,
    },

    # Môi trường & Phát triển bền vững
    {
        "academic_title": "TS.", "name": "Trần Thanh Tâm",
        "avatar": None,
        "areas": ["moi-truong-phat-trien-ben-vung"],
        "display_order": 28,
    },
    {
        "academic_title": "ThS.", "name": "Lê Thị Lan Anh",
        "avatar": None,
        "areas": ["moi-truong-phat-trien-ben-vung"],
        "display_order": 29,
    },

    # Quản trị nhân sự & Tổ chức
    {
        "academic_title": "TS.", "name": "John Stiles",
        "avatar": None,
        "areas": ["quan-tri-nhan-su-to-chuc"],
        "display_order": 30,
    },
    {
        "academic_title": "ThS.", "name": "Nguyễn Minh Hương",
        "avatar": None,
        "areas": ["quan-tri-nhan-su-to-chuc"],
        "display_order": 31,
    },
    {
        "academic_title": "ThS.", "name": "Nguyễn Thị Bích Hà",
        "avatar": None,
        "areas": ["quan-tri-nhan-su-to-chuc"],
        "display_order": 32,
    },
    {
        "academic_title": "ThS.", "name": "Nguyễn Thị Thanh Hương",
        "avatar": None,
        "areas": ["quan-tri-nhan-su-to-chuc"],
        "display_order": 33,
    },
    {
        "academic_title": "ThS.", "name": "Nguyễn Thuận Đạt",
        "avatar": None,
        "areas": ["quan-tri-nhan-su-to-chuc"],
        "display_order": 34,
    },
    {
        "academic_title": "Mr.", "name": "Trần Trung Hiếu",
        "avatar": None,
        "areas": ["quan-tri-nhan-su-to-chuc"],
        "display_order": 35,
    },
]


# ── Helper ─────────────────────────────────────────────────────────────────────

def _make_slug(text: str) -> str:
    """Tạo ASCII slug từ tiếng Việt."""
    text = unicodedata.normalize("NFD", text)
    text = "".join(c for c in text if unicodedata.category(c) != "Mn")
    text = text.lower().strip()
    text = re.sub(r"[^\w\s-]", "", text)
    text = re.sub(r"[\s_-]+", "-", text)
    return text.strip("-")


# ── Command ────────────────────────────────────────────────────────────────────

class Command(BaseCommand):
    help = "Seed ResearchArea + Expert theo Figma (accordion Nhà khoa học & Chuyên gia)"

    def handle(self, *args, **options):
        self.stdout.write(self.style.MIGRATE_HEADING("=== Seed Expert Figma ===\n"))

        # 1. Tạo / cập nhật ResearchArea
        self.stdout.write(self.style.MIGRATE_LABEL("1. Lĩnh vực chuyên môn (ResearchArea)"))
        area_map: dict[str, ResearchArea] = {}
        for data in RESEARCH_AREAS:
            area, created = ResearchArea.objects.update_or_create(
                slug=data["slug"],
                defaults={
                    "name": data["name"],
                    "description": data["description"],
                    "icon": data["icon"],
                    "color": data["color"],
                    "display_order": data["display_order"],
                    "is_active": True,
                    "card_cta_label": "Tìm chuyên gia liên quan",
                    "card_cta_url": f"/chuyen-gia/?area={data['slug']}#tim-kiem",
                },
            )
            area_map[data["slug"]] = area
            mark = "✓ Tạo mới" if created else "↺ Cập nhật"
            self.stdout.write(f"   {mark}: {area.name}")

        # 2. Lấy / tạo nhóm mặc định
        default_group, _ = ExpertGroup.objects.get_or_create(
            slug="nha-khoa-hoc",
            defaults={
                "name": "Nhà khoa học & Nghiên cứu viên",
                "display_order": 1,
                "is_active": True,
            },
        )

        # 3. Tạo / cập nhật Expert
        self.stdout.write(self.style.MIGRATE_LABEL("\n2. Chuyên gia (Expert)"))
        media_root = getattr(settings, "MEDIA_ROOT", "media")

        for data in EXPERTS:
            slug = _make_slug(data["name"])
            # Đảm bảo slug duy nhất khi có trùng tên (Mr. Trần Trung Hiếu vs TS. Trần Trung Hiếu)
            base_slug = slug
            counter = 2
            qs = Expert.objects.filter(slug=slug)
            # Nếu đã có expert với slug này thì lấy lại bằng tên + học hàm
            existing = Expert.objects.filter(slug=slug).first()
            if existing and existing.name != data["name"]:
                slug = f"{base_slug}-{_make_slug(data['academic_title'])}"

            expert, created = Expert.objects.update_or_create(
                slug=slug,
                defaults={
                    "name": data["name"],
                    "academic_title": data["academic_title"],
                    "group": default_group,
                    "is_published": True,
                    "is_active": True,
                    "display_order": data["display_order"],
                },
            )

            # Gắn avatar nếu có file trên disk và chưa có ảnh
            if data.get("avatar") and not expert.avatar:
                rel_path = f"expert/avatars/{data['avatar']}"
                abs_path = os.path.join(media_root, rel_path)
                if os.path.exists(abs_path):
                    expert.avatar = rel_path
                    expert.save(update_fields=["avatar"])

            # Gắn ResearchArea (M2M)
            for area_slug in data["areas"]:
                if area_slug in area_map:
                    expert.research_areas.add(area_map[area_slug])

            mark = "✓ Tạo mới" if created else "↺ Cập nhật"
            self.stdout.write(
                f"   {mark}: {expert.academic_title} {expert.name} "
                f"({len(data['areas'])} lĩnh vực)"
            )

        # 4. Cấu hình InfoGroup
        self.stdout.write(self.style.MIGRATE_LABEL("\n3. InfoGroup 'Nhà khoa học & Chuyên gia'"))
        # Thử nhiều slug có thể có
        info_group = InfoGroup.objects.filter(
            slug__in=["nha-khoa-hoc-chuyen-gia", "nha-khoa-hoc-va-chuyen-gia",
                      "nha-khoa-hoc", "chuyen-gia"]
        ).first()

        if info_group is None:
            # Fallback: lấy InfoGroup có chứa "Chuyên gia" trong tên
            info_group = InfoGroup.objects.filter(name__icontains="Chuyên gia").first()

        if info_group:
            info_group.show_expert_grid = True
            info_group.expert_grid_cta_label = "Xem hồ sơ chuyên môn"
            info_group.save(update_fields=["show_expert_grid", "expert_grid_cta_label"])

            ordered_areas = [
                area_map[a["slug"]] for a in RESEARCH_AREAS if a["slug"] in area_map
            ]
            info_group.expert_research_areas.set(ordered_areas)

            self.stdout.write(
                f"   ✓ InfoGroup '{info_group.name}' (slug={info_group.slug})\n"
                f"     show_expert_grid = True\n"
                f"     Gắn {len(ordered_areas)} ResearchArea theo thứ tự Figma"
            )
        else:
            self.stdout.write(self.style.WARNING(
                "   [!] Không tìm thấy InfoGroup 'Nhà khoa học & Chuyên gia'.\n"
                "       Hãy vào Admin → Nhóm thông tin → bật Show expert grid thủ công."
            ))

        # 5. Tổng kết
        self.stdout.write(self.style.SUCCESS(
            f"\n=== Hoàn tất ===\n"
            f"  ResearchArea : {len(RESEARCH_AREAS)} lĩnh vực\n"
            f"  Expert       : {len(EXPERTS)} chuyên gia\n"
            f"  Ảnh có sẵn  : PhamLeAn.png, PGS_LeQuangMinh.jpg\n"
            f"  Upload thêm ảnh tại: Admin → Expert → Chuyên gia\n"
            f"  Xem kết quả : http://127.0.0.1:8000/chuyen-gia/"
        ))
