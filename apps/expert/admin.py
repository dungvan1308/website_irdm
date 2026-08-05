"""Django admin registrations for the Expert module."""

from django.contrib import admin
from django.utils.translation import gettext_lazy as _

from .models import (
    Association,
    EngagementType,
    Expert,
    ExpertGroup,
    ExpertListingPage,
    InfoGroup,
    InfoGroupBlock,
    InfoGroupMember,
    KnowledgeTopic,
    OrgNode,
    ProcessStep,
    ResearchArea,
)


# ─── Inlines ──────────────────────────────────────────────────────────────────

class ProcessStepInline(admin.TabularInline):
    model = ProcessStep
    extra = 1
    fields = ("step_number", "title", "icon", "description", "display_order", "is_active")


# ─── Admin registrations ──────────────────────────────────────────────────────

@admin.register(ExpertListingPage)
class ExpertListingPageAdmin(admin.ModelAdmin):
    list_display = ("hero_heading", "is_active")
    fieldsets = (
        (_("Hero Badge"), {
            "fields": (
                "hero_badge_text", "hero_badge_icon", "hero_badge_color", "hero_badge_show",
            ),
            "description": _("Badge label nhỏ phía trên tiêu đề hero (e.g. ĐỘI NGŨ CHUYÊN GIA)"),
        }),
        (_("Hero Content"), {
            "fields": (
                "hero_heading", "hero_description", "hero_image",
            ),
            "description": _("Tiêu đề hỗ trợ xuống dòng: nhập Enter (\\n) giữa các dòng muốn ngắt."),
        }),
        (_("Hero Buttons"), {
            "fields": (
                "hero_btn1_label", "hero_btn1_url", "hero_btn1_icon", "hero_btn1_target",
                "hero_btn2_label", "hero_btn2_url", "hero_btn2_icon", "hero_btn2_target",
            ),
        }),
        (_("Hero Bottom Badge"), {
            "fields": (
                "hero_bottom_badge_text",
                "hero_bottom_badge_logo", "hero_bottom_badge_icon",
                "hero_bottom_badge_bg", "hero_bottom_badge_show",
            ),
            "description": _("Badge nhỏ hiển thị ngay bên dưới CTA buttons (e.g. ĐÚNG CHUYÊN MÔN CHO ĐÚNG BÀI TOÁN)"),
        }),
        (_("Process Section"), {
            "fields": ("process_section_label", "process_heading", "process_description"),
        }),
        (_("Senior Experts Section"), {
            "fields": (
                "senior_section_label", "senior_heading", "senior_description",
                "senior_cta_label", "senior_cta_url",
            ),
        }),
        (_("Research Area Map Section"), {
            "fields": (
                "map_section_label", "map_heading", "map_description",
                "map_cta1_label", "map_cta1_url",
                "map_cta2_label", "map_cta2_url",
            ),
        }),
        (_("Expert Directory Section"), {
            "fields": ("directory_section_label", "directory_heading", "directory_description"),
            "description": _("Tiêu đề, mô tả hiển thị trước thanh tìm kiếm."),
        }),
        (_("Knowledge Topics Section"), {
            "fields": ("topic_heading", "topic_description"),
        }),
        (_("Info Groups Section (CÁC NHÓM THÔNG TIN CHUYÊN MÔN)"), {
            "fields": (
                "info_group_section_label",
                "info_group_section_heading",
                "info_group_section_description",
            ),
            "description": _(
                "Tiêu đề/mô tả section 'CÁC NHÓM THÔNG TIN CHUYÊN MÔN'. "
                "Quản lý từng nhóm (Cơ cấu tổ chức, Hội đồng KH, …) trong mục 'Nhóm thông tin' bên trái."
            ),
        }),
        (_("CTA Section"), {
            "fields": (
                "cta_eyebrow", "cta_heading", "cta_description", "cta_bg_image",
                "cta_btn1_label", "cta_btn1_url",
                "cta_btn2_label", "cta_btn2_url",
            ),
        }),
        (_("SEO"), {
            "fields": ("meta_title", "meta_description"),
            "classes": ("collapse",),
        }),
        (_("Status"), {
            "fields": ("is_active", "display_order"),
        }),
    )


