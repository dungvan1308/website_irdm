"""
Management command: seed_expert

Populate the Expert module with realistic demonstration data
based on the Figma design: figmapng/experts/DoiNguChuyenGia.png

Idempotent — safe to run multiple times (uses get_or_create).
"""

from django.core.management.base import BaseCommand
from django.utils.text import slugify

from apps.expert.models import (
    Expert,
    ExpertGroup,
    ExpertListingPage,
    KnowledgeTopic,
    ProcessStep,
    ResearchArea,
)


# ─── Listing Page (singleton) ─────────────────────────────────────────────────

LISTING_PAGE = {
    "hero_eyebrow": "MẠNG LƯỚI CHUYÊN GIA IRDM",
    "hero_heading": "MẠNG LƯỚI NHÀ KHOA HỌC & CHUYÊN GIA LIÊN NGÀNH",
    "hero_description": (
        "Viện IRDM quy tụ đội ngũ hơn 200 nhà khoa học và chuyên gia đầu ngành, "
        "kết nối tri thức liên ngành để giải quyết những thách thức phức tạp "
        "của xã hội và doanh nghiệp."
    ),
    "hero_btn1_label": "TÌM HIỂU THÊM",
    "hero_btn1_url": "#ket-noi",
    "hero_btn2_label": "ĐĂNG KÝ CHUYÊN GIA",
    "hero_btn2_url": "/lien-he/",
    "process_heading": "VIỆN IRDM KẾT NỐI CHUYÊN GIA NHƯ THẾ NÀO?",
    "process_description": (
        "Quy trình 4 bước đơn giản, minh bạch để kết nối bạn với chuyên gia phù hợp nhất."
    ),
    "senior_heading": "CHUYÊN GIA CAO CẤP CỦA VIỆN IRDM",
    "senior_cta_label": "Xem tất cả chuyên gia",
    "senior_cta_url": "#tim-kiem",
    "map_heading": "BẢN ĐỒ CHUYÊN MÔN LIÊN NGÀNH",
    "map_description": (
        "Viện IRDM tập hợp chuyên gia từ nhiều lĩnh vực khác nhau, "
        "tạo nên mạng lưới tri thức liên ngành toàn diện."
    ),
    "directory_heading": "TÌM NHÀ KHOA HỌC/CHUYÊN GIA",
    "topic_heading": "CÁC CHỦ ĐỀ THÔNG TIN CHUYÊN MÔN",
    "topic_description": (
        "Khám phá các chủ đề nghiên cứu và tìm hiểu đội ngũ chuyên gia "
        "đang nghiên cứu trong từng lĩnh vực."
    ),
    "cta_eyebrow": "KẾT NỐI VỚI IRDM",
    "cta_heading": "BẠN ĐANG TÌM KIẾM CHUYÊN GIA?",
    "cta_description": (
        "Liên hệ với Viện IRDM để được tư vấn và kết nối với chuyên gia "
        "phù hợp với nhu cầu của bạn."
    ),
    "cta_btn1_label": "LIÊN HỆ NGAY",
    "cta_btn1_url": "/lien-he/",
    "cta_btn2_label": "ĐĂNG KÝ CHUYÊN GIA",
    "cta_btn2_url": "/lien-he/",
    "meta_title": "Đội Ngũ Chuyên Gia Liên Ngành | Viện IRDM",
    "meta_description": (
        "Khám phá mạng lưới nhà khoa học và chuyên gia liên ngành của Viện IRDM. "
        "Tìm chuyên gia phù hợp theo lĩnh vực nghiên cứu."
    ),
    "is_active": True,
    "display_order": 0,
}


# ─── Expert Groups ────────────────────────────────────────────────────────────

GROUPS = [
    {"name": "Nhà khoa học & Nghiên cứu viên", "slug": "nha-khoa-hoc", "display_order": 1},
    {"name": "Chuyên gia tư vấn doanh nghiệp", "slug": "tu-van-doanh-nghiep", "display_order": 2},
    {"name": "Giảng viên & Học giả", "slug": "giang-vien", "display_order": 3},
    {"name": "Chuyên gia chính sách", "slug": "chuyen-gia-chinh-sach", "display_order": 4},
    {"name": "Chuyên gia quốc tế", "slug": "chuyen-gia-quoc-te", "display_order": 5},
]


# ─── Research Areas ───────────────────────────────────────────────────────────

