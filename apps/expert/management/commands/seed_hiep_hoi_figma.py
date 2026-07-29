"""
Seed command: tạo InfoGroup "Hiệp hội & Mạng lưới chuyên môn"
với 2 Association cards theo đúng Figma.

Usage:
    python manage.py seed_hiep_hoi_figma
    python manage.py seed_hiep_hoi_figma --clear
"""

from __future__ import annotations

from django.core.management.base import BaseCommand

from apps.expert.models import Association, InfoGroup


GROUP_SLUG = "hiep-hoi-mang-luoi-chuyen-mon"

ASSOCIATIONS_FIGMA = [
    {
        "title": (
            "Mạng lưới Trung tâm Đào tạo Xuất sắc và Tài năng về Công nghệ 4.0 "
            "trong lĩnh vực Trí tuệ nhân tạo (AI) khu vực phía Nam"
        ),
        "badge_label": "Thành viên và Ban điều hành mở rộng",
        "badge_color": "#EC6D29",
        "icon": "cpu-chip",
        "icon_bg_color": "#EFF6FF",
        "description": (
            "IRDM tham gia mạng lưới nhằm tăng cường kết nối học thuật, nghiên cứu ứng dụng "
            "và phát triển năng lực trong lĩnh vực AI, đồng thời thúc đẩy hợp tác liên ngành "
            "giữa các trường đại học, viện nghiên cứu, bệnh viện và tổ chức triển khai tại "
            "khu vực phía Nam."
        ),
        "cta_label": "Tìm hiểu thêm",
        "cta_url": "",
        "cta_target": "_blank",
        "display_order": 1,
    },
    {
        "title": "Chi hội Văn phòng Công tác phía Nam của Hội Xã hội học Việt Nam",
        "badge_label": "Thành viên và Ban Chấp hành",
        "badge_color": "#EC6D29",
        "icon": "users",
        "icon_bg_color": "#EFF6FF",
        "description": (
            "IRDM gia Chi hội nhằm tăng cường kết nối học thuật, thúc đẩy nghiên cứu liên ngành "
            "và mở rộng đối thoại chuyên môn trong các lĩnh vực xã hội học sức khỏe, giáo dục, "
            "phát triển nguồn lực và chính sách xã hội."
        ),
        "cta_label": "Tìm hiểu thêm",
        "cta_url": "",
        "cta_target": "_blank",
        "display_order": 2,
    },
]


class Command(BaseCommand):
    help = "Seed InfoGroup 'Hiệp hội & Mạng lưới chuyên môn' với 2 Association cards theo Figma"

    def add_arguments(self, parser):
        parser.add_argument(
            "--clear",
            action="store_true",
            help="Xóa associations cũ của group này trước khi seed",
        )

    def handle(self, *args, **options):
        self.stdout.write(self.style.MIGRATE_HEADING("\n🌱 Seeding Hiệp hội & Mạng lưới chuyên môn..."))

        # ── 1. Tạo / cập nhật InfoGroup ───────────────────────────────────────
        group, created = InfoGroup.objects.update_or_create(
            slug=GROUP_SLUG,
            defaults={
                "name": "Hiệp hội & Mạng lưới chuyên môn",
                "icon": "globe-alt",
                "icon_bg_color": "#EFF6FF",
                "header_description": (
                    "Các hội khoa học, hiệp hội nghề nghiệp và mạng lưới chuyên môn mà IRDM "
                    "tham gia nhằm duy trì kết nối học thuật, cập nhật tri thức mới và mở rộng "
                    "hợp tác liên ngành."
                ),
                "section_description": (
                    "Các hội khoa học, hiệp hội nghề nghiệp và mạng lưới chuyên môn mà IRDM "
                    "tham gia nhằm duy trì kết nối học thuật, cập nhật tri thức mới và mở rộng "
                    "hợp tác liên ngành."
                ),
                "show_expert_grid": False,
                "expert_grid_flat": False,
                "show_association_grid": True,
                "is_active": True,
                "display_order": 5,  # sau "Giảng viên" (order 4)
            },
        )
        action = "Tạo mới" if created else "Cập nhật"
        self.stdout.write(f"  ✓ {action} InfoGroup: {group.name}")

        # ── 2. Clear nếu được yêu cầu ─────────────────────────────────────────
        if options["clear"]:
            group.associations.all().delete()
            self.stdout.write("  ✓ Đã xóa associations cũ")

        # ── 3. Tạo / cập nhật từng Association ───────────────────────────────
        for data in ASSOCIATIONS_FIGMA:
            order = data["display_order"]
            assoc, assoc_created = Association.objects.update_or_create(
                info_group=group,
                display_order=order,
                defaults={
                    "title": data["title"],
                    "badge_label": data["badge_label"],
                    "badge_color": data["badge_color"],
                    "icon": data["icon"],
                    "icon_bg_color": data["icon_bg_color"],
                    "description": data["description"],
                    "cta_label": data["cta_label"],
                    "cta_url": data["cta_url"],
                    "cta_target": data["cta_target"],
                    "is_active": True,
                },
            )
            act = "Tạo" if assoc_created else "Update"
            short_title = data["title"][:60] + ("..." if len(data["title"]) > 60 else "")
            self.stdout.write(f"  [{act}] {data['badge_label']}: {short_title}")

        # ── 4. Tổng kết ───────────────────────────────────────────────────────
        self.stdout.write("")
        self.stdout.write(
            self.style.SUCCESS(
                f"✅ Hoàn tất: {len(ASSOCIATIONS_FIGMA)} associations đã tạo cho '{group.name}'"
            )
        )
        self.stdout.write(
            "   Vào Admin → Expert → Nhóm thông tin → "
            f"'{group.name}' để xem và upload logo thực tế.\n"
        )
        self.stdout.write(
            "   Lưu ý: Logo VSA cho card 2 cần upload thủ công qua Admin → "
            "Expert → Nhóm thông tin → Hiệp hội/Mạng lưới inline.\n"
        )
