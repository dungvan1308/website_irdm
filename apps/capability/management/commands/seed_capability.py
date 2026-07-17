"""
Management command: seed_capability

Populates the Capability module with demonstration data extracted from
the approved Figma PDF (FigmaPDF/Capability_Subpage/Subpage - v2.pdf).

Idempotent — safe to run multiple times.
"""

from django.core.management.base import BaseCommand

from apps.capability.models import (
    Capability,
    CapabilityCaseStudy,
    CapabilityCaseStudyTag,
    CapabilityFeature,
    CapabilityHowStep,
    CapabilityListingPage,
    CapabilityNeedItem,
    CapabilityOutput,
)


# ─── Listing Page ─────────────────────────────────────────────────────────────

LISTING_PAGE = {
    "section_label": "Nền tảng chuyên môn",
    "heading": "Năng lực cốt lõi",
    "description": (
        "Các năng lực dưới đây tạo nên nền tảng chuyên môn của IRDM – "
        "là cơ sở để đồng hành, thiết kế và triển khai các giải pháp phù hợp "
        "với từng đối tác."
    ),
    "overview_heading": "Tổng quan về 7 năng lực",
    "overview_description": (
        "Các năng lực dưới đây tạo nên nền tảng chuyên môn của IRDM – "
        "là cơ sở để đồng hành, thiết kế và triển khai các giải pháp phù hợp với từng đối tác. "
        "Mỗi năng lực phản ánh một lĩnh vực can thiệp và đồng hành cụ thể, "
        "được phát triển từ thực tiễn làm việc với các tổ chức y tế, giáo dục và cộng đồng."
    ),
    "cta_label": "Liên hệ hợp tác",
    "cta_url": "/contact/",
    # ── CTA Section — Kết nối với IRDM ───────────────────────────────────────
    "cta_show": True,
    "cta_eyebrow": "Kết nối với IRDM",
    "cta_heading": (
        "Cùng thiết kế giải pháp phù hợp với bối cảnh và mục tiêu phát triển của tổ chức"
    ),
    "cta_description": (
        "Kết nối với Viện IRDM để cùng thiết kế giải pháp phù hợp với bối cảnh, "
        "dữ liệu và mục tiêu phát triển của tổ chức của bạn."
    ),
    "cta_overlay_color": "#0a1628",
    "cta_overlay_opacity": 75,
    "is_active": True,
    "display_order": 0,
}

# ─── Capability Data ──────────────────────────────────────────────────────────

