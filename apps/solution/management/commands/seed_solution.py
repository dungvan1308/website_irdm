"""
Management command: seed_solution

Populates the Solution module with demonstration data extracted from
FigmaPDF/Solution_Subpage/GiaiPhap.pdf.

Idempotent — safe to run multiple times.
"""

import io
import pathlib

from django.core.files.base import ContentFile
from django.core.management.base import BaseCommand

from apps.capability.models import Capability
from apps.solution.models import (
    Solution,
    SolutionApproachStep,
    SolutionChallenge,
    SolutionFeature,
    SolutionListingPage,
    SolutionMethodologyStep,
    SolutionOutput,
)


# ─── Listing Page ─────────────────────────────────────────────────────────────

LISTING_PAGE = {
    "section_label": "Giải pháp theo nhóm đối tác",
    "heading": "Giải pháp",
    "description": (
        "Viện IRDM đồng hành cùng cơ quan quản lý, hệ thống y tế, trường đại học, "
        "doanh nghiệp và tổ chức quốc tế trong việc chuyển hóa nghiên cứu, dữ liệu "
        "và năng lực liên ngành thành các giải pháp khoa học, công nghệ và đổi mới "
        "sáng tạo phù hợp với bối cảnh triển khai thực tế."
    ),
    "cta_primary_label": "Liên hệ hợp tác",
    "cta_primary_url": "/contact/",
    "cta_secondary_label": "Xem nhóm giải pháp",
    "cta_secondary_url": "#quicknav",
    "quicknav_heading": "Chọn nhóm đối tác phù hợp",
    "approach_label": "Hướng tiếp cận",
    "approach_heading": "Một cách tiếp cận, nhiều bối cảnh triển khai",
    "approach_description": (
        "IRDM tiếp cận mỗi nhóm đối tác từ bối cảnh riêng, bài toán ưu tiên, "
        "dữ liệu hiện có và điều kiện triển khai thực tế."
    ),
}

# ─── Approach Steps ───────────────────────────────────────────────────────────

APPROACH_STEPS = [
    (1, "Bối cảnh thực tế", "Hiểu đúng bối cảnh vận hành, nhu cầu và điều kiện triển khai của từng đối tác.", "magnifying-glass"),
    (2, "Bằng chứng & dữ liệu", "Rà soát dữ liệu, tổng hợp bằng chứng và thiết kế khung phân tích phù hợp.", "chart-bar"),
    (3, "Đồng thiết kế giải pháp", "Kết nối chuyên gia, dữ liệu và kinh nghiệm triển khai để hình thành giải pháp.", "squares-2x2"),
    (4, "Thí điểm & đánh giá", "Triển khai thí điểm trong điều kiện thực tế, theo dõi kết quả và điều chỉnh.", "beaker"),
    (5, "Chuyển giao / mở rộng", "Chuyển kết quả thành giải pháp có thể sử dụng lâu dài trong tổ chức hoặc hệ thống.", "arrow-trending-up"),
]

# ─── Solutions ────────────────────────────────────────────────────────────────

