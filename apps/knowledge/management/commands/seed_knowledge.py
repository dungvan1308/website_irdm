"""
Management command: seed_knowledge

Populates the Knowledge module with demonstration data matching the
approved Figma design (figmapng/knowledge/TriThuc_GocNhinNganh.png).

Uses real assets from assets_irdm_web/Tri thức và góc nhìn/ where available.
Falls back to Pillow gradient placeholder when no asset found.

Idempotent — safe to run multiple times.
"""

import io
import os
from datetime import date
from pathlib import Path

from django.conf import settings
from django.core.files.base import ContentFile
from django.core.management.base import BaseCommand

from apps.knowledge.models import (
    KnowledgeArticle,
    KnowledgeCategory,
    KnowledgeDownload,
    KnowledgeFeaturedArticle,
    KnowledgeFilterGroup,
    KnowledgeFilterItem,
    KnowledgeListingPage,
    KnowledgeNewsItem,
    KnowledgeTopic,
)

BASE_DIR = Path(settings.BASE_DIR)
ASSETS_DIR = BASE_DIR / "assets_irdm_web" / "Tri thức và góc nhìn"


# ─── Asset helpers ────────────────────────────────────────────────────────────

def _load_asset(relative_path: str) -> ContentFile | None:
    """Load a real PNG asset from the assets folder, or return None."""
    full = ASSETS_DIR / relative_path
    if full.exists():
        with open(full, "rb") as f:
            data = f.read()
        return ContentFile(data, name=full.name)
    return None


_PALETTE = [
    ("#1e3a8a", "#1e40af"),
    ("#065f46", "#047857"),
    ("#7c3aed", "#6d28d9"),
    ("#b45309", "#d97706"),
    ("#be185d", "#db2777"),
    ("#0e7490", "#0891b2"),
]


def _gradient_png(color1: str, color2: str, w: int = 800, h: int = 500) -> bytes:
    try:
        from PIL import Image
        img = Image.new("RGB", (w, h))
        r1, g1, b1 = int(color1[1:3], 16), int(color1[3:5], 16), int(color1[5:7], 16)
        r2, g2, b2 = int(color2[1:3], 16), int(color2[3:5], 16), int(color2[5:7], 16)
        px = img.load()
        for x in range(w):
            t = x / w
            for y in range(h):
                px[x, y] = (int(r1 + (r2 - r1) * t), int(g1 + (g2 - g1) * t), int(b1 + (b2 - b1) * t))
        buf = io.BytesIO()
        img.save(buf, format="PNG")
        return buf.getvalue()
    except ImportError:
        return b""


def _placeholder(name: str, idx: int = 0, w: int = 800, h: int = 500) -> ContentFile:
    c1, c2 = _PALETTE[idx % len(_PALETTE)]
    return ContentFile(_gradient_png(c1, c2, w, h), name=name)


# ─── Listing Page ─────────────────────────────────────────────────────────────

LISTING_PAGE = {
    "section_label": "Knowledge Hub",
    "heading": "Tri thức & Góc nhìn ngành",
    "description": (
        "Nơi Viện IRDM chia sẻ nghiên cứu, phân tích bối cảnh, tóm lược chính sách và tài liệu ứng dụng trong y tế, giáo dục, môi trường và phát triển nguồn lực.\n"
        "Các nội dung được biên soạn nhằm hỗ trợ người đọc tiếp cận vấn đề một cách ngắn gọn, có cơ sở và hữu ích cho quá trình ra quyết định, thiết kế chương trình hoặc tìm kiếm cơ hội hợp tác."
    ),
    "hero_cta_primary_label": "Khám phá tri thức →",
    "hero_cta_primary_url": "#featured",
    "hero_cta_secondary_label": "Đăng ký tải tài liệu →",
    "hero_cta_secondary_url": "#downloads",
    "search_enabled": True,
    "filter_section_heading": "Tìm nội dung phù hợp với nhu cầu của bạn",
    "filter_section_description": "Bộ lọc giúp người đọc tìm nhanh nội dung theo mục đích sử dụng, chủ đề quan tâm và nhóm đối tác liên quan.",
    "featured_section_label": "Nội dung nổi bật",
    "featured_section_heading": "Nội dung nổi bật",
    "featured_section_description": (
        "Các bài viết, báo cáo và tài liệu được chọn lọc nhằm giúp người đọc tiếp cận nhanh "
        "những vấn đề chuyên môn có giá trị ứng dụng cao."
    ),

    "cta_sub": "Hợp tác cùng IRDM",
    "cta_heading": "Bắt đầu hành trình chuyển đổi của bạn",
    "cta_primary_label": "Liên hệ ngay",
    "cta_primary_url": "/lien-he/",
    "cta_secondary_label": "Xem giải pháp",
    "cta_secondary_url": "/giai-phap/",
    "meta_title": "Tri thức & Góc nhìn ngành — IRDM",
    "meta_description": "Nghiên cứu, phân tích chính sách và góc nhìn ngành từ IRDM.",
    "is_active": True,
    "display_order": 0,
}

