"""
Seed command: tạo InfoGroup "Giảng viên & Chuyên gia học tập ứng dụng"
với 22 chuyên gia bám sát Figma.

Usage:
    python manage.py seed_giang_vien_figma
    python manage.py seed_giang_vien_figma --clear   # xóa experts của group này trước
"""

from __future__ import annotations

from django.core.management.base import BaseCommand
from django.utils.text import slugify

from apps.expert.models import Expert, InfoGroup, ResearchArea


# ─── Dữ liệu chuyên gia từ Figma ─────────────────────────────────────────────
# (academic_title, name, research_area_slug, display_order)
EXPERTS_FIGMA: list[tuple[str, str, str, int]] = [
    ("PGS.TS.",  "Lê Quang Minh",        "giao-duc-phat-trien-nang-luc", 1),
    ("TS.DS.",   "Trần Lê Diễm Anh",     "y-te-quan-tri-y-te",           2),
    ("TS.",      "Phạm Thị Thúy",        "giao-duc-phat-trien-nang-luc", 3),
    ("TS.",      "John Stiles",           "quan-tri-nhan-su-to-chuc",     4),
    ("TS.",      "Bùi Hồng Quân",        "giao-duc-phat-trien-nang-luc", 5),
    ("TS.",      "Nguyễn Thị Minh",      "giao-duc-phat-trien-nang-luc", 6),
    ("TS.",      "Nguyễn Hữu Hoàng",     "xa-hoi-hoc-chinh-sach-cong",   7),
    ("TS.",      "Trần Thanh Tâm",       "moi-truong-phat-trien-ben-vung", 8),
    ("ThS.",     "Nguyễn Minh Hương",    "quan-tri-nhan-su-to-chuc",     9),
    ("ThS.",     "Lê Ngọc Thiên Phương", "quan-tri-nhan-su-to-chuc",     10),
    ("ThS.",     "Lê Ngọc Anh Khoa",     "giao-duc-phat-trien-nang-luc", 11),
    ("ThS.",     "Trịnh Thùy Linh",      "giao-duc-phat-trien-nang-luc", 12),
    ("ThS.",     "Bùi Thanh Tùng",       "ai-du-lieu-chuyen-doi-so",     13),
    ("ThS.",     "Lương Dũng Nhân",      "giao-duc-phat-trien-nang-luc", 14),
    ("ThS.BS.",  "Ngô Văn Huy",          "giao-duc-phat-trien-nang-luc", 15),
    ("ThS.",     "Nguyễn Thị Bích Hà",   "quan-tri-nhan-su-to-chuc",     16),
    ("ThS.",     "Ngô Minh Uy",          "tam-ly-suc-khoe-tam-than",     17),
    ("ThS.",     "Tạ Thị Phấn",          "ai-du-lieu-chuyen-doi-so",     18),
    ("Mr.",      "Trần Tuấn Hùng",       "ai-du-lieu-chuyen-doi-so",     19),
    ("Ms.",      "Trần Thị Thế Thanh",   "ai-du-lieu-chuyen-doi-so",     20),
    ("TS.",      "Trần Trung Hiếu",      "ai-du-lieu-chuyen-doi-so",     21),
    ("ThS.",     "Nguyễn Quốc Định",     "y-te-quan-tri-y-te",           22),
]

# Slug riêng cho nhóm này (tránh trùng với seed_expert_figma)
GROUP_SLUG = "giang-vien-chuyen-gia-hoc-tap"

# Slug prefix để phân biệt với experts của nhóm "Nhà khoa học"
SLUG_PREFIX = "gv-"


def _make_expert_slug(prefix: str, name: str) -> str:
    """Tạo slug có prefix để tránh conflict."""
    return prefix + slugify(name)


class Command(BaseCommand):
    help = "Seed InfoGroup 'Giảng viên & Chuyên gia học tập ứng dụng' với 22 chuyên gia theo Figma"

    def add_arguments(self, parser):
        parser.add_argument(
            "--clear",
            action="store_true",
            help="Xóa expert_direct_members của group trước khi seed (không xóa experts toàn cục)",
        )

    def handle(self, *args, **options):
        self.stdout.write(self.style.MIGRATE_HEADING("\n🌱 Seeding Giảng viên & Chuyên gia..."))

        # ── 1. Tạo / cập nhật InfoGroup ───────────────────────────────────────
        group, created = InfoGroup.objects.update_or_create(
            slug=GROUP_SLUG,
            defaults={
                "name": "Giảng viên & Chuyên gia học tập ứng dụng",
                "icon": "book-open",
                "icon_bg_color": "#EFF6FF",
                "header_description": (
                    "Đội ngũ trực tiếp chuyên hóa tri thức thành trải nghiệm học tập, "
                    "tập huấn, coaching, workshop, E-Learning và microlearning."
                ),
                "section_description": (
                    "Đội ngũ chuyên gia học tập ứng dụng trực tiếp chuyên hóa tri thức "
                    "thành trải nghiệm học tập, tập huấn, coaching, workshop, "
                    "E-Learning và microlearning."
                ),
                "show_expert_grid": True,
                "expert_grid_flat": True,
                "expert_grid_cta_label": "Xem hồ sơ chuyên môn",
                "is_active": True,
                "display_order": 4,  # sau "Nhà khoa học & Chuyên gia" (order 3)
            },
        )
        action = "Tạo mới" if created else "Cập nhật"
        self.stdout.write(f"  ✓ {action} InfoGroup: {group.name}")

        # ── 2. Clear nếu được yêu cầu ─────────────────────────────────────────
        if options["clear"]:
            group.expert_direct_members.clear()
            self.stdout.write("  ✓ Đã xóa expert_direct_members cũ")

        # ── 3. Tạo / cập nhật từng Expert và gắn vào group ───────────────────
        linked = 0
        skipped_area = 0

        for academic_title, name, area_slug, order in EXPERTS_FIGMA:
            slug = _make_expert_slug(SLUG_PREFIX, name)

            # Tìm ResearchArea
            try:
                area = ResearchArea.objects.get(slug=area_slug)
            except ResearchArea.DoesNotExist:
                self.stdout.write(
                    self.style.WARNING(f"  ⚠ ResearchArea '{area_slug}' không tồn tại — bỏ qua {name}")
                )
                skipped_area += 1
                continue

            # Tạo/cập nhật Expert
            expert, exp_created = Expert.objects.update_or_create(
                slug=slug,
                defaults={
                    "name": name,
                    "academic_title": academic_title,
                    "is_active": True,
                    "is_published": True,
                    "display_order": order,
                },
            )
            # Gắn research_area
            expert.research_areas.add(area)

            # Gắn vào group
            group.expert_direct_members.add(expert)

            exp_action = "Tạo" if exp_created else "Update"
            self.stdout.write(
                f"  [{exp_action}] {academic_title} {name}  →  {area.name}"
            )
            linked += 1

        # ── 4. Tổng kết ───────────────────────────────────────────────────────
        self.stdout.write("")
        self.stdout.write(
            self.style.SUCCESS(
                f"✅ Hoàn tất: {linked} chuyên gia đã gắn vào '{group.name}'"
            )
        )
        if skipped_area:
            self.stdout.write(
                self.style.WARNING(
                    f"⚠  {skipped_area} chuyên gia bị bỏ qua do ResearchArea không tồn tại. "
                    "Hãy chạy seed_expert_figma trước."
                )
            )
        self.stdout.write(
            "   Vào Admin → Expert → Nhóm thông tin → "
            f"'{group.name}' để xem và chỉnh sửa.\n"
        )
