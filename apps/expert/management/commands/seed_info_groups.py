"""Management command to seed InfoGroup, OrgNode and InfoGroupBlock entries."""
from django.core.management.base import BaseCommand
from apps.expert.models import InfoGroup, InfoGroupBlock, OrgNode


GROUPS = [
    {
        "slug": "co-cau-to-chuc",
        "name": "Cơ cấu tổ chức",
        "icon": "building-office-2",
        "icon_bg_color": "#EFF6FF",
        "header_description": (
            "Giới thiệu các vị trí quản trị và điều hành chính của IRDM, "
            "thể hiện vai trò, trách nhiệm và mối liên kết giữa quản trị viện, "
            "chuyên môn và triển khai."
        ),
        "section_label": "CƠ CẤU TỔ CHỨC",
        "section_heading": (
            "Mô hình tổ chức tinh gọn, linh hoạt và chuyên môn hóa, kết nối hiệu quả "
            "giữa quản trị chiến lược, điều hành chuyên nghiệp, năng lực "
            "chuyên môn và mạng lưới chuyên gia liên ngành."
        ),
        "section_description": (
            "Viện IRDM vận hành theo mô hình tổ chức tinh gọn, hiệu quả và bền vững, "
            "bảo đảm nguyên tắc đúng người, đúng việc, đúng giá trị "
            "trong mọi hoạt động."
        ),
        "display_order": 1,
        "is_active": True,
        "org_nodes": [
            {"name": "HỘI ĐỒNG QUẢN LÝ",             "level": 0, "style": "filled",   "display_order": 1},
            {"name": "Viện trưởng",                    "level": 1, "style": "outlined", "display_order": 1},
            {"name": "Phòng Tổ chức – Hành chính",    "level": 2, "style": "default",  "display_order": 1},
            {"name": "Phòng Truyền thông – Marketing", "level": 2, "style": "default",  "display_order": 2},
            {"name": "Phòng Tài chính – Kế toán",     "level": 2, "style": "default",  "display_order": 3},
            {"name": "Phòng Công nghệ thông tin",      "level": 2, "style": "default",  "display_order": 4},
            {"name": "Phòng Đào tạo",                  "level": 2, "style": "default",  "display_order": 5},
            {"name": "Phòng Khoa học Công nghệ",       "level": 2, "style": "default",  "display_order": 6},
        ],
        "blocks": [
            {
                "title": "Hội đồng Quản lý",
                "function_label": "CHỨC NĂNG",
                "function_text": "Định hướng chiến lược và giám sát hoạt động chung của Viện.",
                "duties_label": "NHIỆM VỤ CHÍNH",
                "duties": (
                    "Phê duyệt định hướng phát triển và kế hoạch trọng tâm.\n"
                    "Giám sát nguyên tắc vận hành và quản trị rủi ro.\n"
                    "Bảo đảm sự nhất quán giữa sứ mệnh và hoạt động."
                ),
                "display_order": 1,
                "is_active": True,
            },
        ],
    },
    {
        "slug": "hoi-dong-khoa-hoc",
        "name": "Hội đồng khoa học",
        "icon": "academic-cap",
        "icon_bg_color": "#F0FDF4",
        "header_description": (
            "Hội đồng tư vấn khoa học độc lập, đảm bảo chất lượng "
            "nghiên cứu và định hướng phát triển học thuật của Viện IRDM."
        ),
        "section_label": "HỘI ĐỒNG KHOA HỌC",
        "section_heading": "Cơ quan tư vấn và thẩm định chất lượng nghiên cứu khoa học của Viện IRDM.",
        "section_description": (
            "Hội đồng Khoa học gồm các chuyên gia đầu ngành, có nhiệm vụ "
            "thẩm định chất lượng nghiên cứu, định hướng đề tài "
            "và giám sát tiêu chuẩn học thuật."
        ),
        "display_order": 2,
        "is_active": True,
        "org_nodes": [],
        "blocks": [],
    },
    {
        "slug": "nha-khoa-hoc-chuyen-gia",
        "name": "Nhà khoa học & Chuyên gia",
        "icon": "users",
        "icon_bg_color": "#FFF7ED",
        "header_description": (
            "Mạng lưới nhà khoa học và chuyên gia liên ngành, sẵn sàng đồng hành "
            "cùng doanh nghiệp, tổ chức trong giải quyết bài toán thực tiễn."
        ),
        "section_label": "NHÀ KHOA HỌC & CHUYÊN GIA",
        "section_heading": "Đội ngũ chuyên gia đa dạng, có thể đồng hành từ nghiên cứu đến triển khai thực tiễn.",
        "section_description": (
            "Viện IRDM kết nối với hàng trăm nhà khoa học và chuyên gia trong nhiều lĩnh vực, "
            "từ kinh tế, quản trị đến công nghệ và y tế."
        ),
        "display_order": 3,
        "is_active": True,
        "org_nodes": [],
        "blocks": [],
    },
]


class Command(BaseCommand):
    help = "Seed InfoGroup, OrgNode and InfoGroupBlock entries."

    def handle(self, *args, **options):
        for data in GROUPS:
            slug = data["slug"]
            org_nodes_data = data.pop("org_nodes", [])
            blocks_data = data.pop("blocks", [])
            data.pop("slug")

            group, created = InfoGroup.objects.update_or_create(
                slug=slug,
                defaults=data,
            )
            status = "created" if created else "updated"
            self.stdout.write(f"  InfoGroup '{group.name}': {status}")

            # Seed OrgNodes
            for node_data in org_nodes_data:
                OrgNode.objects.update_or_create(
                    info_group=group,
                    name=node_data["name"],
                    defaults={
                        "level": node_data.get("level", 2),
                        "style": node_data.get("style", "default"),
                        "display_order": node_data.get("display_order", 1),
                        "is_active": node_data.get("is_active", True),
                    },
                )
            if org_nodes_data:
                self.stdout.write(f"    → {len(org_nodes_data)} OrgNode(s) seeded")

            # Seed InfoGroupBlocks
            for block_data in blocks_data:
                InfoGroupBlock.objects.update_or_create(
                    info_group=group,
                    title=block_data["title"],
                    defaults={k: v for k, v in block_data.items() if k != "title"},
                )
            if blocks_data:
                self.stdout.write(f"    → {len(blocks_data)} InfoGroupBlock(s) seeded")

        self.stdout.write(self.style.SUCCESS("Done seeding InfoGroup data."))
