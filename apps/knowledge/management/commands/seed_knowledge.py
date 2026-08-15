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
from django.utils.text import slugify

from apps.knowledge.models import (
    KnowledgeAccordionItem,
    KnowledgeActivityNews,
    KnowledgeArticle,
    KnowledgeCategory,
    KnowledgeContentTypeCard,
    KnowledgeCTAButton,
    KnowledgeDownload,
    KnowledgeEvent,
    KnowledgeEventTag,
    KnowledgeFeaturedArticle,
    KnowledgeFilterGroup,
    KnowledgeFilterItem,
    KnowledgeListingPage,
    KnowledgeNewsItem,
    KnowledgeTopic,
    KnowledgeTopicCard,
    KnowledgeTopicCardTag,
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
    "hero_cta_primary_url": "#kham-pha-loai-noi-dung",
    "hero_cta_secondary_label": "Đăng ký tải tài liệu →",
    "hero_cta_secondary_url": "#tai-lieu-tai-ve",
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
    # ── Publication Section ────────────────────────────────────────────────
    "pub_section_label": "Ấn phẩm & Báo cáo",
    "pub_section_heading": "Tài liệu tải về",
    "pub_section_description": (
        "Các tài liệu được chọn lọc nhằm hỗ trợ người đọc ứng dụng tri thức vào quá trình "
        "ra quyết định, thiết kế chương trình hoặc trao đổi hợp tác."
    ),
    # ── Publication Form ───────────────────────────────────────────────────
    "pub_form_title": "Gửi yêu cầu nhận tài liệu",
    "pub_form_description": (
        "Vui lòng để lại thông tin cơ bản và ghi chú tài liệu bạn quan tâm. "
        "Viện IRDM sẽ ghi nhận yêu cầu và gửi tài liệu phù hợp tới email bạn cung cấp."
    ),
    "pub_form_name_label": "Họ và tên",
    "pub_form_name_placeholder": "Nhập họ và tên của bạn",
    "pub_form_org_label": "Đơn vị công tác",
    "pub_form_org_placeholder": "Tên cơ quan, tổ chức, trường, bệnh viện hoặc doanh nghiệp",
    "pub_form_email_label": "Email",
    "pub_form_email_placeholder": "Nhập email nhận tài liệu",
    "pub_form_note_label": "Ghi chú",
    "pub_form_note_placeholder": (
        "Bạn có thể ghi loại tài liệu muốn nhận, lĩnh vực quan tâm hoặc lời nhắn cho Viện IRDM"
    ),
    "pub_form_privacy_note": (
        "Viện IRDM sử dụng thông tin này để phản hồi yêu cầu tài liệu và hỗ trợ "
        "trao đổi chuyên môn khi phù hợp."
    ),
    "pub_form_button_text": "Gửi yêu cầu",
    "pub_form_button_icon": "send",
    "pub_form_success_message": (
        "Cảm ơn bạn! Viện IRDM đã nhận được yêu cầu và sẽ gửi tài liệu phù hợp đến email của bạn."
    ),
    # ── Publication Contact Block ──────────────────────────────────────────
    "pub_contact_title": "Liên hệ trao đổi với Viện IRDM",
    "pub_contact_description": (
        "Bạn cần thêm thông tin hoặc chưa rõ tài liệu nào phù hợp? Liên hệ với Viện IRDM "
        "để được hỗ trợ và gợi ý tài liệu theo nhu cầu."
    ),
    "pub_contact_email": "vienncptnlv@irdm.edu.vn",
    "pub_contact_phone": "(+84) 33 656 7701",
    "pub_contact_address": "8C Trần Huy Liệu, Phường Phú Nhuận, TP.HCM",
    "pub_contact_cta_text": "Liên hệ hợp tác",
    "pub_contact_cta_icon": "arrow-right",
    "pub_contact_cta_url": "/lien-he/",
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
        "cta_url": "#tai-lieu-tai-ve",
        "display_order": 3,
    },
    {
        "article_slug": "cac-su-kien-chuyen-mon-sap-dien-ra-irdm",
        "badge_text": "Sự kiện",
        "cta_text": "Xem sự kiện",
        "cta_icon": "arrow-right",
        "cta_url": "",
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

# ─── Content Type Cards — matching Figma "Khám phá theo Loại Nội Dung" ────────

CONTENT_TYPE_CARDS = [
    {
        "title": "Công bố nghiên cứu",
        "category_slug": "cong-bo-nghien-cuu",
        "summary": (
            "Các công bố và kết quả nghiên cứu của Viện IRDM, được trình "
            "bày theo hướng dễ tiếp cận hơn cho người đọc ngoài chuyên ngành hẹp."
        ),
        "tag_slugs": ["y-te", "giao-duc", "moi-truong-phat-trien-ben-vung", "ai-du-lieu-chuyen-doi-so"],
        "cta_text": "Xem nội dung liên quan",
        "cta_icon": "arrow-right",
        "cta_url": "?ctype=cong-bo-nghien-cuu",
        "display_order": 1,
    },
    {
        "title": "Góc nhìn ngành",
        "category_slug": "goc-nhin-nganh",
        "summary": (
            "Các bài viết phân tích những vấn đề đang nổi bật trong y tế, "
            "giáo dục, môi trường, dữ liệu, AI, wellbeing và phát triển nguồn lực."
        ),
        "tag_slugs": ["y-te", "giao-duc", "ai-du-lieu-chuyen-doi-so", "suc-khoe-tam-than-wellbeing"],
        "cta_text": "Xem nội dung liên quan",
        "cta_icon": "arrow-right",
        "cta_url": "?ctype=goc-nhin-nganh",
        "display_order": 2,
    },
    {
        "title": "Tóm lược chính sách",
        "category_slug": "tom-luoc-chinh-sach",
        "summary": (
            "Các tóm lược ngắn, cô đọng, giúp chuyển hóa bằng chứng, dữ liệu "
            "và kinh nghiệm triển khai thành hàm ý cho quản lý, chính sách hoặc "
            "chương trình hành động."
        ),
        "tag_slugs": ["co-quan-quan-ly", "y-te", "giao-duc", "moi-truong-phat-trien-ben-vung"],
        "cta_text": "Xem nội dung liên quan",
        "cta_icon": "arrow-right",
        "cta_url": "?ctype=tom-luoc-chinh-sach",
        "display_order": 3,
    },
    {
        "title": "Báo cáo & tài liệu",
        "category_slug": "cong-bo-nghien-cuu",
        "summary": (
            "Các tài liệu ứng dụng giúp người đọc tìm hiểu vấn đề, tham khảo "
            "khung tiếp cận, chuẩn bị hợp tác hoặc lựa chọn hướng triển khai phù hợp."
        ),
        "tag_slugs": ["y-te", "giao-duc", "moi-truong-phat-trien-ben-vung", "nguon-nhan-luc"],
        "cta_text": "Xem nội dung liên quan",
        "cta_icon": "arrow-right",
        "cta_url": "?ctype=bao-cao-tai-lieu",
        "display_order": 4,
    },
    {
        "title": "Tin IRDM",
        "category_slug": "tin-irdm",
        "summary": (
            "Cập nhật các hoạt động nghiên cứu, hợp tác, tập huấn, hội thảo "
            "và những dấu mốc chuyên môn của Viện IRDM."
        ),
        "tag_slugs": ["y-te", "giao-duc", "moi-truong-phat-trien-ben-vung", "ai-du-lieu-chuyen-doi-so"],
        "cta_text": "Xem nội dung liên quan",
        "cta_icon": "arrow-right",
        "cta_url": "?ctype=tin-irdm",
        "display_order": 5,
    },
    {
        "title": "Sự kiện",
        "category_slug": "tin-irdm",
        "summary": (
            "Thông tin về các hội thảo, tọa đàm, workshop, lớp tập huấn và "
            "diễn đàn chuyên môn do Viện IRDM tổ chức hoặc tham gia."
        ),
        "tag_slugs": ["y-te", "giao-duc", "suc-khoe-tam-than-wellbeing", "ai-du-lieu-chuyen-doi-so"],
        "cta_text": "Xem nội dung liên quan",
        "cta_icon": "arrow-right",
        "cta_url": "/tri-thuc-goc-nhin/#tin-tuc-su-kien",
        "display_order": 6,
    },
]

# ─── Topic Card Tags ───────────────────────────────────────────────────────────

TOPIC_CARD_TAGS = [
    {"slug": "tc-ai-du-lieu",          "label": "AI, dữ liệu & chuyển đổi số",       "color": "#3b82f6",  "display_order": 1},
    {"slug": "tc-suc-khoe-tam-than",   "label": "Sức khỏe tâm thần & wellbeing",    "color": "#8b5cf6",  "display_order": 2},
    {"slug": "tc-he-thong-y-te",       "label": "Hệ thống y tế",                    "color": "#06b6d4",  "display_order": 3},
    {"slug": "tc-co-quan-quan-ly",     "label": "Cơ quan quản lý",                  "color": "#f97316",  "display_order": 4},
    {"slug": "tc-truong-dai-hoc",      "label": "Trường đại học",                   "color": "#10b981",  "display_order": 5},
    {"slug": "tc-to-chuc-quoc-te",     "label": "Tổ chức quốc tế",                  "color": "#6366f1",  "display_order": 6},
    {"slug": "tc-doanh-nghiep",        "label": "Doanh nghiệp",                     "color": "#f59e0b",  "display_order": 7},
    {"slug": "tc-nguon-nhan-luc",      "label": "Nguồn nhân lực",                   "color": "#84cc16",  "display_order": 8},
    {"slug": "tc-y-te",                "label": "Y tế",                            "color": "#ef4444",  "display_order": 9},
    {"slug": "tc-giao-duc",            "label": "Giáo dục",                         "color": "#22d3ee",  "display_order": 10},
]

# ─── Topic Cards — matching Figma "Khám phá theo Chủ Đề" ─────────────────────────

TOPIC_CARDS = [
    {
        "title": "Y tế",
        "topic_slug": "y-te",
        "icon": "heart",
        "description": (
            "Dữ liệu y tế, quản trị bệnh viện, chuyển đổi số, "
            "sức khỏe nhân viên y tế và cải tiến hệ thống."
        ),
        "tag_slugs": ["tc-ai-du-lieu", "tc-suc-khoe-tam-than", "tc-he-thong-y-te", "tc-co-quan-quan-ly"],
        "cta_text": "Xem nội dung liên quan",
        "cta_icon": "arrow-right",
        "cta_url": "?topic=y-te",
        "display_order": 1,
    },
    {
        "title": "Giáo dục",
        "topic_slug": "giao-duc",
        "icon": "academic-cap",
        "description": (
            "Môi trường học thuật, phát triển người học, năng lực nghề nghiệp, "
            "E-Learning, đổi mới đào tạo, sức khỏe tâm thần sinh viên và phát triển đội ngũ."
        ),
        "tag_slugs": ["tc-suc-khoe-tam-than", "tc-nguon-nhan-luc", "tc-truong-dai-hoc", "tc-to-chuc-quoc-te"],
        "cta_text": "Xem nội dung liên quan",
        "cta_icon": "arrow-right",
        "cta_url": "?topic=giao-duc",
        "display_order": 2,
    },
    {
        "title": "Môi trường & phát triển bền vững",
        "topic_slug": "moi-truong-phat-trien-ben-vung",
        "icon": "globe-alt",
        "description": (
            "ESG, Green University, Green Hospital, sức khỏe môi trường "
            "và mô hình phục hồi."
        ),
        "tag_slugs": ["tc-y-te", "tc-giao-duc", "tc-he-thong-y-te", "tc-truong-dai-hoc"],
        "cta_text": "Xem nội dung liên quan",
        "cta_icon": "arrow-right",
        "cta_url": "?topic=moi-truong-phat-trien-ben-vung",
        "display_order": 3,
    },
    {
        "title": "AI, dữ liệu & chuyển đổi số",
        "topic_slug": "ai-du-lieu-chuyen-doi-so",
        "icon": "cpu-chip",
        "description": (
            "Use case, dashboard, nền tảng dữ liệu, hỗ trợ ra quyết định "
            "và lộ trình thí điểm công nghệ."
        ),
        "tag_slugs": ["tc-y-te", "tc-giao-duc", "tc-he-thong-y-te", "tc-co-quan-quan-ly"],
        "cta_text": "Xem nội dung liên quan",
        "cta_icon": "arrow-right",
        "cta_url": "?topic=ai-du-lieu-chuyen-doi-so",
        "display_order": 4,
    },
    {
        "title": "Sức khỏe tâm thần & wellbeing",
        "topic_slug": "suc-khoe-tam-than-wellbeing",
        "icon": "heart-pulse",
        "description": (
            "Nghiên cứu, truyền thống, hỗ trợ sớm, hỗ trợ đồng đẳng và "
            "môi trường học tập – làm việc lành mạnh."
        ),
        "tag_slugs": ["tc-y-te", "tc-giao-duc", "tc-nguon-nhan-luc", "tc-he-thong-y-te", "tc-truong-dai-hoc"],
        "cta_text": "Xem nội dung liên quan",
        "cta_icon": "arrow-right",
        "cta_url": "?topic=suc-khoe-tam-than-wellbeing",
        "display_order": 5,
    },
    {
        "title": "Nguồn nhân lực",
        "topic_slug": "nguon-nhan-luc",
        "icon": "users",
        "description": (
            "Phát triển năng lực, học tập suốt đời, quản trị con người "
            "và chuyển hóa hành vi trong tổ chức."
        ),
        "tag_slugs": ["tc-giao-duc", "tc-suc-khoe-tam-than", "tc-doanh-nghiep", "tc-truong-dai-hoc", "tc-he-thong-y-te"],
        "cta_text": "Xem nội dung liên quan",
        "cta_icon": "arrow-right",
        "cta_url": "?topic=nguon-nhan-luc",
        "display_order": 6,
    },
]

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
        "summary": "Bình luận chuyên môn về xu hướng wellbeing tại doanh nghiệp và tổ chức giáo dục Việt Nam.",
        "published_date": date(2024, 6, 5),
        "source_url": "",
        "category_slug": "goc-nhin-nganh",
        "topic_slugs": ["suc-khoe-tam-than-wellbeing"],
        "asset": "IRDM trên báo chí và diễn đàn chuyên môn/Chuyên gia IRDM_ 'Wellbeing không phải là phúc lợi, mà là đầu tư cho năng lực phục hồi'.png",
        "display_order": 5,
        "is_press_article": True,
        "cta_text": "Xem chi tiết",
        "cta_target": "_blank",
    },
    {
        "slug": "du-lieu-benh-vien-bai-toan-chuyen-doi-so-nghien-cuu-ung-dung",
        "title": "Dữ liệu bệnh viện và bài toán chuyển đổi số: góc nhìn từ nghiên cứu ứng dụng",
        "summary": "Bài phỏng vấn về tiếp cận dữ liệu y tế và định hướng AI trong hệ thống bệnh viện Việt Nam.",
        "published_date": date(2024, 5, 25),
        "source_url": "",
        "category_slug": "cong-bo-nghien-cuu",
        "topic_slugs": ["ai-du-lieu-chuyen-doi-so", "y-te"],
        "asset": "IRDM trên báo chí và diễn đàn chuyên môn/Dữ liệu bệnh viện và bài toán chuyển đổi số_ góc nhìn từ nghiên cứu ứng dụng.png",
        "display_order": 6,
        "is_press_article": True,
        "cta_text": "Xem chi tiết",
        "cta_target": "_blank",
    },
    {
        "slug": "irdm-tham-luan-hoi-nghi-quoc-gia-doi-moi-sang-tao-2024",
        "title": "IRDM tham luận tại Hội nghị Quốc gia về đổi mới sáng tạo trong y tế và giáo dục 2024",
        "summary": "Trình bày kết quả nghiên cứu và đề xuất chính sách trong lĩnh vực chuyển đổi số y tế.",
        "published_date": date(2024, 5, 12),
        "source_url": "",
        "category_slug": "tin-irdm",
        "topic_slugs": ["y-te", "giao-duc"],
        "asset": "IRDM trên báo chí và diễn đàn chuyên môn/IRDM tham luận tại Hội nghị Quốc gia về đổi mới sáng tạo trong y tế và giáo dục 2024.png",
        "display_order": 7,
        "is_press_article": True,
        "cta_text": "Xem chi tiết",
        "cta_target": "_blank",
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
                    "is_press_article": n.get("is_press_article", False),
                    "cta_text": n.get("cta_text", "Xem chi tiết"),
                    "cta_target": n.get("cta_target", "_self"),
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

        # ── Activity News (Tin hoạt động IRDM) ───────────────────────────────
        ACTIVITY_NEWS = [
            {
                "title": "IRDM cung cấp dịch vụ thư ký khoa học cho Bệnh viện Nguyễn Tri Phương",
                "summary": "Hỗ trợ thiết kế và triển khai nhiệm vụ KH,CN & ĐMST tại đơn vị y tế.",
                "category_slug": "tin-irdm",
                "published_date": date(2024, 6, 15),
                "cta_text": "Xem chi tiết",
                "cta_icon": "arrow-right",
                "cta_url": "",
                "display_order": 1,
                "asset": "Tin tức & Sự kiện/IRDM cung cấp dịch vụ thư ký khoa học cho Bệnh viện Nguyễn Tri Phương.png",
            },
            {
                "title": "IRDM ký kết hợp tác với Đại học Y Dược TP.HCM trong nghiên cứu ứng dụng",
                "summary": "Phối hợp triển khai các nghiên cứu về sức khỏe cộng đồng và chuyển đổi số.",
                "category_slug": "tin-irdm",
                "published_date": date(2024, 5, 10),
                "cta_text": "Xem chi tiết",
                "cta_icon": "arrow-right",
                "cta_url": "",
                "display_order": 2,
                "asset": "Tin tức & Sự kiện/IRDM ký kết hợp tác với Đại học Y Dược TP.HCM trong nghiên cứu ứng dụng.png",
            },
            {
                "title": "Tóm lược Hội thảo Wellbeing trong y tế và giáo dục 2024",
                "summary": "Những phát hiện chính và khuyến nghị từ 3 phiên thảo luận chuyên sâu.",
                "category_slug": "tin-irdm",
                "published_date": date(2024, 4, 20),
                "cta_text": "Xem chi tiết",
                "cta_icon": "arrow-right",
                "cta_url": "",
                "display_order": 3,
                "asset": "Tin tức & Sự kiện/Tóm lược Hội thảo Wellbeing trong y tế và giáo dục 2024.png",
            },
            {
                "title": "IRDM hoàn thành báo cáo đánh giá nhu cầu năng lực nhân lực y tế TP.HCM",
                "summary": "Kết quả phân tích từ khảo sát 420 nhân viên y tế tại 8 bệnh viện.",
                "category_slug": "cong-bo-nghien-cuu",
                "published_date": date(2024, 5, 28),
                "cta_text": "Xem chi tiết",
                "cta_icon": "arrow-right",
                "cta_url": "",
                "display_order": 4,
                "asset": "Tin tức & Sự kiện/IRDM hoàn thành báo cáo đánh giá nhu cầu năng lực nhân lực y tế TP.HCM.png",
            },
        ]
        for i, n in enumerate(ACTIVITY_NEWS):
            category = cat_map.get(n.get("category_slug", ""))
            title = n["title"]
            obj, created = KnowledgeActivityNews.objects.update_or_create(
                title=title,
                defaults={
                    "slug": slugify(title),
                    "summary": n.get("summary", ""),
                    "published_date": n.get("published_date"),
                    "category": category,
                    "cta_text": n.get("cta_text", "Xem chi tiết"),
                    "cta_icon": n.get("cta_icon", "arrow-right"),
                    "cta_url": n.get("cta_url", ""),
                    "is_published": True,
                    "is_active": True,
                    "display_order": n.get("display_order", i),
                },
            )
            if created or not obj.thumbnail:
                asset = _load_asset(n["asset"]) if n.get("asset") else None
                img = asset or _placeholder(f"activity-news-{i}.png", i, 600, 400)
                image_slug = title[:40].lower().replace(" ", "-").replace("/", "-")
                obj.thumbnail.save(f"knowledge/activity_news/{image_slug}.png", img, save=True)
            if created:
                self.stdout.write(f"  ActivityNews: {obj.title[:60]}")

        # ── Event Tags ────────────────────────────────────────────────────────────
        EVENT_TAGS_DATA = [
            {"slug": "nguon-nhan-luc-evt",       "label": "Nguồn nhân lực",                    "color": "#3b82f6",  "display_order": 1},
            {"slug": "co-quan-quan-ly-evt",      "label": "Cơ quan quản lý",                  "color": "#f97316",  "display_order": 2},
            {"slug": "truong-dai-hoc-evt",       "label": "Trường đại học",                  "color": "#10b981",  "display_order": 3},
            {"slug": "he-thong-y-te-evt",        "label": "Hệ thống y tế",                   "color": "#06b6d4",  "display_order": 4},
            {"slug": "y-te-evt",                 "label": "Y tế",                              "color": "#ef4444",  "display_order": 5},
            {"slug": "ai-du-lieu-evt",           "label": "AI, dữ liệu & chuyển đổi số",    "color": "#6366f1",  "display_order": 6},
        ]
        evt_tag_map: dict[str, KnowledgeEventTag] = {}
        for tdata in EVENT_TAGS_DATA:
            tag, _ = KnowledgeEventTag.objects.update_or_create(
                slug=tdata["slug"],
                defaults={
                    "label": tdata["label"],
                    "color": tdata["color"],
                    "display_order": tdata["display_order"],
                    "is_active": True,
                },
            )
            evt_tag_map[tdata["slug"]] = tag

        # ── Events (Sự kiện sắp diễn ra) ────────────────────────────────────────
        EVENTS_DATA = [
            {
                "title": "Xây dựng đề xuất, thuyết minh & dự toán nhiệm vụ KH&CN & ĐMST cấp tỉnh/thành phố",
                "description": (
                    "Khóa chuyên sâu hỗ trợ viên ngọi quy trình xây dựng đề xuất, "
                    "thuyết minh và dự toán nhiệm vụ KH&CN & ĐMST cấp tỉnh/thành phố "
                    "theo các yêu cầu thực tiễn."
                ),
                "category_slug": "tin-irdm",
                "event_date": "08/07/2026 - 11/07/2026",
                "location": "Viện IRDM (Thực tế)",
                "tag_slugs": ["nguon-nhan-luc-evt", "co-quan-quan-ly-evt", "truong-dai-hoc-evt", "he-thong-y-te-evt"],
                "cta_text": "Xem sự kiện",
                "cta_icon": "arrow-right",
                "cta_url": "",
                "display_order": 1,
            },
            {
                "title": "Chuyển đổi số Bệnh viện: Từ chiến lược đến vận hành",
                "description": (
                    "Tập trung vào chiến lược chuyển hóa định hướng chuyển đổi số bệnh viện "
                    "thành các buộc triển khai thực tế, gắn với dữ liệu, văn hóa và hỗ trợ quyết định."
                ),
                "category_slug": "tin-irdm",
                "event_date": "14/07/2026",
                "location": "Viện IRDM (Thực tế)",
                "tag_slugs": ["y-te-evt", "ai-du-lieu-evt", "he-thong-y-te-evt", "co-quan-quan-ly-evt"],
                "cta_text": "Xem sự kiện",
                "cta_icon": "arrow-right",
                "cta_url": "",
                "display_order": 2,
            },
            {
                "title": "Nghiệp vụ Thư ký Khoa học đề tài KH, Công nghệ & Đổi mới sáng tạo cấp tỉnh/thành phố",
                "description": (
                    "Hỗ trợ nắm vững vai trò và nghiệp vụ của thư ký khoa học trong quản lý hồ sơ, "
                    "theo dõi quy trình và hỗ trợ triển khai nhiệm vụ KH&CN & ĐMST cấp tỉnh/thành phố."
                ),
                "category_slug": "tin-irdm",
                "event_date": "Di Động 7, 2024",
                "location": "Viện IRDM (Thực tế)",
                "tag_slugs": ["nguon-nhan-luc-evt", "co-quan-quan-ly-evt", "truong-dai-hoc-evt", "he-thong-y-te-evt"],
                "cta_text": "Xem sự kiện",
                "cta_icon": "arrow-right",
                "cta_url": "",
                "display_order": 3,
            },
        ]
        for i, ev in enumerate(EVENTS_DATA):
            category = cat_map.get(ev.get("category_slug", ""))
            obj, created = KnowledgeEvent.objects.update_or_create(
                title=ev["title"],
                defaults={
                    "description": ev.get("description", ""),
                    "category": category,
                    "event_date": ev.get("event_date", ""),
                    "location": ev.get("location", ""),
                    "cta_text": ev.get("cta_text", "Xem sự kiện"),
                    "cta_icon": ev.get("cta_icon", "arrow-right"),
                    "cta_url": ev.get("cta_url", ""),
                    "is_published": True,
                    "is_active": True,
                    "display_order": ev.get("display_order", i),
                },
            )
            obj.tags.set([evt_tag_map[s] for s in ev.get("tag_slugs", []) if s in evt_tag_map])
            if created:
                self.stdout.write(f"  Event: {obj.title[:60]}")

        # ── Accordion Items ──────────────────────────────────────────────────────
        ACCORDION_DATA = [
            {
                "accordion_type": "post_event",
                "title": "Hội thảo Wellbeing trong y tế và giáo dục 2024",
                "content": (
                    "Tóm tắt hội thảo với sự tham gia của hơn 120 chuyên gia và nhà quản lý.\n"
                    "Các chủ đề chính: sức khỏe tâm thần nhân viên y tế, môi trường học đường lành mạnh, các mô hình can thiệp sớm."
                ),
                "display_order": 1,
            },
            {
                "accordion_type": "post_event",
                "title": "Workshop Chuyển đổi số Bệnh viện — Thoái tất và triển vọ ngày 14/07",
                "content": (
                    "Tóm lược các bài trình bày và kết quả thảo luận nhóm trong workshop.\n"
                    "Các quyết định hành động mà các đại biểu cam kết sau sự kiện."
                ),
                "display_order": 2,
            },
            {
                "accordion_type": "cooperation",
                "title": "IRDM và Đại học Y Dược TP.HCM công bố hợp tác nghiên cứu 2024–2026",
                "content": (
                    "Hai bên chính thức công bố hợp tác trong lĩnh vực nghiên cứu ứng dụng và đào tạo năng lực.\n"
                    "Thời gian: 2024–2026. Phạm vi: nghiên cứu hỗn hợp, thực tập sinh, hội thảo chung."
                ),
                "display_order": 1,
            },
            {
                "accordion_type": "cooperation",
                "title": "Hợp tác với Tổ chức Y tế Thế giới (WHO) và UNICEF trong chương trình wellbeing",
                "content": (
                    "Công bố bản ghi nhớ hợp tác (MOU) với WHO và UNICEF.\n"
                    "Nội dung: triển khai chương trình wellbeing tại các tỉnh thành phíển Bắc 2025."
                ),
                "display_order": 2,
            },
        ]
        for i, acc in enumerate(ACCORDION_DATA):
            obj, created = KnowledgeAccordionItem.objects.update_or_create(
                accordion_type=acc["accordion_type"],
                title=acc["title"],
                defaults={
                    "content": acc["content"],
                    "is_published": True,
                    "is_active": True,
                    "display_order": acc["display_order"],
                },
            )
            if created:
                self.stdout.write(f"  Accordion [{acc['accordion_type']}]: {obj.title[:60]}")

        # ── News & Events section fields on listing page ───────────────────
        KnowledgeListingPage.objects.filter(pk=listing_page.pk).update(
            news_section_label="IRDM trên báo chí và diễn đàn chuyên môn",
            news_section_heading="Tin tức & Sự kiện",
            news_section_description=(
                "Tin tức và sự kiện hỗ trợ người đọc theo dõi các hoạt động chuyên môn, hợp tác "
                "và diễn đàn mà IRDM tham gia hoặc tổ chức."
            ),
            news_activity_heading="Tin hoạt động IRDM",
            news_events_heading="Sự kiện sắp diễn ra",
        )
        listing_page.refresh_from_db()

        # ── Press Section fields on listing page ─────────────────────────────────
        KnowledgeListingPage.objects.filter(pk=listing_page.pk).update(
            press_section_label="BÁO CHÍ & DIỄN ĐÀN",
            press_section_heading="IRDM trên báo chí và diễn đàn chuyên môn",
            press_section_description=(
                "Tổng hợp các bài báo, phỏng vấn và diễn đàn có sự tham gia của IRDM "
                "và chuyên gia của Viện."
            ),
        )
        listing_page.refresh_from_db()

        # ── Ready Section fields on listing page ───────────────────────────────
        KnowledgeListingPage.objects.filter(pk=listing_page.pk).update(
            ready_section_is_active=True,
            ready_section_subtitle="Sẵn sàng trao đổi?",
            ready_section_title=(
                "BẠN ĐANG TÌM KIẾM NGHIÊN CỨU, PHÂN TÍCH HOẶC TÀI LIỆU PHù HỢP "
                "VỚI LĨNH VỰC CỦA MÌNH?"
            ),
            ready_section_description=(
                "IRDM có thể đồng hành cùng bạn trong việc kết nối tri thức, dữ liệu và giải pháp "
                "thực tiễn cho các bài toán trong y tế, giáo dục, môi trường và phát triển nguồn lực."
            ),
            ready_section_overlay_color="#0d1e4a",
            ready_section_overlay_opacity=0.82,
            ready_section_text_color="light",
        )
        listing_page.refresh_from_db()

        # ── Ready Section CTA Buttons ─────────────────────────────────────────────
        READY_CTA_BUTTONS = [
            {"text": "Khám phá tri thức",        "url": "/tri-thuc-goc-nhin/",                    "style": "primary",   "icon": "",           "display_order": 1},
            {"text": "Đăng ký tải tài liệu",    "url": "/tri-thuc-goc-nhin/#tai-lieu-tai-ve", "style": "outline",   "icon": "",           "display_order": 2},
            {"text": "Liên hệ trao đổi với IRDM", "url": "/lien-he/",                            "style": "outline",   "icon": "arrow-right", "display_order": 3},
        ]
        for btn_data in READY_CTA_BUTTONS:
            KnowledgeCTAButton.objects.update_or_create(
                listing_page=listing_page,
                text=btn_data["text"],
                defaults={
                    "url": btn_data["url"],
                    "target": "_self",
                    "style": btn_data["style"],
                    "icon": btn_data.get("icon", ""),
                    "display_order": btn_data["display_order"],
                    "is_published": True,
                    "is_active": True,
                },
            )

        # ── Content Type Section fields on listing page ─────────────────────
        KnowledgeListingPage.objects.filter(pk=listing_page.pk).update(
            content_type_section_label="KHÁM PHÁ THEO LOẠI NỘI DUNG",
            content_type_section_heading="Khám phá theo Loại Nội Dung",
            content_type_section_description=(
                "Các nhóm nội dung được Viện IRDM biên soạn và hệ thống hóa nhằm hỗ trợ người đọc tiếp cận "
                "tri thức theo nhu cầu: nghiên cứu, phân tích, chính sách, tài liệu ứng dụng, "
                "tin chuyên môn và sự kiện."
            ),
            content_type_section_cta_text="Xem tất cả năng lực",
            content_type_section_cta_icon="arrow-right",
            content_type_section_cta_url="/tri-thuc-goc-nhin/",
        )
        listing_page.refresh_from_db()

        # ── Content Type Cards ─────────────────────────────────────────────
        for card_data in CONTENT_TYPE_CARDS:
            category = cat_map.get(card_data.get("category_slug", ""))
            card, created = KnowledgeContentTypeCard.objects.update_or_create(
                listing_page=listing_page,
                title=card_data["title"],
                defaults={
                    "category": category,
                    "summary": card_data.get("summary", ""),
                    "cta_text": card_data.get("cta_text", ""),
                    "cta_icon": card_data.get("cta_icon", "arrow-right"),
                    "cta_url": card_data.get("cta_url", ""),
                    "display_order": card_data.get("display_order", 1),
                    "is_published": True,
                    "is_active": True,
                },
            )
            # Set tags — only slugs that exist in topic_map
            tag_objs = [topic_map[s] for s in card_data.get("tag_slugs", []) if s in topic_map]
            card.tags.set(tag_objs)
            if created:
                self.stdout.write(f"  ContentTypeCard: {card.title}")

        # ── Topic Section fields on listing page ─────────────────────────────
        KnowledgeListingPage.objects.filter(pk=listing_page.pk).update(
            topic_section_label="KHÁM PHÁ THEO CHỦ ĐỀ",
            topic_section_heading="Khám phá theo Chủ đề",
            topic_section_description=(
                "Các chủ đề trọng tâm phản ánh định hướng nghiên cứu, phổ biến tri thức "
                "và đồng hành triển khai của Viện IRDM trong y tế, giáo dục, môi trường, "
                "dữ liệu, wellbeing và phát triển nguồn lực."
            ),
        )
        listing_page.refresh_from_db()

        # ── Topic Card Tags ───────────────────────────────────────────────────
        tc_tag_map: dict[str, KnowledgeTopicCardTag] = {}
        for tag_data in TOPIC_CARD_TAGS:
            tag, _ = KnowledgeTopicCardTag.objects.update_or_create(
                slug=tag_data["slug"],
                defaults={
                    "label": tag_data["label"],
                    "color": tag_data["color"],
                    "display_order": tag_data["display_order"],
                    "is_active": True,
                },
            )
            tc_tag_map[tag_data["slug"]] = tag

        # ── Topic Cards ───────────────────────────────────────────────────────
        for card_data in TOPIC_CARDS:
            linked_topic = topic_map.get(card_data.get("topic_slug", ""))
            card, created = KnowledgeTopicCard.objects.update_or_create(
                listing_page=listing_page,
                title=card_data["title"],
                defaults={
                    "topic": linked_topic,
                    "icon": card_data.get("icon", ""),
                    "description": card_data.get("description", ""),
                    "cta_text": card_data.get("cta_text", ""),
                    "cta_icon": card_data.get("cta_icon", "arrow-right"),
                    "cta_url": card_data.get("cta_url", ""),
                    "display_order": card_data.get("display_order", 1),
                    "is_published": True,
                    "is_active": True,
                },
            )
            tag_objs = [tc_tag_map[s] for s in card_data.get("tag_slugs", []) if s in tc_tag_map]
            card.tags.set(tag_objs)
            if created:
                self.stdout.write(f"  TopicCard: {card.title}")

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