# ─── Topics — matching Figma exactly ─────────────────────────────────────────

TOPICS = [
    {
        "slug": "y-te",
        "label": "Y tế",
        "asset": "Khám phá theo chủ đề/Y tế.png",
        "display_order": 1,
    },
    {
        "slug": "giao-duc",
        "label": "Giáo dục",
        "asset": "Khám phá theo chủ đề/Giáo dục.png",
        "display_order": 2,
    },
    {
        "slug": "moi-truong-phat-trien-ben-vung",
        "label": "Môi trường & phát triển bền vững",
        "asset": "Khám phá theo chủ đề/Môi trường & phát triển bền vững.png",
        "display_order": 3,
    },
    {
        "slug": "ai-du-lieu-chuyen-doi-so",
        "label": "AI, dữ liệu & chuyển đổi số",
        "asset": "Khám phá theo chủ đề/AI, dữ liệu & chuyển đổi số.png",
        "display_order": 4,
    },
    {
        "slug": "suc-khoe-tam-than-wellbeing",
        "label": "Sức khỏe tâm thần & wellbeing",
        "asset": "Khám phá theo chủ đề/Sức khỏe tâm thần & wellbeing.png",
        "display_order": 5,
    },
    {
        "slug": "nguon-nhan-luc",
        "label": "Nguồn nhân lực",
        "asset": "Khám phá theo chủ đề/Nguồn nhân lực.png",
        "display_order": 6,
    },
]

# ─── Categories ───────────────────────────────────────────────────────────────

CATEGORIES = [
    {
        "slug": "cong-bo-nghien-cuu",
        "label": "Công bố nghiên cứu",
        "heading": "Công bố nghiên cứu",
        "description": "Các nghiên cứu ứng dụng và bằng chứng khoa học từ đội ngũ IRDM.",
        "display_order": 1,
    },
    {
        "slug": "goc-nhin-nganh",
        "label": "Góc nhìn ngành",
        "heading": "Góc nhìn ngành",
        "description": "Phân tích, bình luận chuyên môn về xu hướng y tế, giáo dục và phát triển nguồn lực.",
        "display_order": 2,
    },
    {
        "slug": "tom-luoc-chinh-sach",
        "label": "Tóm lược chính sách",
        "heading": "Tóm lược chính sách",
        "description": "Tóm tắt và phân tích các chính sách y tế, giáo dục và phát triển bền vững.",
        "display_order": 3,
    },
    {
        "slug": "tin-irdm",
        "label": "Tin IRDM",
        "heading": "Tin tức IRDM",
        "description": "Hoạt động, hợp tác và sự kiện từ Viện IRDM.",
        "display_order": 4,
    },
]

# ─── Articles — Figma content ─────────────────────────────────────────────────