CAPABILITIES = [
    # ── 1. Nghiên cứu ứng dụng & khoa học dữ liệu ────────────────────────────
    {
        "slug": "nghien-cuu-ung-dung-va-khoa-hoc-du-lieu",
        "title": "Nghiên cứu ứng dụng & khoa học dữ liệu",
        "section_label": "Nền tảng chuyên môn",
        "display_order": 1,
        "summary": (
            "Chuyển hóa vấn đề thực tiễn thành câu hỏi nghiên cứu, dữ liệu thành tri thức, "
            "và kết quả phân tích thành căn cứ cho quản trị, chính sách và hành động."
        ),
        "description": (
            "Chuyển hóa vấn đề thực tiễn thành câu hỏi nghiên cứu, dữ liệu thành tri thức "
            "và kết quả phân tích thành căn cứ cho quản trị, chính sách và hành động."
        ),
        "what_is_label": "Năng lực này là gì?",
        "what_is_description": (
            "Đây là năng lực giúp tổ chức hiểu đúng vấn đề, tổ chức dữ liệu có ý nghĩa "
            "và tạo bằng chứng đủ tin cậy để định hướng quyết định, cải tiến chương trình "
            "hoặc xây dựng nhiệm vụ khoa học, công nghệ và đổi mới sáng tạo."
        ),
        "need_section_label": "Khi nào tổ chức cần năng lực này?",
        "how_label": "Viện IRDM đồng hành như thế nào?",
        "output_label": "Đầu ra có thể bao gồm",
        "cta_primary_label": "Khám phá thêm Giải pháp",
        "cta_primary_url": "/giai-phap/",
        "cta_secondary_label": "Xem thêm tin IRDM",
        "cta_secondary_url": "/tin-tuc/",
        "is_published": True,
        "meta_title": "Nghiên cứu ứng dụng & khoa học dữ liệu — IRDM",
        "meta_description": (
            "Chuyển hóa vấn đề thực tiễn thành câu hỏi nghiên cứu và bằng chứng "
            "cho quản trị, chính sách và hành động."
        ),
        "features": [
            "Nghiên cứu",
            "Dữ liệu",
            "Phân tích",
            "Chính sách",
            "KHCN & ĐMST",
        ],
        "need_items": [
            (1, "Có dữ liệu, khảo sát hoặc kinh nghiệm thực tiễn nhưng chưa được phân tích thành insight rõ ràng."),
            (2, "Cần xây dựng concept note, đề xuất nhiệm vụ KHCN & ĐMST hoặc khuyến nghị chính sách / quản trị."),
            (3, "Cần đánh giá hiện trạng, nguyên nhân và ưu tiên hành động trước khi thiết kế giải pháp."),
            (4, "Cần sáng kiến / ý tưởng KHCN & ĐMST, thiết kế nhiệm vụ và triển khai các nhiệm vụ KHCN & ĐMST."),
            (5, "Đánh giá tác động và hiệu quả của chương trình / dự án."),
            (6, "Đánh giá kinh tế - y tế Dược."),
        ],
        "how_steps": [
            ("Thiết kế nghiên cứu ứng dụng và khung phân tích", "document-text"),
            ("Khảo sát, chuẩn hóa, xử lý và diễn giải dữ liệu", "chart-bar"),
            ("Tổng hợp bằng chứng, xây dựng khuyến nghị, concept note", "light-bulb"),
            ("Đề xuất nhiệm vụ KHCN & ĐMST", "arrow-trending-up"),
        ],
        "outputs": [
            (1, "Báo cáo nghiên cứu ứng dụng hoặc báo cáo phân tích dữ liệu"),
            (2, "Bộ chỉ số, khung đánh giá hoặc dashboard phân tích khi phù hợp"),
            (3, "Tổng hợp bằng chứng và bộ dữ liệu chuẩn hóa"),
            (4, "Concept note, policy brief, khuyến nghị quản trị"),
            (5, "Nhiệm vụ KHCN & ĐMST được triển khai và nghiệm thu đúng hạn"),
        ],
        "case_studies": [
            {
                "number": 1,
                "category_label": "Bệnh viện & KHCN",
                "title": "Chuyển hóa dữ liệu bệnh viện thành định hướng nhiệm vụ KHCN & ĐMST",
                "description": (
                    "Viện IRDM hỗ trợ đơn vị y tế rà soát dữ liệu, làm rõ bài toán ưu tiên "
                    "và định hình hướng nghiên cứu ứng dụng phù hợp với năng lực chuyên môn, "
                    "dữ liệu sẵn có và điều kiện triển khai; đồng thời phối hợp chủ trì, "
                    "triển khai và cung cấp dịch vụ thư ký khoa học cho các nhiệm vụ KHCN & ĐMST."
                ),
                "cta_primary_label": "Khám phá thêm Giải pháp",
                "cta_primary_url": "/giai-phap/",
                "cta_secondary_label": "Xem thêm tin IRDM",
                "cta_secondary_url": "/tin-tuc/",
                "tags": ["Dữ liệu y tế", "KHCN & ĐMST", "Bệnh viện"],
            },
        ],
    },

    # ── 2. AI, y tế số & hỗ trợ ra quyết định ────────────────────────────────
    {
        "slug": "ai-y-te-so-va-ho-tro-ra-quyet-dinh",
        "title": "AI, y tế số & hỗ trợ ra quyết định",
        "section_label": "Nền tảng chuyên môn",
        "display_order": 2,
        "summary": (
            "Hỗ trợ tổ chức nhận diện use case, đánh giá dữ liệu, thiết kế lộ trình thí điểm "
            "và phối hợp phát triển công cụ số hoặc AI phù hợp với bối cảnh triển khai."
        ),
        "description": (
            "Hỗ trợ tổ chức nhận diện các bài toán ứng dụng cụ thể, đánh giá dữ liệu, "
            "thiết kế lộ trình thí điểm và phối hợp phát triển công cụ số hoặc AI phù hợp "
            "với bối cảnh triển khai."
        ),
        "what_is_label": "Năng lực này là gì?",
        "what_is_description": (
            "Đây là năng lực kết nối dữ liệu, công nghệ số và hiểu biết về hệ thống để giúp "
            "tổ chức tiếp cận chuyển đổi số hoặc AI theo hướng có kiểm soát, có căn cứ và "
            "phù hợp với năng lực triển khai."
        ),
        "need_section_label": "Khi nào tổ chức cần năng lực này?",
        "how_label": "Viện IRDM đồng hành như thế nào?",
        "output_label": "Đầu ra có thể bao gồm",
        "cta_primary_label": "Khám phá thêm Giải pháp",
        "cta_primary_url": "/giai-phap/",
        "cta_secondary_label": "Xem thêm tin IRDM",
        "cta_secondary_url": "/tin-tuc/",
        "is_published": True,
        "meta_title": "AI, y tế số & hỗ trợ ra quyết định — IRDM",
        "meta_description": (
            "Hỗ trợ tổ chức nhận diện use case AI, đánh giá dữ liệu và thiết kế lộ trình "
            "thí điểm chuyển đổi số phù hợp."
        ),
        "features": ["AI", "Dữ liệu số", "Y tế số", "KHCN & ĐMST", "Chuyển đổi số"],
        "need_items": [
            (1, "Muốn ứng dụng AI hoặc công cụ số nhưng chưa rõ bài toán ưu tiên và điều kiện dữ liệu."),
            (2, "Cần dashboard, công cụ theo dõi hoặc logic hỗ trợ ra quyết định phục vụ quản trị / vận hành."),
            (3, "Cần lộ trình thí điểm, đánh giá và mở rộng giải pháp số theo từng giai đoạn."),
        ],
        "how_steps": [
            ("Rà soát bài toán số hóa và mức độ sẵn sàng của dữ liệu", "magnifying-glass"),
            ("Đề xuất ý tưởng và kết nối chuyên gia công nghệ & AI phù hợp từ mạng lưới", "users"),
            ("Điều phối và quản lý nhiệm vụ KHCN & ĐMST", "document-text"),
            ("Thiết kế logic hỗ trợ ra quyết định, dashboard hoặc công cụ số", "chart-bar"),
            ("Đồng hành thử nghiệm, tinh chỉnh, tập huấn và đánh giá khả năng ứng dụng", "arrow-trending-up"),
        ],
        "outputs": [
            (1, "Bản đồ use case và đánh giá mức độ sẵn sàng của dữ liệu"),
            (2, "Dashboard, mô hình dữ liệu hoặc đặc tả yêu cầu cho công cụ số"),
            (3, "Ý tưởng KHCN & ĐMST, hỗ trợ đề xuất / đặt hàng và triển khai nhiệm vụ / dự án"),
            (4, "Lộ trình thí điểm, tài liệu tập huấn và khuyến nghị triển khai / mở rộng"),
        ],
        "case_studies": [
            {
                "number": 1,
                "category_label": "Bệnh viện & AI",
                "title": "Định hình bài toán AI từ dữ liệu bệnh viện",
                "description": (
                    "Viện IRDM hỗ trợ bệnh viện đánh giá hiện trạng dữ liệu, xác định use case AI "
                    "khả thi và thiết kế hướng nghiên cứu / thí điểm phù hợp. Viện IRDM giữ vai trò "
                    "kết nối bài toán thực tiễn, dữ liệu bệnh viện và chuyên gia, trên nguyên tắc AI "
                    "chỉ hỗ trợ phân tích và ra quyết định, không thay thế chuyên môn y khoa."
                ),
                "cta_primary_label": "Khám phá thêm Giải pháp",
                "cta_primary_url": "/giai-phap/",
                "cta_secondary_label": "Xem thêm tin IRDM",
                "cta_secondary_url": "/tin-tuc/",
                "tags": ["AI", "Y tế số", "KHCN & ĐMST"],
            },
        ],
    },

    # ── 3. Giáo dục & phát triển năng lực ────────────────────────────────────
    {
        "slug": "giao-duc-va-phat-trien-nang-luc",
        "title": "Giáo dục & phát triển năng lực",
        "section_label": "Nền tảng chuyên môn",
        "display_order": 3,
        "summary": (
            "Thiết kế chương trình học tập, tập huấn và phát triển năng lực theo hướng ứng dụng, "
            "gắn với thay đổi hành vi và mục tiêu phát triển dài hạn."
        ),
        "description": (
            "Thiết kế chương trình học tập, tập huấn và phát triển năng lực theo hướng ứng dụng, "
            "cá nhân hóa, gắn với thay đổi hành vi và mục tiêu phát triển dài hạn."
        ),
        "what_is_label": "Năng lực này là gì?",
        "what_is_description": (
            "Đây là năng lực giúp tổ chức chuyển nhu cầu phát triển con người thành chương trình "
            "học tập có cấu trúc, phù hợp bối cảnh và hướng tới thay đổi hành vi trong công việc, "
            "học tập hoặc quản trị."
        ),
        "need_section_label": "Khi nào tổ chức cần năng lực này?",
        "how_label": "Viện IRDM đồng hành như thế nào?",
        "output_label": "Đầu ra có thể bao gồm",
        "cta_primary_label": "Khám phá thêm Giải pháp",
        "cta_primary_url": "/giai-phap/",
        "cta_secondary_label": "Xem thêm tin IRDM",
        "cta_secondary_url": "/tin-tuc/",
        "is_published": True,
        "meta_title": "Giáo dục & phát triển năng lực — IRDM",
        "meta_description": (
            "Thiết kế chương trình học tập, tập huấn và phát triển năng lực theo hướng "
            "ứng dụng, gắn với thay đổi hành vi."
        ),
        "features": ["Đào tạo", "Năng lực", "E-Learning", "Phát triển con người"],
        "need_items": [
            (1, "Đội ngũ cần nâng cao kỹ năng, tư duy, năng lực thích ứng hoặc năng lực phối hợp."),
            (2, "Cần chương trình đào tạo, microlearning hoặc E-Learning có khả năng ứng dụng thực tế."),
            (3, "Muốn phát triển lộ trình năng lực cho nhân sự, quản lý hoặc nhóm chuyên môn."),
        ],
        "how_steps": [
            ("Thiết kế chương trình đào tạo, microlearning và E-Learning", "document-text"),
            ("Phát triển kỹ năng, tư duy, năng lực làm việc và năng lực thích ứng", "light-bulb"),
            ("Gắn học tập với tình huống và bối cảnh thực tế, phản tư và ứng dụng vào công việc", "arrow-trending-up"),
        ],
        "outputs": [
            (1, "Khung chương trình đào tạo, tập huấn hoặc phát triển năng lực"),
            (2, "Bộ học liệu, bài tập ứng dụng, case thực hành hoặc nội dung E-Learning"),
            (3, "Lộ trình phát triển năng lực theo nhóm đối tượng hoặc theo mục tiêu tổ chức"),
        ],
        "case_studies": [
            {
                "number": 1,
                "category_label": "Y tế & Giáo dục",
                "title": "Chương trình phát triển năng lực cho nhân sự y tế và người học trẻ",
                "description": (
                    "Viện IRDM thiết kế và triển khai các chương trình đào tạo về tư duy, giao tiếp, "
                    "quản trị cảm xúc, xử lý xung đột, lãnh đạo thấu cảm, phương pháp học tập và "
                    "kỹ năng nghề nghiệp cho các nhóm đối tượng trong y tế, giáo dục và doanh nghiệp."
                ),
                "cta_primary_label": "Khám phá thêm Giải pháp",
                "cta_primary_url": "/giai-phap/",
                "cta_secondary_label": "Xem thêm tin IRDM",
                "cta_secondary_url": "/tin-tuc/",
                "tags": ["Đào tạo", "Năng lực", "E-Learning"],
            },
        ],
    },

    # ── 4. Sức khỏe tâm thần & wellbeing ─────────────────────────────────────
    {
        "slug": "suc-khoe-tam-than-va-wellbeing",
        "title": "Sức khỏe tâm thần & wellbeing",
        "section_label": "Nền tảng chuyên môn",
        "display_order": 4,
        "summary": (
            "Phát triển các sáng kiến phòng ngừa, nâng đỡ tâm lý - xã hội, năng lực phục hồi "
            "và môi trường học tập - làm việc lành mạnh."
        ),
        "description": (
            "Phát triển các sáng kiến phòng ngừa, nâng đỡ tâm lý - xã hội, năng lực phục hồi "
            "và môi trường học tập - làm việc lành mạnh."
        ),
        "what_is_label": "Năng lực này là gì?",
        "what_is_description": (
            "Đây là năng lực giúp tổ chức xây dựng môi trường học tập và làm việc hỗ trợ sức khỏe "
            "tâm thần, thông qua các chương trình phòng ngừa, can thiệp sớm và nâng cao năng lực "
            "phục hồi cho cá nhân và tập thể."
        ),
        "need_section_label": "Khi nào tổ chức cần năng lực này?",
        "how_label": "Viện IRDM đồng hành như thế nào?",
        "output_label": "Đầu ra có thể bao gồm",
        "cta_primary_label": "Khám phá thêm Giải pháp",
        "cta_primary_url": "/giai-phap/",
        "cta_secondary_label": "Xem thêm tin IRDM",
        "cta_secondary_url": "/tin-tuc/",
        "is_published": True,
        "meta_title": "Sức khỏe tâm thần & wellbeing — IRDM",
        "meta_description": (
            "Phát triển sáng kiến phòng ngừa, nâng đỡ tâm lý - xã hội và năng lực phục hồi "
            "cho tổ chức và cộng đồng."
        ),
        "features": ["Sức khỏe tâm thần", "Wellbeing", "Phòng ngừa", "Phục hồi"],
        "need_items": [
            (1, "Nhân sự, học sinh hoặc cộng đồng đang trải qua áp lực tâm lý, kiệt sức hoặc stress kéo dài."),
            (2, "Tổ chức muốn xây dựng chương trình phòng ngừa và hỗ trợ sức khỏe tâm thần tại nơi làm việc hoặc học đường."),
            (3, "Cần đánh giá thực trạng wellbeing và thiết kế can thiệp phù hợp với bối cảnh cụ thể."),
            (4, "Muốn tích hợp yếu tố sức khỏe tâm thần vào chương trình đào tạo, quản lý hoặc chăm sóc lâm sàng."),
        ],
        "how_steps": [
            ("Đánh giá nhu cầu và thực trạng sức khỏe tâm thần của nhóm đối tượng", "magnifying-glass"),
            ("Thiết kế chương trình phòng ngừa, nâng đỡ và phục hồi phù hợp bối cảnh", "light-bulb"),
            ("Triển khai can thiệp và tập huấn cho nhân viên / giáo viên / cán bộ y tế", "users"),
            ("Theo dõi, đánh giá hiệu quả và điều chỉnh chương trình theo thực tiễn", "arrow-trending-up"),
        ],
        "outputs": [
            (1, "Báo cáo đánh giá thực trạng sức khỏe tâm thần và wellbeing của tổ chức"),
            (2, "Chương trình phòng ngừa, hỗ trợ tâm lý - xã hội và nâng cao năng lực phục hồi"),
            (3, "Bộ tài liệu tập huấn cho nhân viên tuyến đầu và người hỗ trợ"),
            (4, "Khuyến nghị điều chỉnh môi trường làm việc / học tập để hỗ trợ wellbeing"),
        ],
        "case_studies": [
            {
                "number": 1,
                "category_label": "Y tế & Cộng đồng",
                "title": "Chương trình wellbeing cho nhân viên y tế tuyến đầu",
                "description": (
                    "Viện IRDM phối hợp với cơ sở y tế thiết kế và triển khai chương trình hỗ trợ "
                    "sức khỏe tâm thần cho nhân viên y tế, tập trung vào phòng ngừa kiệt sức, "
                    "xây dựng năng lực phục hồi và tạo môi trường làm việc hỗ trợ về mặt tâm lý."
                ),
                "cta_primary_label": "Khám phá thêm Giải pháp",
                "cta_primary_url": "/giai-phap/",
                "cta_secondary_label": "Xem thêm tin IRDM",
                "cta_secondary_url": "/tin-tuc/",
                "tags": ["Sức khỏe tâm thần", "Y tế", "Wellbeing"],
            },
        ],
    },

    # ── 5. ESG, Green University & Green Hospital ─────────────────────────────
    {
        "slug": "esg-green-university-va-green-hospital",
        "title": "ESG, Green University & Green Hospital",
        "section_label": "Nền tảng chuyên môn",
        "display_order": 5,
        "summary": (
            "Đồng hành cùng tổ chức xây dựng lộ trình phát triển bền vững, kết nối quản trị, "
            "con người, môi trường và trách nhiệm xã hội."
        ),
        "description": (
            "Đồng hành cùng tổ chức xây dựng lộ trình phát triển bền vững, kết nối quản trị, "
            "con người, môi trường và trách nhiệm xã hội."
        ),
        "what_is_label": "Năng lực này là gì?",
        "what_is_description": (
            "Đây là năng lực hỗ trợ tổ chức thiết kế và triển khai chiến lược phát triển bền vững "
            "theo tiêu chuẩn ESG (Môi trường - Xã hội - Quản trị), tích hợp các mục tiêu bền vững "
            "vào hoạt động vận hành và quản lý tổ chức."
        ),
        "need_section_label": "Khi nào tổ chức cần năng lực này?",
        "how_label": "Viện IRDM đồng hành như thế nào?",
        "output_label": "Đầu ra có thể bao gồm",
        "cta_primary_label": "Khám phá thêm Giải pháp",
        "cta_primary_url": "/giai-phap/",
        "cta_secondary_label": "Xem thêm tin IRDM",
        "cta_secondary_url": "/tin-tuc/",
        "is_published": True,
        "meta_title": "ESG, Green University & Green Hospital — IRDM",
        "meta_description": (
            "Đồng hành xây dựng lộ trình ESG, phát triển bền vững cho bệnh viện và "
            "cơ sở giáo dục đại học."
        ),
        "features": ["ESG", "Bền vững", "Green University", "Green Hospital", "Quản trị"],
        "need_items": [
            (1, "Tổ chức muốn xây dựng báo cáo ESG hoặc lộ trình phát triển bền vững lần đầu."),
            (2, "Cần tích hợp tiêu chí ESG vào quản trị, vận hành và chiến lược tổ chức."),
            (3, "Muốn đạt chứng nhận Green Hospital, Green University hoặc tiêu chuẩn bền vững quốc tế."),
            (4, "Cần đánh giá hiện trạng ESG và xác định ưu tiên cải thiện phù hợp năng lực tổ chức."),
        ],
        "how_steps": [
            ("Đánh giá hiện trạng ESG và khoảng cách so với tiêu chuẩn mục tiêu", "magnifying-glass"),
            ("Thiết kế lộ trình và kế hoạch hành động ESG / phát triển bền vững", "document-text"),
            ("Hỗ trợ xây dựng hệ thống dữ liệu, báo cáo và công bố thông tin bền vững", "chart-bar"),
            ("Đồng hành triển khai, giám sát và cải tiến liên tục theo tiêu chuẩn", "arrow-trending-up"),
        ],
        "outputs": [
            (1, "Báo cáo đánh giá hiện trạng ESG và khoảng cách cần cải thiện"),
            (2, "Lộ trình ESG / phát triển bền vững theo từng giai đoạn"),
            (3, "Hệ thống thu thập dữ liệu và báo cáo ESG / bền vững"),
            (4, "Tài liệu chuẩn bị hồ sơ chứng nhận Green Hospital / Green University"),
        ],
        "case_studies": [
            {
                "number": 1,
                "category_label": "Bệnh viện & Bền vững",
                "title": "Lộ trình Green Hospital cho cơ sở y tế",
                "description": (
                    "Viện IRDM đồng hành cùng bệnh viện đánh giá hiện trạng các tiêu chí ESG, "
                    "xây dựng lộ trình và kế hoạch hành động hướng tới chứng nhận Green Hospital, "
                    "kết nối các mục tiêu bền vững với chiến lược phát triển và vận hành của cơ sở y tế."
                ),
                "cta_primary_label": "Khám phá thêm Giải pháp",
                "cta_primary_url": "/giai-phap/",
                "cta_secondary_label": "Xem thêm tin IRDM",
                "cta_secondary_url": "/tin-tuc/",
                "tags": ["ESG", "Green Hospital", "Bệnh viện"],
            },
        ],
    },

    # ── 6. Phổ biến tri thức & truyền thông cộng đồng ────────────────────────
    {
        "slug": "pho-bien-tri-thuc-va-truyen-thong-cong-dong",
        "title": "Phổ biến tri thức & truyền thông cộng đồng",
        "section_label": "Nền tảng chuyên môn",
        "display_order": 6,
        "summary": (
            "Chuyển hóa nghiên cứu, dữ liệu và hiểu biết chuyên môn thành nội dung dễ tiếp cận, "
            "có giá trị ứng dụng cho cộng đồng và đối tác."
        ),
        "description": (
            "Chuyển hóa nghiên cứu, dữ liệu và hiểu biết chuyên môn thành nội dung dễ tiếp cận, "
            "có giá trị ứng dụng cho cộng đồng và đối tác."
        ),
        "what_is_label": "Năng lực này là gì?",
        "what_is_description": (
            "Đây là năng lực biên dịch tri thức khoa học và chuyên môn thành ngôn ngữ phù hợp "
            "với từng nhóm đối tượng, kết hợp truyền thông chiến lược để tạo tác động xã hội "
            "và thay đổi hành vi trong cộng đồng."
        ),
        "need_section_label": "Khi nào tổ chức cần năng lực này?",
        "how_label": "Viện IRDM đồng hành như thế nào?",
        "output_label": "Đầu ra có thể bao gồm",
        "cta_primary_label": "Khám phá thêm Giải pháp",
        "cta_primary_url": "/giai-phap/",
        "cta_secondary_label": "Xem thêm tin IRDM",
        "cta_secondary_url": "/tin-tuc/",
        "is_published": True,
        "meta_title": "Phổ biến tri thức & truyền thông cộng đồng — IRDM",
        "meta_description": (
            "Chuyển hóa nghiên cứu và dữ liệu thành nội dung dễ tiếp cận, có tác động "
            "xã hội cho cộng đồng và đối tác."
        ),
        "features": ["Truyền thông", "Tri thức", "Cộng đồng", "Nội dung"],
        "need_items": [
            (1, "Có kết quả nghiên cứu, dữ liệu hoặc kiến thức chuyên môn nhưng chưa tiếp cận được đến đối tượng cần thiết."),
            (2, "Cần thiết kế chiến dịch truyền thông sức khỏe hoặc truyền thông chính sách hướng đến cộng đồng."),
            (3, "Muốn xây dựng kênh phổ biến tri thức chuyên ngành hoặc tài nguyên học tập mở cho cộng đồng."),
        ],
        "how_steps": [
            ("Phân tích đối tượng và xác định thông điệp cốt lõi cần truyền tải", "magnifying-glass"),
            ("Biên soạn và thiết kế nội dung phù hợp với từng kênh và nhóm đối tượng", "document-text"),
            ("Triển khai chiến dịch truyền thông và phổ biến tài liệu", "users"),
            ("Đánh giá hiệu quả tiếp cận và điều chỉnh chiến lược truyền thông", "chart-bar"),
        ],
        "outputs": [
            (1, "Bộ tài liệu truyền thông, infographic và nội dung đa phương tiện"),
            (2, "Chiến lược và kế hoạch truyền thông cộng đồng"),
            (3, "Tài nguyên học tập mở hoặc thư viện tri thức chuyên ngành"),
            (4, "Báo cáo hiệu quả truyền thông và khuyến nghị cải tiến"),
        ],
        "case_studies": [
            {
                "number": 1,
                "category_label": "Y tế Cộng đồng",
                "title": "Chiến dịch truyền thông sức khỏe tâm thần cho sinh viên",
                "description": (
                    "Viện IRDM phối hợp thiết kế và triển khai chiến dịch truyền thông nâng cao "
                    "nhận thức về sức khỏe tâm thần tại các trường đại học, kết hợp nội dung số, "
                    "hội thảo và tài liệu phổ biến kiến thức nhằm giảm kỳ thị và tăng khả năng "
                    "tiếp cận dịch vụ hỗ trợ."
                ),
                "cta_primary_label": "Khám phá thêm Giải pháp",
                "cta_primary_url": "/giai-phap/",
                "cta_secondary_label": "Xem thêm tin IRDM",
                "cta_secondary_url": "/tin-tuc/",
                "tags": ["Truyền thông", "Sức khỏe tâm thần", "Sinh viên"],
            },
        ],
    },

    # ── 7. Sức khỏe môi trường & mô hình can thiệp phục hồi ──────────────────
    {
        "slug": "suc-khoe-moi-truong-va-mo-hinh-can-thiep-phuc-hoi",
        "title": "Sức khỏe môi trường & mô hình can thiệp phục hồi",
        "section_label": "Nền tảng chuyên môn",
        "display_order": 7,
        "summary": (
            "Kết nối môi trường sống, sức khỏe thể chất, sức khỏe tâm thần và trải nghiệm phục hồi "
            "để phát triển các chương trình phù hợp với bối cảnh tổ chức."
        ),
        "description": (
            "Kết nối môi trường sống, sức khỏe thể chất, sức khỏe tâm thần và trải nghiệm phục hồi "
            "để phát triển các chương trình phù hợp với bối cảnh tổ chức."
        ),
        "what_is_label": "Năng lực này là gì?",
        "what_is_description": (
            "Đây là năng lực tích hợp các yếu tố môi trường vật lý, xã hội và tâm lý để thiết kế "
            "các mô hình can thiệp phục hồi toàn diện, phù hợp với đặc thù từng tổ chức và cộng đồng."
        ),
        "need_section_label": "Khi nào tổ chức cần năng lực này?",
        "how_label": "Viện IRDM đồng hành như thế nào?",
        "output_label": "Đầu ra có thể bao gồm",
        "cta_primary_label": "Khám phá thêm Giải pháp",
        "cta_primary_url": "/giai-phap/",
        "cta_secondary_label": "Xem thêm tin IRDM",
        "cta_secondary_url": "/tin-tuc/",
        "is_published": True,
        "meta_title": "Sức khỏe môi trường & mô hình can thiệp phục hồi — IRDM",
        "meta_description": (
            "Kết nối môi trường sống, sức khỏe và trải nghiệm phục hồi để phát triển "
            "chương trình can thiệp phù hợp."
        ),
        "features": ["Môi trường", "Phục hồi", "Can thiệp", "Sức khỏe toàn diện"],
        "need_items": [
            (1, "Tổ chức muốn cải thiện môi trường vật lý và xã hội để hỗ trợ sức khỏe và phục hồi."),
            (2, "Cần thiết kế chương trình can thiệp tích hợp giữa môi trường, sức khỏe thể chất và tâm thần."),
            (3, "Muốn đánh giá tác động của môi trường học tập / làm việc đến sức khỏe và hiệu suất."),
        ],
        "how_steps": [
            ("Đánh giá môi trường và các yếu tố tác động đến sức khỏe toàn diện", "magnifying-glass"),
            ("Thiết kế mô hình can thiệp phục hồi tích hợp phù hợp với bối cảnh", "light-bulb"),
            ("Triển khai chương trình và xây dựng năng lực nội bộ cho tổ chức", "users"),
            ("Theo dõi, đánh giá và cải tiến mô hình can thiệp", "arrow-trending-up"),
        ],
        "outputs": [
            (1, "Báo cáo đánh giá môi trường và các yếu tố tác động đến sức khỏe"),
            (2, "Mô hình can thiệp phục hồi tích hợp và kế hoạch triển khai"),
            (3, "Bộ tài liệu hướng dẫn và công cụ đánh giá cho tổ chức"),
            (4, "Khuyến nghị cải thiện môi trường vật lý và xã hội"),
        ],
        "case_studies": [
            {
                "number": 1,
                "category_label": "Bệnh viện & Môi trường",
                "title": "Mô hình môi trường hỗ trợ phục hồi bệnh nhân tại bệnh viện",
                "description": (
                    "Viện IRDM đồng hành với bệnh viện đánh giá các yếu tố môi trường ảnh hưởng đến "
                    "trải nghiệm và kết quả phục hồi của bệnh nhân, từ đó đề xuất các can thiệp tích hợp "
                    "nhằm cải thiện môi trường vật lý, hỗ trợ tâm lý và tăng cường wellbeing cho cả "
                    "bệnh nhân và nhân viên y tế."
                ),
                "cta_primary_label": "Khám phá thêm Giải pháp",
                "cta_primary_url": "/giai-phap/",
                "cta_secondary_label": "Xem thêm tin IRDM",
                "cta_secondary_url": "/tin-tuc/",
                "tags": ["Môi trường", "Phục hồi", "Bệnh viện"],
            },
        ],
    },
]


