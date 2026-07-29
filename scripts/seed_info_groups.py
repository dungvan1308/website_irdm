"""One-shot seed script for default InfoGroup entries."""
import django
import os

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings")
django.setup()

from apps.expert.models import InfoGroup  # noqa: E402

ORG_CHART_HTML = (
    '<div class="space-y-6">'
    '<div class="rounded-xl border border-slate-200 bg-white p-6">'
    '<div class="flex flex-col items-center gap-0">'
    '<div class="px-6 py-2.5 bg-primary-700 text-white text-sm font-bold rounded-lg text-center min-w-[200px]">'
    "HỘI ĐỒNG QUẢN LÝ"
    "</div>"
    '<div class="w-px h-5 bg-slate-300"></div>'
    '<div class="px-6 py-2.5 bg-white border-2 border-primary-300 text-primary-900 text-sm font-semibold rounded-lg text-center min-w-[200px]">'
    "Viện trưởng"
    "</div>"
    '<div class="w-px h-5 bg-slate-300"></div>'
    '<div class="flex flex-wrap justify-center gap-3 max-w-3xl">'
    '<div class="px-4 py-2 bg-slate-50 border border-slate-200 text-slate-700 text-xs font-medium rounded-lg text-center">Phòng Tổ chức – Hành chính</div>'
    '<div class="px-4 py-2 bg-slate-50 border border-slate-200 text-slate-700 text-xs font-medium rounded-lg text-center">Phòng Truyền thông – Marketing</div>'
    '<div class="px-4 py-2 bg-slate-50 border border-slate-200 text-slate-700 text-xs font-medium rounded-lg text-center">Phòng Tài chính – Kế toán</div>'
    '<div class="px-4 py-2 bg-slate-50 border border-slate-200 text-slate-700 text-xs font-medium rounded-lg text-center">Phòng Công nghệ thông tin</div>'
    '<div class="px-4 py-2 bg-slate-50 border border-slate-200 text-slate-700 text-xs font-medium rounded-lg text-center">Phòng Đào tạo</div>'
    '<div class="px-4 py-2 bg-slate-50 border border-slate-200 text-slate-700 text-xs font-medium rounded-lg text-center">Phòng Khoa học Công nghệ</div>'
    "</div>"
    "</div>"
    "</div>"
    '<div class="rounded-xl border border-slate-200 bg-white p-5">'
    '<h5 class="font-semibold text-primary-900 text-sm mb-3">Hội đồng Quản lý</h5>'
    '<p class="text-xs font-bold uppercase tracking-wider text-primary-600 mb-1">CHỨC NĂNG</p>'
    '<p class="text-sm text-slate-600 mb-3">Định hướng chiến lược và giám sát hoạt động chung của Viện.</p>'
    '<p class="text-xs font-bold uppercase tracking-wider text-primary-600 mb-1">NHIỆM VỤ CHÍNH</p>'
    '<ul class="list-disc list-inside text-sm text-slate-600 space-y-1">'
    "<li>Phê duyệt định hướng phát triển và kế hoạch trọng tâm.</li>"
    "<li>Giám sát nguyên tắc vận hành và quản trị rủi ro.</li>"
    "<li>Bảo đảm sự nhất quán giữa sứ mệnh và hoạt động.</li>"
    "</ul>"
    "</div>"
    "</div>"
)

groups = [
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
            "giữa quản trị chiến lược, điều hành chuyên nghiệp, năng lực chuyên môn "
            "và mạng lưới chuyên gia liên ngành."
        ),
        "section_description": (
            "Viện IRDM vận hành theo mô hình tổ chức tinh gọn, hiệu quả và bền vững, "
            "bảo đảm nguyên tắc đúng người, đúng việc, đúng giá trị trong mọi hoạt động."
        ),
        "body_html": ORG_CHART_HTML,
        "display_order": 1,
        "is_active": True,
    },
    {
        "slug": "hoi-dong-khoa-hoc",
        "name": "Hội đồng khoa học",
        "icon": "academic-cap",
        "icon_bg_color": "#F0FDF4",
        "header_description": (
            "Hội đồng tư vấn khoa học độc lập, đảm bảo chất lượng nghiên cứu và "
            "định hướng phát triển học thuật của Viện IRDM."
        ),
        "section_label": "HỘI ĐỒNG KHOA HỌC",
        "section_heading": "Cơ quan tư vấn và thẩm định chất lượng nghiên cứu khoa học của Viện IRDM.",
        "section_description": (
            "Hội đồng Khoa học gồm các chuyên gia đầu ngành, có nhiệm vụ thẩm định "
            "chất lượng nghiên cứu, định hướng đề tài và giám sát tiêu chuẩn học thuật."
        ),
        "body_html": "",
        "display_order": 2,
        "is_active": True,
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
        "body_html": "",
        "display_order": 3,
        "is_active": True,
    },
]

for data in groups:
    slug = data.pop("slug")
    obj, created = InfoGroup.objects.get_or_create(slug=slug, defaults=data)
    print(f"InfoGroup '{obj.name}': {'created' if created else 'already exists'}")

print("Done.")