ARTICLES = [
    # Nội dung nổi bật (featured) - dùng ảnh thật từ assets
    {
        "slug": "vi-sao-du-lieu-benh-vien-chua-de-chuyen-thanh-khcn",
        "title": "Vì sao dữ liệu bệnh viện chưa dễ chuyển thành nhiệm vụ KH,CN&ĐMST?",
        "category_slug": "cong-bo-nghien-cuu",
        "topic_slugs": ["y-te", "ai-du-lieu-chuyen-doi-so"],
        "summary": "Phân tích rào cản chuyển đổi dữ liệu bệnh viện thành nhiệm vụ khoa học, công nghệ và đổi mới sáng tạo trong bối cảnh y tế số.",
        "body": "Dữ liệu bệnh viện ngày càng phong phú nhưng khoảng cách giữa dữ liệu thô và ứng dụng thực tiễn vẫn còn rất lớn...",
        "author_name": "TS. Nguyễn Minh Tuấn",
        "published_date": date(2024, 5, 10),
        "read_time": 8,
        "is_featured": True,
        "asset": "Nội dung nổi bật/Vì sao dữ liệu bệnh viện chưa dễ chuyển thành nhiệm vụ KH,CN&ĐMST_.png",
        "display_order": 1,
    },
    {
        "slug": "suc-khoe-tam-than-nhan-vien-y-te-chiu-dung-khong-ben-vung",
        "title": "Sức khỏe tâm thần nhân viên y tế: khi \"chịu đựng tốt\" không còn là chiến lược bền vững",
        "category_slug": "goc-nhin-nganh",
        "topic_slugs": ["y-te", "suc-khoe-tam-than-wellbeing"],
        "summary": "Nghiên cứu về tình trạng kiệt sức và sức khỏe tâm thần của nhân viên y tế sau đại dịch — và tại sao cần thay đổi tư duy quản lý.",
        "body": "Sau nhiều năm làm việc trong môi trường áp lực cao, nhân viên y tế đang đối mặt với khủng hoảng sức khỏe tâm thần nghiêm trọng...",
        "author_name": "PGS.TS. Đinh Thị Lan",
        "published_date": date(2024, 4, 22),
        "read_time": 10,
        "is_featured": True,
        "asset": "Nội dung nổi bật/Sức khỏe tâm thần nhân viên y tế_ khi \"chịu đựng tốt\" không còn là chiến lược bền vững.png",
        "display_order": 2,
    },
    {
        "slug": "green-university-green-hospital-quan-tri-ben-vung",
        "title": "Green University và Green Hospital: từ định hướng xanh đến mô hình quản trị bền vững",
        "category_slug": "goc-nhin-nganh",
        "topic_slugs": ["moi-truong-phat-trien-ben-vung", "giao-duc"],
        "summary": "Khung tư duy và lộ trình thực tiễn để các trường đại học và bệnh viện chuyển đổi sang mô hình quản trị xanh và bền vững.",
        "body": "Phong trào Green University và Green Hospital không chỉ là xu hướng mà là tất yếu trong bối cảnh biến đổi khí hậu...",
        "author_name": "ThS. Trần Thị Hoa",
        "published_date": date(2024, 6, 1),
        "read_time": 12,
        "is_featured": True,
        "asset": "Nội dung nổi bật/Green University và Green Hospital_ từ định hướng xanh đến mô hình quản trị bền vững.png",
        "display_order": 3,
    },
    {
        "slug": "cac-su-kien-chuyen-mon-sap-dien-ra-irdm",
        "title": "Các sự kiện chuyên môn sắp diễn ra tại Viện IRDM",
        "category_slug": "tin-irdm",
        "topic_slugs": ["y-te", "giao-duc"],
        "summary": "Tổng hợp các hội thảo, tọa đàm và chương trình đào tạo sắp diễn ra tại Viện IRDM trong quý III/2024.",
        "body": "Viện IRDM sẽ tổ chức loạt sự kiện chuyên môn nhằm kết nối các chuyên gia trong lĩnh vực y tế và giáo dục...",
        "author_name": "Ban Truyền thông IRDM",
        "published_date": date(2024, 7, 1),
        "read_time": 5,
        "is_featured": True,
        "asset": "Nội dung nổi bật/Các sự kiện chuyên môn sắp diễn ra tại Viện IRDM.png",
        "display_order": 4,
    },
    # Thêm articles cho các categories
    {
        "slug": "cai-cach-he-thong-bao-hiem-y-te-bai-hoc-quoc-te",
        "title": "Cải cách hệ thống bảo hiểm y tế: Bài học từ các mô hình quốc tế",
        "category_slug": "tom-luoc-chinh-sach",
        "topic_slugs": ["y-te"],
        "summary": "Phân tích so sánh mô hình bảo hiểm y tế của Hàn Quốc, Đài Loan và Singapore, rút ra bài học cho Việt Nam.",
        "body": "Hệ thống bảo hiểm y tế toàn dân là nền tảng của hệ thống y tế hiện đại...",
        "author_name": "TS. Phạm Đức Mạnh",
        "published_date": date(2024, 4, 5),
        "read_time": 15,
        "is_featured": False,
        "asset": None,
        "display_order": 1,
    },
    {
        "slug": "thiet-ke-chuong-trinh-dao-tao-nang-luc-lanh-dao-y-te",
        "title": "Thiết kế chương trình đào tạo năng lực lãnh đạo y tế theo chuẩn năng lực",
        "category_slug": "cong-bo-nghien-cuu",
        "topic_slugs": ["giao-duc", "y-te"],
        "summary": "Quy trình 6 bước thiết kế chương trình đào tạo dựa trên khung năng lực lãnh đạo y tế quốc tế.",
        "body": "Năng lực lãnh đạo là yếu tố quyết định thành công của hệ thống y tế...",
        "author_name": "TS. Bùi Thị Mai",
        "published_date": date(2024, 3, 15),
        "read_time": 14,
        "is_featured": False,
        "asset": None,
        "display_order": 2,
    },
    {
        "slug": "ai-trong-chan-doan-hinh-anh-y-te",
        "title": "AI trong chẩn đoán hình ảnh y tế: Tiềm năng và thách thức triển khai",
        "category_slug": "goc-nhin-nganh",
        "topic_slugs": ["ai-du-lieu-chuyen-doi-so", "y-te"],
        "summary": "Đánh giá các mô hình AI hiện tại trong chẩn đoán X-quang, MRI và siêu âm, cùng rào cản triển khai thực tế.",
        "body": "Trí tuệ nhân tạo đang cách mạng hóa chẩn đoán hình ảnh y tế trên toàn cầu...",
        "author_name": "ThS. Nguyễn Văn Hiếu",
        "published_date": date(2024, 6, 20),
        "read_time": 12,
        "is_featured": False,
        "asset": None,
        "display_order": 2,
    },
    {
        "slug": "nhan-luc-y-te-tuong-lai-ky-nang-can-thiet",
        "title": "Nhân lực y tế tương lai: Kỹ năng cần thiết trong thời đại chuyển đổi số",
        "category_slug": "tom-luoc-chinh-sach",
        "topic_slugs": ["nguon-nhan-luc", "giao-duc"],
        "summary": "Phác thảo bộ năng lực cần thiết cho nhân viên y tế trong thập kỷ tới, theo góc nhìn chính sách và thực tiễn.",
        "body": "Cuộc cách mạng công nghiệp lần thứ tư đang đặt ra những yêu cầu mới cho lực lượng lao động y tế...",
        "author_name": "TS. Lê Văn Khoa",
        "published_date": date(2024, 5, 18),
        "read_time": 11,
        "is_featured": False,
        "asset": None,
        "display_order": 2,
    },
]