AREAS = [
    {"name": "Kinh tế học liên ngành", "slug": "kinh-te-hoc-lien-nganh", "icon": "chart-bar", "color": "#1d4ed8", "display_order": 1},
    {"name": "Quản trị & Lãnh đạo", "slug": "quan-tri-lanh-dao", "icon": "briefcase", "color": "#7c3aed", "display_order": 2},
    {"name": "Khoa học dữ liệu & AI", "slug": "khoa-hoc-du-lieu-ai", "icon": "cpu", "color": "#0891b2", "display_order": 3},
    {"name": "Chính sách công & Quản lý nhà nước", "slug": "chinh-sach-cong", "icon": "building-library", "color": "#0f766e", "display_order": 4},
    {"name": "Phát triển bền vững", "slug": "phat-trien-ben-vung", "icon": "leaf", "color": "#15803d", "display_order": 5},
    {"name": "Giáo dục & Đào tạo", "slug": "giao-duc-dao-tao", "icon": "academic-cap", "color": "#b45309", "display_order": 6},
    {"name": "Y tế & Sức khỏe cộng đồng", "slug": "y-te-suc-khoe-cong-dong", "icon": "heart", "color": "#be123c", "display_order": 7},
    {"name": "Công nghệ & Đổi mới sáng tạo", "slug": "cong-nghe-doi-moi", "icon": "light-bulb", "color": "#ea580c", "display_order": 8},
]


# ─── Process Steps ────────────────────────────────────────────────────────────

STEPS = [
    {
        "step_number": 1,
        "title": "Tiếp nhận nhu cầu",
        "icon": "document-text",
        "description": (
            "Bạn gửi yêu cầu tư vấn, mô tả vấn đề cần giải quyết "
            "và lĩnh vực cần chuyên gia."
        ),
        "display_order": 1,
    },
    {
        "step_number": 2,
        "title": "Phân tích & Khớp chuyên gia",
        "icon": "magnifying-glass",
        "description": (
            "Đội ngũ IRDM phân tích nhu cầu và tìm kiếm chuyên gia "
            "phù hợp nhất từ mạng lưới."
        ),
        "display_order": 2,
    },
    {
        "step_number": 3,
        "title": "Kết nối & Tư vấn ban đầu",
        "icon": "user-group",
        "description": (
            "Chúng tôi kết nối bạn với chuyên gia, tổ chức buổi "
            "tư vấn khám phá ban đầu."
        ),
        "display_order": 3,
    },
    {
        "step_number": 4,
        "title": "Theo dõi & Đánh giá",
        "icon": "chart-bar-square",
        "description": (
            "IRDM theo dõi chất lượng hợp tác và thu thập phản hồi "
            "để cải thiện liên tục."
        ),
        "display_order": 4,
    },
]


# ─── Knowledge Topics ─────────────────────────────────────────────────────────

TOPICS = [
    {
        "name": "Chuyển đổi số và đổi mới sáng tạo",
        "slug": "chuyen-doi-so-doi-moi-sang-tao",
        "description": "Các nghiên cứu và ứng dụng về chuyển đổi số trong tổ chức, doanh nghiệp và khu vực công.",
        "display_order": 1,
    },
    {
        "name": "Phát triển kinh tế bền vững",
        "slug": "phat-trien-kinh-te-ben-vung",
        "description": "Nghiên cứu các mô hình kinh tế bền vững, tăng trưởng xanh và tác động xã hội.",
        "display_order": 2,
    },
    {
        "name": "Quản trị tổ chức & Lãnh đạo chiến lược",
        "slug": "quan-tri-to-chuc-lanh-dao-chien-luoc",
        "description": "Khung lý thuyết và thực tiễn về quản trị hiệu quả, lãnh đạo thay đổi và xây dựng năng lực tổ chức.",
        "display_order": 3,
    },
    {
        "name": "Giáo dục & Phát triển nhân lực",
        "slug": "giao-duc-phat-trien-nhan-luc",
        "description": "Chính sách giáo dục, đào tạo nghề và phát triển nguồn nhân lực chất lượng cao.",
        "display_order": 4,
    },
    {
        "name": "Chính sách công & Thể chế",
        "slug": "chinh-sach-cong-the-che",
        "description": "Phân tích chính sách, cải cách thể chế và quản trị nhà nước hiện đại.",
        "display_order": 5,
    },
    {
        "name": "Sức khỏe cộng đồng & Y tế",
        "slug": "suc-khoe-cong-dong-y-te",
        "description": "Nghiên cứu y tế công cộng, hệ thống y tế và các can thiệp sức khỏe cộng đồng.",
        "display_order": 6,
    },
]