SOLUTIONS = [

    # ── 1. Cơ quan quản lý & Chính sách ──────────────────────────────────────
    {
        "slug": "co-quan-quan-ly-va-chinh-sach",
        "title": "Cơ quan quản lý & Chính sách",
        "section_label": "Giải pháp",
        "display_order": 1,
        "summary": (
            "Củng cố căn cứ khoa học, dữ liệu và cơ chế phối hợp cho các chương trình, "
            "đề án và nhiệm vụ KHCN & ĐMST."
        ),
        "description": (
            "Viện IRDM đồng hành cùng cơ quan quản lý trong việc chuyển hóa vấn đề thực tiễn, "
            "dữ liệu hiện có và ưu tiên phát triển thành căn cứ ra quyết định, đề án hành động, "
            "mô hình thí điểm và nhiệm vụ khoa học, công nghệ và đổi mới sáng tạo có khả năng triển khai."
        ),
        "challenge_label": "Các thách thức trọng tâm",
        "methodology_label": "Viện IRDM đồng hành như thế nào?",
        "output_label": "Đầu ra có thể bao gồm",
        "capability_label": "Năng lực liên quan",
        "cta_heading": "Trao đổi về bài toán chính sách",
        "cta_sub": "Sẵn sàng trao đổi?",
        "cta_primary_label": "Liên hệ trao đổi",
        "cta_primary_url": "/contact/",
        "cta_secondary_label": "Khám phá năng lực nghiên cứu & dữ liệu",
        "cta_secondary_url": "/capabilities/nghien-cuu-ung-dung-va-khoa-hoc-du-lieu/",
        "is_published": True,
        "meta_title": "Giải pháp cho Cơ quan quản lý & Chính sách — IRDM",
        "meta_description": "Củng cố căn cứ khoa học, dữ liệu và cơ chế phối hợp cho chương trình, đề án và nhiệm vụ KHCN & ĐMST.",
        "features": ["Chính sách", "Dữ liệu", "Điều hành", "KHCN & ĐMST"],
        "challenges": [
            (1, "Dữ liệu và kinh nghiệm thực tiễn chưa được chuyển hóa thành căn cứ chính sách rõ ràng."),
            (2, "Nhu cầu đặt hàng nhiệm vụ KHCN & ĐMST cần được thiết kế sát với năng lực thực thi."),
            (3, "Các bài toán chính sách ngày càng mang tính liên ngành."),
            (4, "Thiếu framework đánh giá tác động và hiệu quả chương trình sau triển khai."),
            (5, "Nhu cầu phát triển năng lực đội ngũ cho tư duy dữ liệu và phân tích chính sách."),
        ],
        "methodology_steps": [
            ("Làm rõ vấn đề ưu tiên, nhóm đối tượng liên quan, dữ liệu hiện có và khoảng trống bằng chứng.", "magnifying-glass"),
            ("Rà soát bối cảnh, tổng hợp bằng chứng, thiết kế nghiên cứu ứng dụng và phân tích dữ liệu.", "chart-bar"),
            ("Hỗ trợ xây dựng concept note, policy brief, đề án hoặc đề xuất nhiệm vụ KHCN & ĐMST.", "document-text"),
            ("Theo dõi, đánh giá và điều chỉnh theo phản hồi thực tiễn triển khai.", "arrow-trending-up"),
        ],
        "outputs": [
            (1, "Báo cáo nghiên cứu ứng dụng / phân tích bối cảnh / tổng hợp bằng chứng"),
            (2, "Policy brief, concept note, đề án hoặc khuyến nghị hành động"),
            (3, "Đề xuất nhiệm vụ KHCN & ĐMST"),
            (4, "Khung chỉ số, dashboard định hướng hoặc công cụ theo dõi"),
            (5, "Khung đánh giá nhu cầu năng lực hoặc chương trình phát triển đội ngũ"),
            (6, "Workshop, phiên tham vấn hoặc bộ công cụ chuyển hóa vấn đề quản lý thành hướng triển khai"),
        ],
        "capability_slugs": [
            "nghien-cuu-ung-dung-va-khoa-hoc-du-lieu",
            "ai-y-te-so-va-ho-tro-ra-quyet-dinh",
            "giao-duc-va-phat-trien-nang-luc",
        ],
    },

    # ── 2. Hệ thống y tế ──────────────────────────────────────────────────────
    {
        "slug": "he-thong-y-te",
        "title": "Hệ thống y tế",
        "section_label": "Giải pháp",
        "display_order": 2,
        "summary": (
            "Làm rõ bài toán ưu tiên, dữ liệu sẵn có và lộ trình thí điểm phù hợp "
            "để hỗ trợ quản trị, chất lượng dịch vụ, phát triển đội ngũ và nhiệm vụ KHCN & ĐMST."
        ),
        "description": (
            "Viện IRDM đồng hành cùng bệnh viện và các tổ chức y tế trong việc làm rõ bài toán "
            "vận hành, dữ liệu, chất lượng dịch vụ, phát triển đội ngũ và định hướng đổi mới "
            "phù hợp với điều kiện triển khai thực tế."
        ),
        "challenge_label": "Các thách thức trọng tâm",
        "methodology_label": "Viện IRDM đồng hành như thế nào?",
        "output_label": "Đầu ra có thể bao gồm",
        "capability_label": "Năng lực liên quan",
        "cta_heading": "Trao đổi về bài toán y tế",
        "cta_sub": "Sẵn sàng trao đổi?",
        "cta_primary_label": "Liên hệ trao đổi",
        "cta_primary_url": "/contact/",
        "cta_secondary_label": "Khám phá năng lực nghiên cứu & dữ liệu",
        "cta_secondary_url": "/capabilities/nghien-cuu-ung-dung-va-khoa-hoc-du-lieu/",
        "is_published": True,
        "meta_title": "Giải pháp cho Hệ thống y tế — IRDM",
        "meta_description": "Hỗ trợ bệnh viện và tổ chức y tế làm rõ bài toán dữ liệu, chất lượng dịch vụ và phát triển đội ngũ.",
        "features": ["Bệnh viện số", "Dữ liệu y tế", "Workforce", "Wellbeing", "Chuyển đổi số"],
        "challenges": [
            (1, "Dữ liệu y tế và dữ liệu vận hành còn phân tán."),
            (2, "Chưa xác định rõ bài toán ưu tiên trước khi đầu tư vào công nghệ, dashboard hoặc AI."),
            (3, "Áp lực nâng cao chất lượng dịch vụ đi cùng yêu cầu tối ưu nguồn lực."),
            (4, "Nhu cầu phát triển năng lực nhân viên y tế trong bối cảnh đổi mới."),
            (5, "Sức khỏe tâm thần và wellbeing của đội ngũ y tế là vấn đề cần được quan tâm hơn."),
        ],
        "methodology_steps": [
            ("Làm rõ điểm nghẽn ưu tiên, nguồn dữ liệu hiện có, nhu cầu cải tiến và năng lực triển khai.", "magnifying-glass"),
            ("Rà soát bối cảnh, phân tích dữ liệu, đánh giá mức độ sẵn sàng và định hình use case.", "chart-bar"),
            ("Xây dựng concept note, lộ trình thí điểm hoặc đề xuất nhiệm vụ KHCN & ĐMST.", "document-text"),
            ("Hỗ trợ kết nối bài toán thực tiễn với dữ liệu và chuyên gia phù hợp.", "users"),
            ("Thiết kế chương trình phát triển năng lực, wellbeing, giao tiếp và phối hợp nội bộ.", "light-bulb"),
        ],
        "outputs": [
            (1, "Báo cáo rà soát bối cảnh, dữ liệu và danh mục use case ưu tiên"),
            (2, "Concept note, lộ trình thí điểm hoặc đề xuất nhiệm vụ KHCN & ĐMST"),
            (3, "Khung dữ liệu, dashboard định hướng hoặc công cụ hỗ trợ quản trị"),
            (4, "Chương trình hỗ trợ sức khỏe tâm thần và phòng ngừa kiệt sức nghề nghiệp"),
            (5, "Chương trình phát triển năng lực đội ngũ"),
            (6, "Định hướng Green Hospital hoặc cải thiện môi trường chăm sóc"),
        ],
        "capability_slugs": [
            "nghien-cuu-ung-dung-va-khoa-hoc-du-lieu",
            "ai-y-te-so-va-ho-tro-ra-quyet-dinh",
            "suc-khoe-tam-than-va-wellbeing",
        ],
    },

    # ── 3. Trường đại học & Giáo dục ─────────────────────────────────────────
    {
        "slug": "truong-dai-hoc-va-giao-duc",
        "title": "Trường đại học & Giáo dục",
        "section_label": "Giải pháp",
        "display_order": 3,
        "summary": (
            "Hỗ trợ nhà trường đổi mới chương trình, phát triển người học, khai thác dữ liệu giáo dục "
            "và xây dựng môi trường học thuật lành mạnh."
        ),
        "description": (
            "Viện IRDM đồng hành cùng trường đại học và các cơ sở giáo dục trong việc kết nối dữ liệu, "
            "chương trình đào tạo, trải nghiệm người học, phát triển đội ngũ và định hướng bền vững "
            "thành các giải pháp giáo dục phù hợp với bối cảnh triển khai thực tế."
        ),
        "challenge_label": "Các thách thức trọng tâm",
        "methodology_label": "Viện IRDM đồng hành như thế nào?",
        "output_label": "Đầu ra có thể bao gồm",
        "capability_label": "Năng lực liên quan",
        "cta_heading": "Trao đổi về bài toán giáo dục",
        "cta_sub": "Sẵn sàng trao đổi?",
        "cta_primary_label": "Liên hệ trao đổi",
        "cta_primary_url": "/contact/",
        "cta_secondary_label": "Khám phá năng lực giáo dục & phát triển năng lực",
        "cta_secondary_url": "/capabilities/giao-duc-va-phat-trien-nang-luc/",
        "is_published": True,
        "meta_title": "Giải pháp cho Trường đại học & Giáo dục — IRDM",
        "meta_description": "Hỗ trợ đổi mới chương trình, phát triển người học và xây dựng môi trường học thuật lành mạnh.",
        "features": ["Giáo dục", "Người học", "E-Learning", "Green University"],
        "challenges": [
            (1, "Chất lượng đào tạo cần nâng cao theo hướng thực tiễn, liên ngành và gắn với nhu cầu xã hội."),
            (2, "Dữ liệu về người học và chương trình đào tạo chưa được khai thác đầy đủ."),
            (3, "Nhu cầu phát triển năng lực cho sinh viên, giảng viên và đội ngũ quản lý ngày càng đa dạng."),
            (4, "Sức khỏe tâm thần và wellbeing của người học ngày càng được chú trọng."),
            (5, "Yêu cầu tích hợp định hướng ESG và phát triển bền vững vào hoạt động nhà trường."),
        ],
        "methodology_steps": [
            ("Làm rõ nhu cầu người học và điểm nghẽn trong chương trình đào tạo.", "magnifying-glass"),
            ("Khảo sát, nghiên cứu nhu cầu, phân tích dữ liệu và đánh giá trải nghiệm người học.", "chart-bar"),
            ("Đồng thiết kế chương trình phát triển năng lực, E-Learning, microlearning hoặc mô hình hỗ trợ sinh viên.", "light-bulb"),
            ("Định hình bài toán dữ liệu, dashboard hoặc lộ trình thí điểm công cụ số.", "document-text"),
            ("Thiết kế sáng kiến wellbeing, môi trường học thuật và định hướng Green University / ESG.", "arrow-trending-up"),
        ],
        "outputs": [
            (1, "Báo cáo khảo sát nhu cầu hoặc đánh giá trải nghiệm người học"),
            (2, "Khung chương trình kỹ năng nghề nghiệp, phát triển cá nhân và định hướng nghề nghiệp"),
            (3, "Nội dung E-Learning, microlearning, tập huấn hoặc bộ học liệu"),
            (4, "Khung dữ liệu, dashboard định hướng hoặc bộ chỉ số theo dõi"),
            (5, "Sáng kiến hỗ trợ sức khỏe tâm thần và cải thiện môi trường học thuật"),
            (6, "Định hướng Green University, ESG hoặc phát triển bền vững"),
        ],
        "capability_slugs": [
            "giao-duc-va-phat-trien-nang-luc",
            "nghien-cuu-ung-dung-va-khoa-hoc-du-lieu",
            "esg-green-university-va-green-hospital",
        ],
    },

    # ── 4. Doanh nghiệp ───────────────────────────────────────────────────────
    {
        "slug": "doanh-nghiep",
        "title": "Doanh nghiệp",
        "section_label": "Giải pháp",
        "display_order": 4,
        "summary": (
            "Thiết kế các sáng kiến phát triển con người, năng lực làm việc, văn hóa phối hợp "
            "và trách nhiệm xã hội gắn với mục tiêu tổ chức."
        ),
        "description": (
            "Viện IRDM đồng hành cùng doanh nghiệp trong các nội dung phù hợp với định hướng "
            "hoạt động của Viện, đặc biệt là phát triển năng lực đội ngũ, khai thác dữ liệu tổ chức, "
            "xây dựng môi trường làm việc lành mạnh và tích hợp yếu tố con người vào phát triển bền vững."
        ),
        "challenge_label": "Các thách thức trọng tâm",
        "methodology_label": "Viện IRDM đồng hành như thế nào?",
        "output_label": "Đầu ra có thể bao gồm",
        "capability_label": "Năng lực liên quan",
        "cta_heading": "Trao đổi về bài toán doanh nghiệp",
        "cta_sub": "Sẵn sàng trao đổi?",
        "cta_primary_label": "Liên hệ trao đổi",
        "cta_primary_url": "/contact/",
        "cta_secondary_label": "Khám phá năng lực phát triển năng lực",
        "cta_secondary_url": "/capabilities/giao-duc-va-phat-trien-nang-luc/",
        "is_published": True,
        "meta_title": "Giải pháp cho Doanh nghiệp — IRDM",
        "meta_description": "Phát triển năng lực đội ngũ, wellbeing và chuyển đổi lấy con người làm trung tâm cho doanh nghiệp.",
        "features": ["Lãnh đạo", "Hiệu quả đội nhóm", "Wellbeing", "ESG"],
        "challenges": [
            (1, "Năng lực đội ngũ cần được cập nhật để đáp ứng yêu cầu công việc ngày càng phức hợp."),
            (2, "Nhiều chương trình đào tạo chưa gắn đủ chặt với hành vi làm việc và mục tiêu phát triển tổ chức."),
            (3, "Nhu cầu phát triển lãnh đạo, giao tiếp và phối hợp nội bộ ngày càng rõ."),
            (4, "Áp lực wellbeing và sức khỏe tâm thần tại nơi làm việc ngày càng tăng."),
            (5, "Yêu cầu tích hợp ESG và trách nhiệm xã hội vào chiến lược kinh doanh."),
        ],
        "methodology_steps": [
            ("Làm rõ nhóm năng lực ưu tiên, hành vi cần cải thiện và điểm nghẽn phối hợp nội bộ.", "magnifying-glass"),
            ("Khảo sát nhu cầu, phân tích khoảng trống năng lực và thiết kế chương trình đào tạo.", "chart-bar"),
            ("Phát triển nội dung về lãnh đạo, giao tiếp, phối hợp, quản trị cảm xúc và tư duy dữ liệu.", "light-bulb"),
            ("Đánh giá nhu cầu wellbeing, văn hóa tổ chức hoặc ESG lấy con người làm trung tâm.", "users"),
            ("Thiết kế sáng kiến hỗ trợ đội ngũ và phát triển năng lực phục hồi.", "arrow-trending-up"),
        ],
        "outputs": [
            (1, "Báo cáo khảo sát nhu cầu năng lực và phân tích văn hóa tổ chức"),
            (2, "Chương trình đào tạo, tập huấn hoặc lộ trình phát triển năng lực"),
            (3, "Nội dung E-Learning, microlearning hoặc bộ học liệu ứng dụng"),
            (4, "Chương trình wellbeing và hỗ trợ sức khỏe tâm thần tại nơi làm việc"),
            (5, "Lộ trình ESG hoặc sáng kiến phát triển bền vững lấy con người làm trung tâm"),
        ],
        "capability_slugs": [
            "giao-duc-va-phat-trien-nang-luc",
            "suc-khoe-tam-than-va-wellbeing",
            "esg-green-university-va-green-hospital",
        ],
    },

    # ── 5. Tổ chức quốc tế & NGO ─────────────────────────────────────────────
    {
        "slug": "to-chuc-quoc-te-va-ngo",
        "title": "Tổ chức quốc tế & NGO",
        "section_label": "Giải pháp",
        "display_order": 5,
        "summary": (
            "Kết nối tri thức quốc tế với bối cảnh Việt Nam để thiết kế, triển khai và đánh giá "
            "các sáng kiến liên ngành có khả năng duy trì."
        ),
        "description": (
            "Viện IRDM đồng hành cùng tổ chức quốc tế và NGO trong việc điều phối nghiên cứu, "
            "thiết kế và đánh giá các chương trình can thiệp phù hợp bối cảnh địa phương, "
            "kết nối bằng chứng toàn cầu với thực tiễn triển khai tại Việt Nam."
        ),
        "challenge_label": "Các thách thức trọng tâm",
        "methodology_label": "Viện IRDM đồng hành như thế nào?",
        "output_label": "Đầu ra có thể bao gồm",
        "capability_label": "Năng lực liên quan",
        "cta_heading": "Trao đổi về hợp tác quốc tế",
        "cta_sub": "Sẵn sàng trao đổi?",
        "cta_primary_label": "Liên hệ trao đổi",
        "cta_primary_url": "/contact/",
        "cta_secondary_label": "Khám phá năng lực nghiên cứu & dữ liệu",
        "cta_secondary_url": "/capabilities/nghien-cuu-ung-dung-va-khoa-hoc-du-lieu/",
        "is_published": True,
        "meta_title": "Giải pháp cho Tổ chức quốc tế & NGO — IRDM",
        "meta_description": "Kết nối tri thức quốc tế với bối cảnh Việt Nam cho các sáng kiến liên ngành có khả năng duy trì.",
        "features": ["Bối cảnh địa phương", "Nghiên cứu", "Đồng thiết kế", "Triển khai"],
        "challenges": [
            (1, "Khoảng cách giữa bằng chứng toàn cầu và bối cảnh triển khai địa phương."),
            (2, "Cần đối tác hiểu hệ thống địa phương để đồng thiết kế và triển khai chương trình."),
            (3, "Yêu cầu đánh giá tác động và chứng minh tính hiệu quả theo chuẩn quốc tế."),
            (4, "Nhu cầu xây dựng năng lực địa phương bền vững sau khi dự án kết thúc."),
        ],
        "methodology_steps": [
            ("Tìm hiểu bối cảnh địa phương, xác định đối tác chiến lược và đánh giá nhu cầu.", "magnifying-glass"),
            ("Tổng hợp bằng chứng quốc tế và điều chỉnh theo bối cảnh Việt Nam.", "chart-bar"),
            ("Đồng thiết kế chương trình can thiệp với các bên liên quan địa phương.", "light-bulb"),
            ("Triển khai thí điểm, theo dõi và đánh giá theo khung M&E.", "beaker"),
            ("Xây dựng năng lực địa phương và hỗ trợ nhân rộng hoặc chuyển giao.", "arrow-trending-up"),
        ],
        "outputs": [
            (1, "Báo cáo đánh giá nhu cầu và phân tích bối cảnh địa phương"),
            (2, "Thiết kế chương trình can thiệp và khung M&E"),
            (3, "Tài liệu tập huấn và hỗ trợ triển khai cho đối tác địa phương"),
            (4, "Báo cáo đánh giá tác động theo chuẩn quốc tế"),
            (5, "Lộ trình nhân rộng và khuyến nghị chuyển giao"),
        ],
        "capability_slugs": [
            "nghien-cuu-ung-dung-va-khoa-hoc-du-lieu",
            "pho-bien-tri-thuc-va-truyen-thong-cong-dong",
            "suc-khoe-moi-truong-va-mo-hinh-can-thiep-phuc-hoi",
        ],
    },
]