# ─── Featured Pins — CMS-configurable badges & CTAs (theo Figma) ─────────────

FEATURED_PINS = [
    {
        "article_slug": "vi-sao-du-lieu-benh-vien-chua-de-chuyen-thanh-khcn",
        "badge_text": "Góc nhìn ngành",
        "cta_text": "Đọc bài viết",
        "cta_icon": "arrow-right",
        "cta_url": "",
        "display_order": 1,
    },
    {
        "article_slug": "suc-khoe-tam-than-nhan-vien-y-te-chiu-dung-khong-ben-vung",
        "badge_text": "Tóm lược chính sách",
        "cta_text": "Đọc bài viết",
        "cta_icon": "arrow-right",
        "cta_url": "",
        "display_order": 2,
    },
    {
        "article_slug": "green-university-green-hospital-quan-tri-ben-vung",
        "badge_text": "Báo cáo & Tài liệu",
        "cta_text": "Đăng ký tải tài liệu",
        "cta_icon": "download",
        "cta_url": "#downloads",
        "display_order": 3,
    },
    {
        "article_slug": "cac-su-kien-chuyen-mon-sap-dien-ra-irdm",
        "badge_text": "Sự kiện",
        "cta_text": "Xem sự kiện",
        "cta_icon": "arrow-right",
        "cta_url": "/su-kien/",
        "display_order": 4,
    },
]

# ─── Downloads ────────────────────────────────────────────────────────────────