class Command(BaseCommand):
    help = "Seed the Capability module with demonstration data from the approved Figma PDF."

    def handle(self, *args, **options) -> None:
        self.stdout.write(self.style.MIGRATE_HEADING("Seeding Capability module..."))

        # ── Listing Page ──────────────────────────────────────────────────────
        listing_page, created = CapabilityListingPage.objects.update_or_create(
            heading=LISTING_PAGE["heading"],
            defaults={k: v for k, v in LISTING_PAGE.items() if k != "heading"},
        )
        status = "Created" if created else "Updated"
        self.stdout.write(f"  {status} listing page: {listing_page.heading}")

        # ── Capabilities ──────────────────────────────────────────────────────
        for cap_data in CAPABILITIES:
            slug = cap_data["slug"]

            # Build fields for Capability (excluding related data)
            cap_fields = {
                k: v for k, v in cap_data.items()
                if k not in ("features", "need_items", "how_steps", "outputs", "case_studies")
            }

            capability, created = Capability.objects.update_or_create(
                slug=slug,
                defaults=cap_fields,
            )
            status = "Created" if created else "Updated"
            self.stdout.write(f"  {status} capability: {capability.title}")

            # ── Features ──────────────────────────────────────────────────────
            # Clear and re-create to maintain order
            capability.features.filter(is_active=True).delete()
            for order, label in enumerate(cap_data.get("features", []), start=1):
                CapabilityFeature.objects.create(
                    capability=capability,
                    label=label,
                    display_order=order,
                    is_active=True,
                )

            # ── Need Items ────────────────────────────────────────────────────
            capability.need_items.filter(is_active=True).delete()
            for number, content in cap_data.get("need_items", []):
                CapabilityNeedItem.objects.create(
                    capability=capability,
                    number=number,
                    content=content,
                    display_order=number,
                    is_active=True,
                )

            # ── How Steps ─────────────────────────────────────────────────────
            capability.how_steps.filter(is_active=True).delete()
            for order, (title, icon) in enumerate(cap_data.get("how_steps", []), start=1):
                CapabilityHowStep.objects.create(
                    capability=capability,
                    title=title,
                    icon=icon,
                    display_order=order,
                    is_active=True,
                )

            # ── Outputs ───────────────────────────────────────────────────────
            capability.outputs.filter(is_active=True).delete()
            for number, content in cap_data.get("outputs", []):
                CapabilityOutput.objects.create(
                    capability=capability,
                    number=number,
                    content=content,
                    display_order=number,
                    is_active=True,
                )

            # ── Case Studies ──────────────────────────────────────────────────
            for cs_data in cap_data.get("case_studies", []):
                case_study, cs_created = CapabilityCaseStudy.objects.update_or_create(
                    capability=capability,
                    number=cs_data["number"],
                    defaults={
                        "category_label": cs_data.get("category_label", ""),
                        "title": cs_data["title"],
                        "description": cs_data.get("description", ""),
                        "cta_primary_label": cs_data.get("cta_primary_label", ""),
                        "cta_primary_url": cs_data.get("cta_primary_url", ""),
                        "cta_secondary_label": cs_data.get("cta_secondary_label", ""),
                        "cta_secondary_url": cs_data.get("cta_secondary_url", ""),
                        "is_active": True,
                    },
                )
                # Recreate tags
                case_study.tags.filter(is_active=True).delete()
                for tag_order, tag_label in enumerate(cs_data.get("tags", []), start=1):
                    CapabilityCaseStudyTag.objects.create(
                        case_study=case_study,
                        label=tag_label,
                        display_order=tag_order,
                        is_active=True,
                    )

        # ── Summary ───────────────────────────────────────────────────────────
        total = Capability.objects.filter(is_active=True, is_published=True).count()
        self.stdout.write(
            self.style.SUCCESS(
                f"\nDone. {total} published capabilities in database."
            )
        )