# ─── Demo image colour map ─────────────────────────────────────────────────────
#
# Each entry: slug → (top_colour_rgb, bottom_colour_rgb, label_text)
# These match the primary brand palette (primary-900 / primary-800) with a
# distinct accent per audience segment.

DEMO_IMAGE_MAP = {
    "__listing__": (
        (10, 30, 70), (15, 50, 120), "GIẢI PHÁP",
    ),
    "co-quan-quan-ly-va-chinh-sach": (
        (15, 40, 100), (25, 65, 150), "Cơ quan\nquản lý",
    ),
    "he-thong-y-te": (
        (10, 70, 80), (15, 110, 130), "Hệ thống\ny tế",
    ),
    "truong-dai-hoc-va-giao-duc": (
        (50, 30, 110), (80, 50, 160), "Trường\nĐại học",
    ),
    "doanh-nghiep": (
        (90, 40, 10), (140, 70, 20), "Doanh\nnghiệp",
    ),
    "to-chuc-quoc-te-va-ngo": (
        (10, 60, 50), (20, 90, 80), "Tổ chức\nQuốc tế",
    ),
}


def _make_gradient_png(
    top_rgb: tuple,
    bottom_rgb: tuple,
    width: int = 1200,
    height: int = 675,
) -> bytes:
    """Generate a vertical-gradient PNG using Pillow. Returns raw bytes."""
    from PIL import Image

    img = Image.new("RGB", (width, height))
    pixels = img.load()
    r0, g0, b0 = top_rgb
    r1, g1, b1 = bottom_rgb
    for y in range(height):
        t = y / (height - 1)
        r = int(r0 + (r1 - r0) * t)
        g = int(g0 + (g1 - g0) * t)
        b = int(b0 + (b1 - b0) * t)
        for x in range(width):
            pixels[x, y] = (r, g, b)

    buf = io.BytesIO()
    img.save(buf, format="PNG", optimize=True)
    return buf.getvalue()