DOWNLOADS = [
    {
        "slug": "bao-cao-thuong-nien-irdm-2024",
        "title": "Báo cáo thường niên IRDM 2024",
        "summary": "Tổng kết hoạt động nghiên cứu, hợp tác và tác động của Viện IRDM trong năm 2024.",
        "file_type_label": "PDF",
        "file_size_label": "4.2 MB",
        "category_slug": "tin-irdm",
        "published_date": date(2024, 1, 15),
        "display_order": 1,
    },
    {
        "slug": "khung-nang-luc-quan-ly-y-te",
        "title": "Khung năng lực quản lý y tế",
        "summary": "Bộ khung năng lực chuẩn dành cho lãnh đạo cấp trung và cấp cao trong lĩnh vực y tế.",
        "file_type_label": "PDF",
        "file_size_label": "1.8 MB",
        "category_slug": "cong-bo-nghien-cuu",
        "published_date": date(2024, 2, 20),
        "display_order": 2,
    },
    {
        "slug": "huong-dan-trien-khai-esg-doanh-nghiep",
        "title": "Hướng dẫn triển khai ESG cho doanh nghiệp",
        "summary": "Tài liệu thực hành với bộ chỉ số và mẫu báo cáo ESG cho tổ chức y tế và doanh nghiệp.",
        "file_type_label": "PDF",
        "file_size_label": "2.5 MB",
        "category_slug": "tom-luoc-chinh-sach",
        "published_date": date(2024, 3, 10),
        "display_order": 3,
    },
    {
        "slug": "bo-cong-cu-danh-gia-wellbeing",
        "title": "Bộ công cụ đánh giá wellbeing",
        "summary": "Thang đo và phương pháp đánh giá toàn diện sức khỏe tâm thần, thể chất và nghề nghiệp.",
        "file_type_label": "XLSX",
        "file_size_label": "0.9 MB",
        "category_slug": "cong-bo-nghien-cuu",
        "published_date": date(2024, 4, 5),
        "display_order": 4,
    },
]

# ─── News Items — dùng ảnh thật từ assets ────────────────────────────────────