@admin.register(ExpertGroup)
class ExpertGroupAdmin(admin.ModelAdmin):
    list_display = ("name", "slug", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    prepopulated_fields = {"slug": ("name",)}
    search_fields = ("name",)


@admin.register(EngagementType)
class EngagementTypeAdmin(admin.ModelAdmin):
    list_display = ("name", "slug", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    prepopulated_fields = {"slug": ("name",)}
    search_fields = ("name",)


@admin.register(ResearchArea)
class ResearchAreaAdmin(admin.ModelAdmin):
    list_display = ("name", "slug", "icon", "color", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    prepopulated_fields = {"slug": ("name",)}
    search_fields = ("name",)
    fieldsets = (
        (None, {
            "fields": ("name", "slug", "icon", "card_icon", "color"),
        }),
        (_("Card Content"), {
            "fields": ("description", "card_tags", "card_cta_label", "card_cta_url"),
            "description": _("Nội dung hiển thị trong card bản đồ chuyên môn."),
        }),
        (_("Status"), {
            "fields": ("is_active", "display_order"),
        }),
    )


@admin.register(ProcessStep)
class ProcessStepAdmin(admin.ModelAdmin):
    list_display = ("step_number", "title", "icon", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    ordering = ("step_number",)


@admin.register(KnowledgeTopic)
class KnowledgeTopicAdmin(admin.ModelAdmin):
    list_display = ("name", "slug", "icon", "color", "cta_label", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    prepopulated_fields = {"slug": ("name",)}
    search_fields = ("name",)
    fieldsets = (
        (_("Thông tin chủ đề"), {
            "fields": ("name", "slug", "description"),
        }),
        (_("Giao diện"), {
            "fields": ("icon", "color"),
            "description": _("Cấu hình icon và màu accent cho accordion. Để trống dùng mặc định."),
        }),
        (_("CTA (tùy chọn)"), {
            "fields": ("cta_label", "cta_url"),
            "description": _("Nút 'Xem thêm' bên dưới danh sách chuyên gia trong accordion. Để trống để ẩn."),
            "classes": ("collapse",),
        }),
        (_("Trạng thái"), {
            "fields": ("is_active", "display_order"),
        }),
    )


@admin.register(InfoGroup)
class InfoGroupAdmin(admin.ModelAdmin):
    list_display = ("name", "slug", "icon", "show_expert_grid", "expert_grid_flat", "show_association_grid", "display_order", "is_active")
    list_editable = ("show_expert_grid", "expert_grid_flat", "show_association_grid", "display_order", "is_active")
    prepopulated_fields = {"slug": ("name",)}
    search_fields = ("name",)
    filter_horizontal = ("expert_research_areas", "expert_direct_members")
    fieldsets = (
        (_("Thông tin nhóm"), {
            "fields": ("name", "slug"),
        }),
        (_("Header Accordion"), {
            "fields": ("icon", "icon_bg_color", "header_description"),
            "description": _(
                "Icon hình vuông bo góc + tiêu đề + mô tả ngắn hiển thị trong phần đầu accordion."
            ),
        }),
        (_("Body — Phần mở rộng (Sơ đồ / Khối mô tả)"), {
            "fields": ("section_label", "section_heading", "section_description"),
            "description": _(
                "Dùng khi KHÔNG bật 'Hiển thị lưới chuyên gia'. "
                "Sơ đồ tổ chức quản lý qua 'Các nút sơ đồ' (OrgNode) bên dưới. "
                "Khối mô tả quản lý qua 'Khối mô tả' (InfoGroupBlock) bên dưới."
            ),
        }),
        (_("Lưới chuyên gia — Nhóm theo lĩnh vực (Nhà khoa học & Chuyên gia)"), {
            "fields": ("show_expert_grid", "expert_research_areas", "expert_grid_cta_label"),
            "description": _(
                "Bật 'Hiển thị lưới chuyên gia' để accordion hiển thị chuyên gia nhóm theo lĩnh vực chuyên môn. "
                "Chọn các Lĩnh vực chuyên môn (ResearchArea) muốn hiển thị — thứ tự theo 'display_order' của từng lĩnh vực. "
                "Chuyên gia thuộc lĩnh vực đó sẽ tự động hiển thị (is_published=True)."
            ),
        }),
        (_("Lưới chuyên gia — Phẳng (Giảng viên & Chuyên gia học tập ứng dụng)"), {
            "fields": ("expert_grid_flat", "expert_direct_members"),
            "description": _(
                "Bật 'Flat expert grid' (cùng với 'show expert grid') để hiển thị danh sách chuyên gia dạng lưới phẳng "
                "không tách nhóm theo lĩnh vực. Chọn trực tiếp từng chuyên gia trong 'Direct expert members'. "
                "Thứ tự hiển thị theo 'display_order' của từng chuyên gia."
            ),
        }),
        (_("Lưới Hiệp hội & Mạng lưới chuyên môn"), {
            "fields": ("show_association_grid",),
            "description": _(
                "Bật 'Show association grid' để hiển thị lưới 2 cột các thẻ Hiệp hội/Mạng lưới. "
                "Thêm/sửa từng Hiệp hội trong phần 'Hiệp hội / Mạng lưới' (inline bên dưới khi lưu)."
            ),
        }),
        (_("Trạng thái"), {
            "fields": ("is_active", "display_order"),
        }),
    )


class OrgNodeInline(admin.TabularInline):
    model = OrgNode
    extra = 1
    fields = ("name", "level", "style", "parent", "color", "url", "display_order", "is_active")
    ordering = ("level", "display_order")
    verbose_name = "Nút sơ đồ tổ chức"
    verbose_name_plural = "Các nút sơ đồ tổ chức"


class InfoGroupBlockInline(admin.StackedInline):
    model = InfoGroupBlock
    extra = 0
    fields = ("title", "function_label", "function_text", "duties_label", "duties", "icon", "display_order", "is_active")
    verbose_name = "Khối mô tả"
    verbose_name_plural = "Các khối mô tả"


class InfoGroupMemberInline(admin.StackedInline):
    model = InfoGroupMember
    extra = 0
    fields = (
        "role_label", "academic_title", "name", "position",
        "email", "avatar", "cta_text", "cta_url", "display_order", "is_active",
    )
    verbose_name = "Thành viên Hội đồng"
    verbose_name_plural = "Danh sách thành viên Hội đồng"


class AssociationInline(admin.StackedInline):
    model = Association
    extra = 0
    fields = (
        "title", "badge_label", "badge_color",
        "logo", "icon", "icon_bg_color",
        "description",
        "cta_label", "cta_url", "cta_target",
        "display_order", "is_active",
    )
    verbose_name = "Hiệp hội / Mạng lưới"
    verbose_name_plural = "Danh sách Hiệp hội / Mạng lưới"


InfoGroupAdmin.inlines = [OrgNodeInline, InfoGroupBlockInline, InfoGroupMemberInline, AssociationInline]


@admin.register(Expert)
class ExpertAdmin(admin.ModelAdmin):
    list_display = (
        "display_name", "group", "organization",
        "is_senior", "is_featured", "is_published", "display_order", "is_active",
    )
    list_editable = ("is_senior", "is_featured", "is_published", "display_order", "is_active")
    list_filter = ("group", "is_senior", "is_featured", "is_published", "research_areas")
    search_fields = ("name", "position", "organization")
    prepopulated_fields = {"slug": ("name",)}
    filter_horizontal = ("research_areas", "knowledge_topics", "engagement_types")
    fieldsets = (
        (_("Identity"), {
            "fields": ("name", "slug", "academic_title", "position", "organization"),
        }),
        (_("Media"), {
            "fields": ("avatar", "hero_avatar"),
            "description": _(
                "avatar: Ảnh dùng cho listing card và fallback hero. | "
                "hero_avatar: Ảnh riêng cho Hero Section trang hồ sơ — ưu tiên hơn avatar khi upload."
            ),
        }),
        (_("Content"), {
            "fields": ("short_bio", "profile_tagline", "full_bio"),
            "description": _(
                "short_bio: 1–3 câu hiển thị trên listing card. | "
                "profile_tagline: Mô tả riêng cho trang Hồ sơ chuyên gia (để trống → dùng short_bio). | "
                "full_bio: Tiểu sử đầy đủ trên trang detail."
            ),
        }),
        (_("Contact"), {
            "fields": ("email", "profile_url"),
        }),
        (_("TRANG HỒ SƠ — Hero"), {
            "fields": ("hero_tagline", "role_badges", "ticker_text", "contact_cta_url", "hero_cta_label"),
            "classes": ("collapse",),
            "description": _(
                "hero_tagline: Tagline in đậm dưới tên. | "
                "role_badges: Mỗi dòng 1 badge vai trò — dòng đầu tiên hiển thị badge trên hero. | "
                "ticker_text: Văn bản chạy ngang dưới hero (dùng ❖ để phân tách keyword). | "
                "contact_cta_url: URL nút CTA trên hero. | "
                "hero_cta_label: Nhãn nút CTA (để trống → 'Liên hệ hợp tác')."
            ),
        }),
        (_("TRANG HỒ SƠ — Thống kê (Stats)"), {
            "fields": (
                ("stat_1_value", "stat_1_label"),
                ("stat_2_value", "stat_2_label"),
                ("stat_3_value", "stat_3_label"),
            ),
            "classes": ("collapse",),
            "description": _("3 chỉ số nổi bật hiển thị dưới hero, e.g. 40+ / Năm kinh nghiệm."),
        }),
        (_("TRANG HỒ SƠ — Nội dung chuyên sâu"), {
            "fields": ("experience_highlights", "discussion_topics", "notable_projects"),
            "classes": ("collapse",),
            "description": _(
                "experience_highlights: Mỗi dòng 1 kinh nghiệm nổi bật (tự đánh số). | "
                "discussion_topics: Mỗi dòng 1 chủ đề đồng hành (hiển thị 2 cột). | "
                "notable_projects: Mỗi dòng 1 công trình/dự án tiêu biểu."
            ),
        }),
        (_("VAI TRÒ"), {
            "fields": ("group",),
            "description": _("Nhóm vai trò hiển thị ở bộ lọc THEO VAI TRÒ trên trang chuyên gia."),
        }),
        (_("LĨNH VỰC CHUYÊN MÔN"), {
            "fields": ("research_areas", "card_specialty"),
            "description": _(
                "research_areas: Dùng cho bộ lọc THEO LĨNH VỰC CHUYÊN MÔN. | "
                "card_specialty: Nhãn nổi bật tùy chỉnh trên card (e.g. 'Giáo dục & phát triển năng lực'). "
                "Để trống → dùng Research Area đầu tiên."
            ),
        }),
        (_("HÌNH THỨC ĐỒNG HÀNH"), {
            "fields": ("engagement_types",),
            "description": _("Dùng cho bộ lọc THEO HÌNH THỨC ĐỒNG HÀNH trên trang chuyên gia."),
        }),
        (_("CHỦ ĐỀ THÔNG TIN"), {
            "fields": ("knowledge_topics",),
        }),
        (_("Status"), {
            "fields": ("is_published", "is_featured", "is_senior", "is_active", "display_order"),
        }),
    )