def _assign_image(instance, field_name: str, filename: str, png_bytes: bytes, stdout) -> None:
    """Assign a generated PNG to an ImageField only if the field is empty."""
    field = getattr(instance, field_name)
    if field:
        stdout.write(f"    {field_name}: already set, skipping")
        return
    content = ContentFile(png_bytes, name=filename)
    field.save(filename, content, save=True)
    stdout.write(f"    {field_name}: saved demo image → {filename}")


def _assign_from_file(instance, field_name: str, src: "pathlib.Path", filename: str, stdout) -> None:
    """Assign an ImageField from a pre-extracted file only if the field is empty."""
    field = getattr(instance, field_name)
    if field:
        stdout.write(f"    {field_name}: already set, skipping")
        return
    if not src.exists():
        stdout.write(f"    {field_name}: source not found {src}, skipping")
        return
    content = ContentFile(src.read_bytes(), name=filename)
    field.save(filename, content, save=True)
    stdout.write(f"    {field_name}: saved → {filename}")


class Command(BaseCommand):
    help = "Seed the Solution module with demonstration data from GiaiPhap.pdf."

    def handle(self, *args, **options) -> None:
        from django.conf import settings
        self.stdout.write(self.style.MIGRATE_HEADING("Seeding Solution module..."))

        MEDIA = settings.MEDIA_ROOT

        # ── Listing Page ──────────────────────────────────────────────────────
        listing_page, created = SolutionListingPage.objects.update_or_create(
            heading=LISTING_PAGE["heading"],
            defaults={k: v for k, v in LISTING_PAGE.items() if k != "heading"},
        )
        self.stdout.write(f"  {'Created' if created else 'Updated'} listing page: {listing_page.heading}")

        # Listing hero: prefer Figma-extracted illustration; fall back to gradient
        if not listing_page.hero_image:
            figma_src = MEDIA / "solution" / "listing" / "hero-illustration.png"
            if figma_src.exists():
                _assign_from_file(listing_page, "hero_image", figma_src, "solution-listing-hero-illustration.png", self.stdout)
            else:
                info = DEMO_IMAGE_MAP["__listing__"]
                png = _make_gradient_png(info[0], info[1])
                _assign_image(listing_page, "hero_image", "solution-listing-hero.png", png, self.stdout)

        # ── Approach Steps ────────────────────────────────────────────────────
        for number, title, description, icon in APPROACH_STEPS:
            step, created = SolutionApproachStep.objects.update_or_create(
                number=number,
                defaults={"title": title, "description": description, "icon": icon, "is_active": True, "display_order": number},
            )
            self.stdout.write(f"  {'Created' if created else 'Updated'} approach step {number:02d}: {title}")

        # ── Solutions ─────────────────────────────────────────────────────────
        for _sol_data in SOLUTIONS:
            # Shallow copy to avoid mutating the module-level SOLUTIONS constant
            sol_data = {**_sol_data}
            slug = sol_data["slug"]
            capability_slugs = sol_data.pop("capability_slugs", [])
            features = sol_data.pop("features", [])
            challenges = sol_data.pop("challenges", [])
            methodology_steps = sol_data.pop("methodology_steps", [])
            outputs = sol_data.pop("outputs", [])

            solution, created = Solution.objects.update_or_create(
                slug=slug,
                defaults=sol_data,
            )
            self.stdout.write(f"  {'Created' if created else 'Updated'} solution: {solution.title}")

            # Seed images: prefer Figma-extracted assets; fall back to gradient
            img_info = DEMO_IMAGE_MAP.get(slug)
            figma_thumb = MEDIA / "solution" / "thumbnails" / f"solution-thumb-{slug}.png"
            figma_hero  = MEDIA / "solution" / "hero"       / f"solution-hero-{slug}.png"

            if figma_thumb.exists():
                _assign_from_file(solution, "thumbnail", figma_thumb, f"solution-thumb-{slug}.png", self.stdout)
            elif img_info:
                png = _make_gradient_png(img_info[0], img_info[1])
                _assign_image(solution, "thumbnail", f"solution-thumb-{slug}.png", png, self.stdout)

            if figma_hero.exists():
                _assign_from_file(solution, "hero_image", figma_hero, f"solution-hero-{slug}.png", self.stdout)
            elif img_info:
                png = _make_gradient_png(img_info[0], img_info[1])
                _assign_image(solution, "hero_image", f"solution-hero-{slug}.png", png, self.stdout)

            # cta_image: reuse the same photo as hero_image (fallback to gradient)
            # CMS editors can replace this with a different image via Django Admin
            figma_cta = MEDIA / "solution" / "hero" / f"solution-hero-{slug}.png"
            if figma_cta.exists():
                _assign_from_file(solution, "cta_image", figma_cta, f"solution-cta-{slug}.png", self.stdout)
            elif img_info:
                png = _make_gradient_png(img_info[0], img_info[1])
                _assign_image(solution, "cta_image", f"solution-cta-{slug}.png", png, self.stdout)

            # Features
            solution.features.filter(is_active=True).delete()
            for order, label in enumerate(features, start=1):
                SolutionFeature.objects.create(solution=solution, label=label, display_order=order, is_active=True)

            # Challenges
            solution.challenges.filter(is_active=True).delete()
            for number, content in challenges:
                SolutionChallenge.objects.create(solution=solution, number=number, content=content, display_order=number, is_active=True)

            # Methodology Steps
            solution.methodology_steps.filter(is_active=True).delete()
            for order, (title, icon) in enumerate(methodology_steps, start=1):
                SolutionMethodologyStep.objects.create(
                    solution=solution, title=title, description="", icon=icon,
                    display_order=order, is_active=True,
                )

            # Outputs — create then generate demo images
            solution.outputs.filter(is_active=True).delete()
            for number, content in outputs:
                SolutionOutput.objects.create(
                    solution=solution, number=number, content=content,
                    display_order=number, is_active=True,
                )

            # Output images — slightly varied gradient per output number
            if img_info:
                for output_obj in solution.outputs.filter(is_active=True).order_by("number"):
                    if not output_obj.image:
                        r0, g0, b0 = img_info[0]
                        r1, g1, b1 = img_info[1]
                        shift = (output_obj.number - 1) * 8
                        top = (min(r0 + shift, 220), min(g0 + shift, 220), min(b0 + shift, 220))
                        bot = (min(r1 + shift, 220), min(g1 + shift, 220), min(b1 + shift, 220))
                        png = _make_gradient_png(top, bot, width=800, height=500)
                        filename = f"solution-output-{slug}-{output_obj.number:02d}.png"
                        _assign_image(output_obj, "image", filename, png, self.stdout)

            # Related Capabilities
            solution.related_capabilities.clear()
            for cap_slug in capability_slugs:
                try:
                    cap = Capability.objects.get(slug=cap_slug, is_active=True)
                    solution.related_capabilities.add(cap)
                except Capability.DoesNotExist:
                    self.stdout.write(self.style.WARNING(f"    Capability not found: {cap_slug}"))

        total = Solution.objects.filter(is_active=True, is_published=True).count()
        self.stdout.write(self.style.SUCCESS(f"\nDone. {total} published solutions in database."))