NEWS_ITEMS = [
    {
        "slug": "irdm-cung-cap-dich-vu-thu-ky-khoa-hoc-nguyen-tri-phuong",
        "title": "IRDM cung cấp dịch vụ thư ký khoa học cho Bệnh viện Nguyễn Tri Phương",
        "summary": "Viện IRDM ký kết hợp đồng cung cấp dịch vụ thư ký khoa học, hỗ trợ nghiên cứu và quản lý tri thức tại Bệnh viện Nguyễn Tri Phương.",
        "published_date": date(2024, 6, 15),
        "source_url": "",
        "category_slug": "tin-irdm",
        "topic_slugs": ["y-te"],
        "asset": "Tin tức & Sự kiện/IRDM cung cấp dịch vụ thư ký khoa học cho Bệnh viện Nguyễn Tri Phương.png",
        "display_order": 1,
    },
    {
        "slug": "irdm-hoan-thanh-bao-cao-nhu-cau-nhan-luc-y-te-tphcm",
        "title": "IRDM hoàn thành báo cáo đánh giá nhu cầu năng lực nhân lực y tế TP.HCM",
        "summary": "Báo cáo đánh giá toàn diện về nhu cầu đào tạo và phát triển năng lực nhân lực y tế tại TP.HCM giai đoạn 2024-2030.",
        "published_date": date(2024, 5, 28),
        "source_url": "",
        "category_slug": "tin-irdm",
        "topic_slugs": ["nguon-nhan-luc", "y-te"],
        "asset": "Tin tức & Sự kiện/IRDM hoàn thành báo cáo đánh giá nhu cầu năng lực nhân lực y tế TP.HCM.png",
        "display_order": 2,
    },
    {
        "slug": "irdm-ky-ket-hop-tac-dai-hoc-y-duoc-tphcm",
        "title": "IRDM ký kết hợp tác với Đại học Y Dược TP.HCM trong nghiên cứu ứng dụng",
        "summary": "Lễ ký kết biên bản ghi nhớ hợp tác nghiên cứu ứng dụng giữa Viện IRDM và Đại học Y Dược TP.HCM.",
        "published_date": date(2024, 5, 10),
        "source_url": "",
        "category_slug": "tin-irdm",
        "topic_slugs": ["giao-duc", "y-te"],
        "asset": "Tin tức & Sự kiện/IRDM ký kết hợp tác với Đại học Y Dược TP.HCM trong nghiên cứu ứng dụng.png",
        "display_order": 3,
    },
    {
        "slug": "tom-luoc-hoi-thao-wellbeing-y-te-giao-duc-2024",
        "title": "Tóm lược Hội thảo Wellbeing trong y tế và giáo dục 2024",
        "summary": "Những điểm nhấn từ hội thảo quốc gia về wellbeing nhân viên y tế và giáo dục, tổ chức tháng 4/2024.",
        "published_date": date(2024, 4, 20),
        "source_url": "",
        "category_slug": "tin-irdm",
        "topic_slugs": ["suc-khoe-tam-than-wellbeing"],
        "asset": "Tin tức & Sự kiện/Tóm lược Hội thảo Wellbeing trong y tế và giáo dục 2024.png",
        "display_order": 4,
    },
    # Press items
    {
        "slug": "chuyen-gia-irdm-wellbeing-dau-tu-nang-luc-phuc-hoi",
        "title": "Chuyên gia IRDM: 'Wellbeing không phải là phúc lợi, mà là đầu tư cho năng lực phục hồi'",
        "summary": "Phỏng vấn chuyên gia IRDM về tầm quan trọng của wellbeing trong tổ chức y tế và giáo dục.",
        "published_date": date(2024, 6, 5),
        "source_url": "",
        "category_slug": "goc-nhin-nganh",
        "topic_slugs": ["suc-khoe-tam-than-wellbeing"],
        "asset": "IRDM trên báo chí và diễn đàn chuyên môn/Chuyên gia IRDM_ 'Wellbeing không phải là phúc lợi, mà là đầu tư cho năng lực phục hồi'.png",
        "display_order": 5,
    },
    {
        "slug": "du-lieu-benh-vien-bai-toan-chuyen-doi-so-nghien-cuu-ung-dung",
        "title": "Dữ liệu bệnh viện và bài toán chuyển đổi số: góc nhìn từ nghiên cứu ứng dụng",
        "summary": "Bài viết trên diễn đàn chuyên môn về hành trình chuyển đổi số dữ liệu bệnh viện từ góc nhìn nghiên cứu ứng dụng.",
        "published_date": date(2024, 5, 25),
        "source_url": "",
        "category_slug": "cong-bo-nghien-cuu",
        "topic_slugs": ["ai-du-lieu-chuyen-doi-so", "y-te"],
        "asset": "IRDM trên báo chí và diễn đàn chuyên môn/Dữ liệu bệnh viện và bài toán chuyển đổi số_ góc nhìn từ nghiên cứu ứng dụng.png",
        "display_order": 6,
    },
    {
        "slug": "irdm-tham-luan-hoi-nghi-quoc-gia-doi-moi-sang-tao-2024",
        "title": "IRDM tham luận tại Hội nghị Quốc gia về đổi mới sáng tạo trong y tế và giáo dục 2024",
        "summary": "Đại diện Viện IRDM trình bày tham luận về ứng dụng nghiên cứu và đổi mới sáng tạo trong phát triển hệ thống y tế.",
        "published_date": date(2024, 5, 12),
        "source_url": "",
        "category_slug": "tin-irdm",
        "topic_slugs": ["y-te", "giao-duc"],
        "asset": "IRDM trên báo chí và diễn đàn chuyên môn/IRDM tham luận tại Hội nghị Quốc gia về đổi mới sáng tạo trong y tế và giáo dục 2024.png",
        "display_order": 7,
    },
    {
        "slug": "bao-cao-moi-esg-viet-nam-2024",
        "title": "Báo cáo mới về xu hướng ESG tại Việt Nam 2024",
        "summary": "Tổng quan các xu hướng ESG đang định hình hoạt động của tổ chức y tế và doanh nghiệp tại Việt Nam.",
        "published_date": date(2024, 4, 30),
        "source_url": "",
        "category_slug": "tom-luoc-chinh-sach",
        "topic_slugs": ["moi-truong-phat-trien-ben-vung"],
        "asset": None,
        "display_order": 8,
    },
]