# ─── Expert Data ──────────────────────────────────────────────────────────────

EXPERTS = [
    # ── Senior / Featured Experts (is_senior=True) ────────────────────────────
    {
        "name": "Nguyễn Văn An",
        "academic_title": "GS.TS.",
        "position": "Giáo sư Kinh tế học",
        "organization": "Đại học Kinh tế Quốc dân",
        "group_slug": "nha-khoa-hoc",
        "areas": ["kinh-te-hoc-lien-nganh", "phat-trien-ben-vung"],
        "topics": ["phat-trien-kinh-te-ben-vung", "chinh-sach-cong-the-che"],
        "short_bio": (
            "Chuyên gia hàng đầu về kinh tế phát triển với hơn 25 năm kinh nghiệm "
            "nghiên cứu và tư vấn chính sách. Từng là cố vấn cho các tổ chức quốc tế "
            "như World Bank và ADB."
        ),
        "is_senior": True,
        "is_featured": True,
        "is_published": True,
        "display_order": 1,
    },
    {
        "name": "Trần Thị Bình",
        "academic_title": "PGS.TS.",
        "position": "Phó Giáo sư Quản trị Kinh doanh",
        "organization": "Đại học Ngoại thương",
        "group_slug": "giang-vien",
        "areas": ["quan-tri-lanh-dao", "cong-nghe-doi-moi"],
        "topics": ["quan-tri-to-chuc-lanh-dao-chien-luoc", "chuyen-doi-so-doi-moi-sang-tao"],
        "short_bio": (
            "Chuyên gia về quản trị doanh nghiệp và chuyển đổi số với nhiều công trình "
            "nghiên cứu được quốc tế công nhận. Tác giả của 3 cuốn sách về lãnh đạo "
            "trong thời đại số."
        ),
        "is_senior": True,
        "is_featured": True,
        "is_published": True,
        "display_order": 2,
    },
    {
        "name": "Lê Minh Châu",
        "academic_title": "TS.",
        "position": "Tiến sĩ Khoa học Dữ liệu",
        "organization": "Đại học Bách khoa Hà Nội",
        "group_slug": "nha-khoa-hoc",
        "areas": ["khoa-hoc-du-lieu-ai", "cong-nghe-doi-moi"],
        "topics": ["chuyen-doi-so-doi-moi-sang-tao"],
        "short_bio": (
            "Chuyên gia AI và phân tích dữ liệu lớn, từng làm việc tại MIT Media Lab "
            "và Google Research. Hiện đang dẫn dắt nhóm nghiên cứu AI ứng dụng trong "
            "y tế và giáo dục."
        ),
        "is_senior": True,
        "is_featured": True,
        "is_published": True,
        "display_order": 3,
    },
    # ── Regular Experts ───────────────────────────────────────────────────────
    {
        "name": "Phạm Đức Hùng",
        "academic_title": "PGS.TS.",
        "position": "Phó Giáo sư Chính sách Công",
        "organization": "Học viện Hành chính Quốc gia",
        "group_slug": "chuyen-gia-chinh-sach",
        "areas": ["chinh-sach-cong", "kinh-te-hoc-lien-nganh"],
        "topics": ["chinh-sach-cong-the-che", "phat-trien-kinh-te-ben-vung"],
        "short_bio": "Chuyên gia về cải cách hành chính và quản trị nhà nước với 20 năm kinh nghiệm tư vấn chính phủ.",
        "is_published": True,
        "display_order": 4,
    },
    {
        "name": "Vũ Thị Lan",
        "academic_title": "TS.",
        "position": "Tiến sĩ Y tế Cộng đồng",
        "organization": "Đại học Y Hà Nội",
        "group_slug": "nha-khoa-hoc",
        "areas": ["y-te-suc-khoe-cong-dong"],
        "topics": ["suc-khoe-cong-dong-y-te"],
        "short_bio": "Nhà nghiên cứu y tế công cộng, chuyên gia về dinh dưỡng cộng đồng và can thiệp hành vi sức khỏe.",
        "is_published": True,
        "display_order": 5,
    },
    {
        "name": "Ngô Quang Minh",
        "academic_title": "GS.",
        "position": "Giáo sư Giáo dục học",
        "organization": "Đại học Sư phạm Hà Nội",
        "group_slug": "giang-vien",
        "areas": ["giao-duc-dao-tao"],
        "topics": ["giao-duc-phat-trien-nhan-luc"],
        "short_bio": "Chuyên gia hàng đầu về cải cách giáo dục và đào tạo giáo viên, cố vấn Bộ Giáo dục và Đào tạo.",
        "is_published": True,
        "display_order": 6,
    },
    {
        "name": "Đỗ Thị Hương",
        "academic_title": "TS.",
        "position": "Chuyên gia Phát triển bền vững",
        "organization": "Viện Chiến lược và Chính sách Tài nguyên Môi trường",
        "group_slug": "chuyen-gia-chinh-sach",
        "areas": ["phat-trien-ben-vung", "chinh-sach-cong"],
        "topics": ["phat-trien-kinh-te-ben-vung", "chinh-sach-cong-the-che"],
        "short_bio": "Nhà nghiên cứu về kinh tế xanh và phát triển bền vững, tư vấn cho UNDP và GIZ tại Việt Nam.",
        "is_published": True,
        "display_order": 7,
    },
    {
        "name": "Hoàng Văn Thành",
        "academic_title": "TS.",
        "position": "Giám đốc Chuyển đổi số",
        "organization": "Tập đoàn FPT",
        "group_slug": "tu-van-doanh-nghiep",
        "areas": ["cong-nghe-doi-moi", "khoa-hoc-du-lieu-ai"],
        "topics": ["chuyen-doi-so-doi-moi-sang-tao"],
        "short_bio": "Lãnh đạo chuyển đổi số với 15 năm kinh nghiệm triển khai giải pháp công nghệ cho doanh nghiệp lớn.",
        "is_published": True,
        "display_order": 8,
    },
    {
        "name": "Nguyễn Thị Mai",
        "academic_title": "PGS.TS.",
        "position": "Phó Giáo sư Xã hội học",
        "organization": "Đại học Khoa học Xã hội và Nhân văn",
        "group_slug": "giang-vien",
        "areas": ["giao-duc-dao-tao", "phat-trien-ben-vung"],
        "topics": ["giao-duc-phat-trien-nhan-luc", "suc-khoe-cong-dong-y-te"],
        "short_bio": "Nhà nghiên cứu xã hội học chuyên về bất bình đẳng giới, di cư lao động và an sinh xã hội.",
        "is_published": True,
        "display_order": 9,
    },
    {
        "name": "Richard Thompson",
        "academic_title": "Prof.",
        "position": "Professor of International Economics",
        "organization": "University of Melbourne",
        "group_slug": "chuyen-gia-quoc-te",
        "areas": ["kinh-te-hoc-lien-nganh", "phat-trien-ben-vung"],
        "topics": ["phat-trien-kinh-te-ben-vung"],
        "short_bio": "International expert on economic development in Southeast Asia with 30+ years of research experience.",
        "is_published": True,
        "display_order": 10,
    },
    {
        "name": "Lý Thị Kim Ngân",
        "academic_title": "TS.",
        "position": "Chuyên gia Tài chính Công",
        "organization": "Học viện Tài chính",
        "group_slug": "chuyen-gia-chinh-sach",
        "areas": ["kinh-te-hoc-lien-nganh", "chinh-sach-cong"],
        "topics": ["chinh-sach-cong-the-che", "phat-trien-kinh-te-ben-vung"],
        "short_bio": "Chuyên gia tài chính công và ngân sách nhà nước, từng tư vấn cho Bộ Tài chính về cải cách thuế.",
        "is_published": True,
        "display_order": 11,
    },
    {
        "name": "Trần Quốc Bảo",
        "academic_title": "PGS.TS.",
        "position": "Giám đốc Trung tâm Nghiên cứu AI",
        "organization": "Đại học Quốc gia Hà Nội",
        "group_slug": "nha-khoa-hoc",
        "areas": ["khoa-hoc-du-lieu-ai", "cong-nghe-doi-moi"],
        "topics": ["chuyen-doi-so-doi-moi-sang-tao"],
        "short_bio": "Nhà nghiên cứu AI và học máy, trưởng nhóm nghiên cứu xử lý ngôn ngữ tự nhiên tiếng Việt.",
        "is_published": True,
        "display_order": 12,
    },
    {
        "name": "Yoshida Kenji",
        "academic_title": "Dr.",
        "position": "Senior Researcher",
        "organization": "JICA Research Institute",
        "group_slug": "chuyen-gia-quoc-te",
        "areas": ["giao-duc-dao-tao", "chinh-sach-cong"],
        "topics": ["giao-duc-phat-trien-nhan-luc", "chinh-sach-cong-the-che"],
        "short_bio": "Japanese development economist specializing in education policy reform and human capital development in Asia.",
        "is_published": True,
        "display_order": 13,
    },
    {
        "name": "Bùi Thị Thu Hà",
        "academic_title": "TS.",
        "position": "Chuyên gia Phát triển Tổ chức",
        "organization": "Công ty Tư vấn McKinsey Vietnam",
        "group_slug": "tu-van-doanh-nghiep",
        "areas": ["quan-tri-lanh-dao", "cong-nghe-doi-moi"],
        "topics": ["quan-tri-to-chuc-lanh-dao-chien-luoc", "chuyen-doi-so-doi-moi-sang-tao"],
        "short_bio": "Chuyên gia tư vấn chiến lược với hơn 18 năm kinh nghiệm giúp doanh nghiệp Việt Nam nâng cao năng lực cạnh tranh.",
        "is_published": True,
        "display_order": 14,
    },
    {
        "name": "Đinh Văn Phúc",
        "academic_title": "GS.TS.",
        "position": "Giáo sư Y học Dự phòng",
        "organization": "Đại học Y Dược TP.HCM",
        "group_slug": "nha-khoa-hoc",
        "areas": ["y-te-suc-khoe-cong-dong"],
        "topics": ["suc-khoe-cong-dong-y-te"],
        "short_bio": "Chuyên gia y học dự phòng và dịch tễ học, trưởng nhóm nghiên cứu về bệnh không lây nhiễm tại Việt Nam.",
        "is_published": True,
        "display_order": 15,
    },
    {
        "name": "Phạm Thị Lan Anh",
        "academic_title": "TS.",
        "position": "Chuyên gia Lãnh đạo Phụ nữ",
        "organization": "Hội Liên hiệp Phụ nữ Việt Nam",
        "group_slug": "chuyen-gia-chinh-sach",
        "areas": ["giao-duc-dao-tao", "chinh-sach-cong"],
        "topics": ["giao-duc-phat-trien-nhan-luc", "chinh-sach-cong-the-che"],
        "short_bio": "Chuyên gia về bình đẳng giới và lãnh đạo phụ nữ trong khu vực công và tư nhân.",
        "is_published": True,
        "display_order": 16,
    },
    {
        "name": "Cao Xuân Hưng",
        "academic_title": "TS.",
        "position": "Giám đốc Sản phẩm",
        "organization": "VNG Corporation",
        "group_slug": "tu-van-doanh-nghiep",
        "areas": ["cong-nghe-doi-moi", "khoa-hoc-du-lieu-ai"],
        "topics": ["chuyen-doi-so-doi-moi-sang-tao"],
        "short_bio": "Nhà lãnh đạo sản phẩm công nghệ với kinh nghiệm xây dựng nền tảng số phục vụ hàng triệu người dùng.",
        "is_published": True,
        "display_order": 17,
    },
    {
        "name": "Sarah Chen",
        "academic_title": "Dr.",
        "position": "Associate Professor of Development Studies",
        "organization": "National University of Singapore",
        "group_slug": "chuyen-gia-quoc-te",
        "areas": ["phat-trien-ben-vung", "chinh-sach-cong"],
        "topics": ["phat-trien-kinh-te-ben-vung", "chinh-sach-cong-the-che"],
        "short_bio": "Researcher in sustainable development and urban governance with extensive fieldwork across Southeast Asia.",
        "is_published": True,
        "display_order": 18,
    },
    {
        "name": "Lê Thị Thanh Huyền",
        "academic_title": "PGS.TS.",
        "position": "Phó Giáo sư Kinh tế Lao động",
        "organization": "Viện Khoa học Lao động và Xã hội",
        "group_slug": "nha-khoa-hoc",
        "areas": ["kinh-te-hoc-lien-nganh", "giao-duc-dao-tao"],
        "topics": ["giao-duc-phat-trien-nhan-luc", "phat-trien-kinh-te-ben-vung"],
        "short_bio": "Chuyên gia kinh tế lao động và an sinh xã hội, nghiên cứu về thị trường lao động và kỹ năng nghề.",
        "is_published": True,
        "display_order": 19,
    },
    {
        "name": "Nguyễn Bảo Long",
        "academic_title": "TS.",
        "position": "Chuyên gia ESG & Bền vững",
        "organization": "KPMG Vietnam",
        "group_slug": "tu-van-doanh-nghiep",
        "areas": ["phat-trien-ben-vung", "quan-tri-lanh-dao"],
        "topics": ["phat-trien-kinh-te-ben-vung", "quan-tri-to-chuc-lanh-dao-chien-luoc"],
        "short_bio": "Chuyên gia về báo cáo ESG và chiến lược phát triển bền vững cho các tập đoàn đa quốc gia tại Việt Nam.",
        "is_published": True,
        "display_order": 20,
    },
    {
        "name": "Đặng Thị Minh Châu",
        "academic_title": "TS.",
        "position": "Chuyên gia Tâm lý Tổ chức",
        "organization": "Đại học Khoa học Xã hội và Nhân văn TP.HCM",
        "group_slug": "giang-vien",
        "areas": ["quan-tri-lanh-dao", "giao-duc-dao-tao"],
        "topics": ["quan-tri-to-chuc-lanh-dao-chien-luoc", "giao-duc-phat-trien-nhan-luc"],
        "short_bio": "Nhà tâm lý học tổ chức với chuyên môn về văn hóa doanh nghiệp, quản lý thay đổi và phát triển lãnh đạo.",
        "is_published": True,
        "display_order": 21,
    },
    {
        "name": "Trương Văn Khoa",
        "academic_title": "GS.TS.",
        "position": "Giáo sư Toán học Ứng dụng",
        "organization": "Đại học Khoa học Tự nhiên",
        "group_slug": "nha-khoa-hoc",
        "areas": ["khoa-hoc-du-lieu-ai", "kinh-te-hoc-lien-nganh"],
        "topics": ["chuyen-doi-so-doi-moi-sang-tao"],
        "short_bio": "Nhà toán học ứng dụng chuyên về mô hình hóa kinh tế và dự báo tài chính, thành viên Hội Toán học Việt Nam.",
        "is_published": True,
        "display_order": 22,
    },
    {
        "name": "Phan Thị Ngọc Linh",
        "academic_title": "TS.",
        "position": "Chuyên gia Dinh dưỡng Cộng đồng",
        "organization": "Viện Dinh dưỡng Quốc gia",
        "group_slug": "nha-khoa-hoc",
        "areas": ["y-te-suc-khoe-cong-dong"],
        "topics": ["suc-khoe-cong-dong-y-te"],
        "short_bio": "Chuyên gia dinh dưỡng và an toàn thực phẩm, chủ nhiệm nhiều đề tài nghiên cứu cấp quốc gia về dinh dưỡng học sinh.",
        "is_published": True,
        "display_order": 23,
    },
    {
        "name": "Michael Park",
        "academic_title": "Prof.",
        "position": "Professor of Digital Transformation",
        "organization": "KAIST",
        "group_slug": "chuyen-gia-quoc-te",
        "areas": ["cong-nghe-doi-moi", "khoa-hoc-du-lieu-ai"],
        "topics": ["chuyen-doi-so-doi-moi-sang-tao"],
        "short_bio": "Pioneer in digital transformation research with 20+ years studying technology adoption in emerging economies.",
        "is_published": True,
        "display_order": 24,
    },
    {
        "name": "Võ Thị Thanh Tâm",
        "academic_title": "PGS.TS.",
        "position": "Phó Giáo sư Quản trị Y tế",
        "organization": "Đại học Y tế Công cộng",
        "group_slug": "giang-vien",
        "areas": ["y-te-suc-khoe-cong-dong", "chinh-sach-cong"],
        "topics": ["suc-khoe-cong-dong-y-te", "chinh-sach-cong-the-che"],
        "short_bio": "Chuyên gia quản trị bệnh viện và chính sách y tế, tư vấn cải cách hệ thống y tế cho nhiều tỉnh thành.",
        "is_published": True,
        "display_order": 25,
    },
]