class Command(BaseCommand):
    help = "Seed the Knowledge module with Figma-matching demonstration data."

    def handle(self, *args, **kwargs):
        self.stdout.write("Seeding Knowledge module...")

        # ── Topics ────────────────────────────────────────────────────────────
        topic_map: dict[str, KnowledgeTopic] = {}
        for i, t in enumerate(TOPICS):
            obj, created = KnowledgeTopic.objects.update_or_create(
                slug=t["slug"],
                defaults={
                    "label": t["label"],
                    "is_published": True,
                    "is_active": True,
                    "display_order": t["display_order"],
                },
            )
            if created or not obj.cover_image:
                asset = _load_asset(t["asset"]) if t.get("asset") else None
                img = asset or _placeholder(f"{obj.slug}.png", i, 400, 300)
                obj.cover_image.save(f"knowledge/topics/{obj.slug}.png", img, save=True)
            topic_map[t["slug"]] = obj
            if created:
                self.stdout.write(f"  Topic: {obj.label}")

        # ── Categories ────────────────────────────────────────────────────────
        cat_map: dict[str, KnowledgeCategory] = {}
        for i, c in enumerate(CATEGORIES):
            obj, created = KnowledgeCategory.objects.update_or_create(
                slug=c["slug"],
                defaults={
                    "label": c["label"],
                    "heading": c.get("heading", ""),
                    "description": c.get("description", ""),
                    "is_published": True,
                    "is_active": True,
                    "display_order": c["display_order"],
                },
            )
            if created and not obj.cover_image:
                obj.cover_image.save(
                    f"knowledge/categories/{obj.slug}.png",
                    _placeholder(f"{obj.slug}.png", i),
                    save=True,
                )
            cat_map[c["slug"]] = obj
            if created:
                self.stdout.write(f"  Category: {obj.label}")

        # ── Articles ──────────────────────────────────────────────────────────
        article_map: dict[str, KnowledgeArticle] = {}
        for i, a in enumerate(ARTICLES):
            category = cat_map.get(a["category_slug"])
            obj, created = KnowledgeArticle.objects.update_or_create(
                slug=a["slug"],
                defaults={
                    "title": a["title"],
                    "category": category,
                    "summary": a.get("summary", ""),
                    "body": a.get("body", ""),
                    "author_name": a.get("author_name", ""),
                    "published_date": a.get("published_date"),
                    "read_time": a.get("read_time", 5),
                    "is_featured": a.get("is_featured", False),
                    "is_published": True,
                    "is_active": True,
                    "display_order": a.get("display_order", i),
                },
            )
            obj.topics.set([topic_map[s] for s in a.get("topic_slugs", []) if s in topic_map])
            if created or not obj.thumbnail:
                asset = _load_asset(a["asset"]) if a.get("asset") else None
                img = asset or _placeholder(f"{obj.slug}.png", i, 600, 400)
                obj.thumbnail.save(f"knowledge/articles/thumbnails/{obj.slug}.png", img, save=True)
            article_map[a["slug"]] = obj
            if created:
                self.stdout.write(f"  Article: {obj.title[:60]}")

        # ── Listing page ──────────────────────────────────────────────────────
        non_status = {k: v for k, v in LISTING_PAGE.items() if k not in ("is_active", "display_order")}
        listing_page, lp_created = KnowledgeListingPage.objects.update_or_create(
            display_order=0,
            defaults=non_status,
        )
        if lp_created or not listing_page.hero_image:
            asset = _load_asset("HeroSection.png")
            img = asset or _placeholder("hero.png", 0, 1200, 800)
            listing_page.hero_image.save("knowledge/listing/hero.png", img, save=True)
        if lp_created or not listing_page.cta_background_image:
            asset = _load_asset("Tài liệu tải về BG.png")
            img = asset or _placeholder("cta.png", 1, 1600, 600)
            listing_page.cta_background_image.save("knowledge/cta/cta.png", img, save=True)
        if lp_created:
            self.stdout.write("  Listing page created.")

        # ── Featured pins — badge, CTA text, CTA icon, CTA URL ──────────────
        for pin_data in FEATURED_PINS:
            article = article_map.get(pin_data["article_slug"])
            if article:
                pin, _ = KnowledgeFeaturedArticle.objects.update_or_create(
                    listing_page=listing_page,
                    article=article,
                    defaults={
                        "badge_text": pin_data.get("badge_text", ""),
                        "cta_text": pin_data.get("cta_text", ""),
                        "cta_icon": pin_data.get("cta_icon", "arrow-right"),
                        "cta_url": pin_data.get("cta_url", ""),
                        "display_order": pin_data.get("display_order", 1),
                        "is_active": True,
                    },
                )

        # ── Downloads ─────────────────────────────────────────────────────────
        for i, d in enumerate(DOWNLOADS):
            category = cat_map.get(d.get("category_slug", ""))
            obj, created = KnowledgeDownload.objects.update_or_create(
                slug=d["slug"],
                defaults={
                    "title": d["title"],
                    "summary": d.get("summary", ""),
                    "file_type_label": d.get("file_type_label", "PDF"),
                    "file_size_label": d.get("file_size_label", ""),
                    "category": category,
                    "published_date": d.get("published_date"),
                    "is_published": True,
                    "is_active": True,
                    "display_order": d.get("display_order", i),
                },
            )
            if created or not obj.cover_image:
                asset = _load_asset("Tài liệu tải về BG.png")
                img = asset or _placeholder(f"{obj.slug}.png", i, 400, 300)
                obj.cover_image.save(f"knowledge/downloads/{obj.slug}.png", img, save=True)
            if created:
                self.stdout.write(f"  Download: {obj.title}")

        # ── News items ────────────────────────────────────────────────────────
        for i, n in enumerate(NEWS_ITEMS):
            category = cat_map.get(n.get("category_slug", ""))
            obj, created = KnowledgeNewsItem.objects.update_or_create(
                slug=n["slug"],
                defaults={
                    "title": n["title"],
                    "summary": n.get("summary", ""),
                    "published_date": n.get("published_date"),
                    "source_url": n.get("source_url", ""),
                    "category": category,
                    "is_published": True,
                    "is_active": True,
                    "display_order": n.get("display_order", i),
                },
            )
            obj.topics.set([topic_map[s] for s in n.get("topic_slugs", []) if s in topic_map])
            if created or not obj.thumbnail:
                asset = _load_asset(n["asset"]) if n.get("asset") else None
                img = asset or _placeholder(f"{obj.slug}.png", i, 600, 400)
                obj.thumbnail.save(f"knowledge/news/{obj.slug}.png", img, save=True)
            if created:
                self.stdout.write(f"  News: {obj.title[:60]}")

        # ── Filter Groups ───────────────────────────────────────────────────────────
        self._seed_filter_groups()

        self.stdout.write(self.style.SUCCESS("Knowledge module seeded successfully."))

    def _seed_filter_groups(self) -> None:
        """Seed the 3 Figma filter groups and their items."""
        FILTER_GROUPS = [
            {
                "title": "THEO LOẠI NỘI DUNG",
                "param_key": "ctype",
                "display_order": 1,
                "items": [
                    ("Công bố nghiên cứu",       "cong-bo-nghien-cuu",        1),
                    ("Góc nhìn ngành",              "goc-nhin-nganh",            2),
                    ("Tóm lược chính sách",         "tom-luoc-chinh-sach",       3),
                    ("Báo cáo & tài liệu",          "bao-cao-tai-lieu",          4),
                    ("Tin IRDM",                     "tin-irdm",                 5),
                    ("Sự kiện",                     "su-kien",                   6),
                ],
            },
            {
                "title": "THEO CHỦ ĐỀ",
                "param_key": "topic",
                "display_order": 2,
                "items": [
                    ("Y tế",                                    "y-te",                          1),
                    ("Giáo dục",                              "giao-duc",                      2),
                    ("Môi trường & phát triển bền vững",  "moi-truong-phat-trien-ben-vung", 3),
                    ("AI, dữ liệu & chuyển đổi số",       "ai-du-lieu-chuyen-doi-so",      4),
                    ("Sức khỏe tâm thần & wellbeing",    "suc-khoe-tam-than-wellbeing",   5),
                    ("Nguồn nhân lực",                     "nguon-nhan-luc",                6),
                ],
            },
            {
                "title": "THEO NHÓM ĐỐI TÁC",
                "param_key": "partner",
                "display_order": 3,
                "items": [
                    ("Cơ quan quản lý",   "co-quan-quan-ly",  1),
                    ("Hệ thống y tế",     "he-thong-y-te",    2),
                    ("Trường đại học",    "truong-dai-hoc",   3),
                    ("Doanh nghiệp",       "doanh-nghiep",    4),
                    ("Tổ chức quốc tế",  "to-chuc-quoc-te", 5),
                ],
            },
        ]
        for gdata in FILTER_GROUPS:
            group, created = KnowledgeFilterGroup.objects.update_or_create(
                param_key=gdata["param_key"],
                defaults={
                    "title": gdata["title"],
                    "display_order": gdata["display_order"],
                    "is_active": True,
                },
            )
            for label, value, order in gdata["items"]:
                KnowledgeFilterItem.objects.update_or_create(
                    group=group,
                    value=value,
                    defaults={
                        "label": label,
                        "display_order": order,
                        "is_active": True,
                    },
                )
            status = "created" if created else "updated"
            self.stdout.write(f"  Filter group [{status}]: {group.title}")