# ─── Command ──────────────────────────────────────────────────────────────────

class Command(BaseCommand):
    help = "Seed the Expert module with demonstration data matching the Figma design."

    def handle(self, *args, **options):
        self.stdout.write(self.style.MIGRATE_HEADING("=== Seeding Expert module ==="))

        # 1. Listing page
        self._seed_listing_page()

        # 2. Expert groups
        groups = self._seed_groups()

        # 3. Research areas
        areas = self._seed_research_areas()

        # 4. Process steps
        self._seed_process_steps()

        # 5. Knowledge topics
        topics = self._seed_knowledge_topics()

        # 6. Experts
        self._seed_experts(groups, areas, topics)

        self.stdout.write(self.style.SUCCESS("\n✓ Expert module seed complete."))

    # ── helpers ───────────────────────────────────────────────────────────────

    def _seed_listing_page(self):
        obj, created = ExpertListingPage.objects.get_or_create(
            hero_heading=LISTING_PAGE["hero_heading"],
            defaults=LISTING_PAGE,
        )
        if created:
            self.stdout.write("  ✓ ExpertListingPage created")
        else:
            # Update fields in case spec changed
            for k, v in LISTING_PAGE.items():
                setattr(obj, k, v)
            obj.save()
            self.stdout.write("  ↺ ExpertListingPage updated")

    def _seed_groups(self):
        groups = {}
        for data in GROUPS:
            obj, created = ExpertGroup.objects.get_or_create(
                slug=data["slug"],
                defaults={**data, "is_active": True},
            )
            if not created:
                obj.name = data["name"]
                obj.display_order = data["display_order"]
                obj.save()
            groups[data["slug"]] = obj
        self.stdout.write(f"  ✓ {len(groups)} ExpertGroups seeded")
        return groups

    def _seed_research_areas(self):
        areas = {}
        for data in AREAS:
            obj, created = ResearchArea.objects.get_or_create(
                slug=data["slug"],
                defaults={**data, "is_active": True},
            )
            if not created:
                for k, v in data.items():
                    setattr(obj, k, v)
                obj.save()
            areas[data["slug"]] = obj
        self.stdout.write(f"  ✓ {len(areas)} ResearchAreas seeded")
        return areas

    def _seed_process_steps(self):
        ProcessStep.objects.all().delete()
        for data in STEPS:
            ProcessStep.objects.create(**data, is_active=True)
        self.stdout.write(f"  ✓ {len(STEPS)} ProcessSteps seeded")

    def _seed_knowledge_topics(self):
        topics = {}
        for data in TOPICS:
            obj, created = KnowledgeTopic.objects.get_or_create(
                slug=data["slug"],
                defaults={**data, "is_active": True},
            )
            if not created:
                for k, v in data.items():
                    setattr(obj, k, v)
                obj.save()
            topics[data["slug"]] = obj
        self.stdout.write(f"  ✓ {len(topics)} KnowledgeTopics seeded")
        return topics

    def _seed_experts(self, groups, areas, topics):
        created_count = 0
        updated_count = 0

        for data in EXPERTS:
            group_slug = data.pop("group_slug", None)
            area_slugs = data.pop("areas", [])
            topic_slugs = data.pop("topics", [])

            # Build slug from name
            slug = slugify(data["name"], allow_unicode=False)
            # Fallback for Vietnamese names that slugify poorly
            import unicodedata
            import re
            name_norm = unicodedata.normalize("NFD", data["name"])
            name_ascii = "".join(c for c in name_norm if unicodedata.category(c) != "Mn")
            slug = re.sub(r"[^a-z0-9-]", "-", name_ascii.lower())
            slug = re.sub(r"-+", "-", slug).strip("-")

            defaults = {k: v for k, v in data.items() if k != "name"}
            defaults["group"] = groups.get(group_slug) if group_slug else None

            obj, created = Expert.objects.get_or_create(
                slug=slug,
                defaults={"name": data["name"], "slug": slug, **defaults},
            )
            if not created:
                for k, v in defaults.items():
                    setattr(obj, k, v)
                obj.name = data["name"]
                obj.save()
                updated_count += 1
            else:
                created_count += 1

            # M2M: research areas
            if area_slugs:
                obj.research_areas.set([areas[s] for s in area_slugs if s in areas])

            # M2M: knowledge topics
            if topic_slugs:
                obj.knowledge_topics.set([topics[s] for s in topic_slugs if s in topics])
                # Also add expert to topic.experts M2M (reverse)
                for ts in topic_slugs:
                    if ts in topics:
                        topics[ts].experts.add(obj)

        self.stdout.write(
            f"  ✓ Experts: {created_count} created, {updated_count} updated "
            f"({created_count + updated_count} total)"
        )
