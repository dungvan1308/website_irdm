"""Django admin registrations for the Knowledge module."""

from django.contrib import admin
from django.utils.html import format_html

from .models import (
    KnowledgeArticle,
    KnowledgeCategory,
    KnowledgeContentTypeCard,
    KnowledgeDownload,
    KnowledgeDownloadRequest,
    KnowledgeFeaturedArticle,
    KnowledgeFilterGroup,
    KnowledgeFilterItem,
    KnowledgeListingPage,
    KnowledgeNewsItem,
    KnowledgeTopic,
    KnowledgeTopicCard,
    KnowledgeTopicCardTag,
)


# ─── Image preview helper ──────────────────────────────────────────────────────

def _img_preview(image_field, height: int = 80) -> str:
    if image_field:
        return format_html(
            '<img src="{}" style="height:{}px;border-radius:4px;object-fit:cover;" />',
            image_field.url,
            height,
        )
    return "—"


# ─── Inlines ──────────────────────────────────────────────────────────────────

class KnowledgeFeaturedArticleInline(admin.TabularInline):
    model = KnowledgeFeaturedArticle
    extra = 1
    fields = ("article", "display_order", "is_active", "badge_text", "cta_text", "cta_icon", "cta_url")
    autocomplete_fields = ("article",)


class KnowledgeContentTypeCardInline(admin.StackedInline):
    model = KnowledgeContentTypeCard
    extra = 1
    filter_horizontal = ("tags",)
    readonly_fields = ("cover_image_preview",)
    fields = (
        "title", "category", "summary",
        "cover_image", "cover_image_preview",
        "tags",
        "cta_text", "cta_icon", "cta_url",
        "display_order", "is_published", "is_active",
    )

    @admin.display(description="Cover preview")
    def cover_image_preview(self, obj):
        return _img_preview(obj.cover_image)


class KnowledgeTopicCardInline(admin.StackedInline):
    model = KnowledgeTopicCard
    extra = 1
    filter_horizontal = ("tags",)
    readonly_fields = ("cover_image_preview",)
    fields = (
        "title", "topic", "description",
        "cover_image", "cover_image_preview",
        "icon", "tags",
        "cta_text", "cta_icon", "cta_url",
        "display_order", "is_published", "is_active",
    )

    @admin.display(description="Cover preview")
    def cover_image_preview(self, obj):
        return _img_preview(obj.cover_image)


# ─── KnowledgeListingPage ─────────────────────────────────────────────────────

@admin.register(KnowledgeListingPage)
class KnowledgeListingPageAdmin(admin.ModelAdmin):
    list_display = ("heading", "hero_image_preview", "is_active")
    readonly_fields = ("hero_image_preview", "cta_background_image_preview")
    inlines = [KnowledgeFeaturedArticleInline, KnowledgeContentTypeCardInline, KnowledgeTopicCardInline]
    fieldsets = (
        ("Hero", {
            "fields": (
                "section_label", "heading", "description",
                "hero_image", "hero_image_preview",
                "hero_cta_primary_label", "hero_cta_primary_url",
                "hero_cta_secondary_label", "hero_cta_secondary_url",
            ),
        }),
        ("Filter / Search Section", {
            "description": "Cấu hình section bộ lọc — các nhóm lọc được quản lý riêng tại Filter Groups.",
            "fields": ("search_enabled", "search_placeholder", "filter_section_heading", "filter_section_description"),
        }),
        ("Featured Section", {
            "description": "Cấu hình section Nội dung nổi bật — các card được quản lý qua inline bên dưới.",
            "fields": (
                "featured_section_label",
                "featured_section_heading",
                "featured_section_description",
                "featured_bg_image",
                "featured_bg_decoration",
            ),
        }),
        ("Content Type Section (Khám phá theo Loại Nội Dung)", {
            "description": "Cấu hình section Khám phá theo Loại Nội Dung — các card được quản lý qua inline bên dưới.",
            "fields": (
                "content_type_section_label",
                "content_type_section_heading",
                "content_type_section_description",
                "content_type_section_bg_image",
                "content_type_section_bg_decoration",
                "content_type_section_cta_text",
                "content_type_section_cta_icon",
                "content_type_section_cta_url",
            ),
        }),
        ("Topic Browse Section (Khám phá theo Chủ Đề)", {
            "description": "Cấu hình section Khám phá theo Chủ Đề — các card được quản lý qua inline bên dưới.",
            "fields": (
                "topic_section_label",
                "topic_section_heading",
                "topic_section_description",
                "topic_section_bg_image",
                "topic_section_bg_decoration",
            ),
        }),
        ("Publication Section (Ấn phẩm & Báo cáo)", {
            "description": "Cấu hình section Tài liệu tải về — gồm tiêu đề section, form yêu cầu và contact block.",
            "fields": (
                "pub_section_label",
                "pub_section_heading",
                "pub_section_description",
                "pub_section_bg_image",
                "pub_section_bg_decoration",
            ),
        }),
        ("Publication Form", {
            "description": "Cấu hình form 'Gửi yêu cầu nhận tài liệu'.",
            "fields": (
                "pub_form_title",
                "pub_form_description",
                "pub_form_name_label",
                "pub_form_name_placeholder",
                "pub_form_org_label",
                "pub_form_org_placeholder",
                "pub_form_email_label",
                "pub_form_email_placeholder",
                "pub_form_note_label",
                "pub_form_note_placeholder",
                "pub_form_privacy_note",
                "pub_form_button_text",
                "pub_form_button_icon",
                "pub_form_success_message",
            ),
        }),
        ("Publication Contact Block", {
            "description": "Cấu hình khối 'Liên hệ trao đổi với Viện IRDM' phía bên phải form.",
            "fields": (
                "pub_contact_title",
                "pub_contact_description",
                "pub_contact_email",
                "pub_contact_phone",
                "pub_contact_address",
                "pub_contact_cta_text",
                "pub_contact_cta_icon",
                "pub_contact_cta_url",
                "pub_contact_city_image",
            ),
        }),
        ("CTA", {
            "fields": (
                "cta_sub", "cta_heading",
                "cta_background_image", "cta_background_image_preview",
                "cta_primary_label", "cta_primary_url",
                "cta_secondary_label", "cta_secondary_url",
            ),
        }),
        ("SEO", {
            "fields": ("meta_title", "meta_description"),
            "classes": ("collapse",),
        }),
        ("Status", {
            "fields": ("is_active", "display_order"),
        }),
    )

    @admin.display(description="Hero preview")
    def hero_image_preview(self, obj):
        return _img_preview(obj.hero_image)

    @admin.display(description="CTA background preview")
    def cta_background_image_preview(self, obj):
        return _img_preview(obj.cta_background_image)


# ─── KnowledgeDownloadRequest ─────────────────────────────────────────────────

@admin.register(KnowledgeDownloadRequest)
class KnowledgeDownloadRequestAdmin(admin.ModelAdmin):
    list_display = ("full_name", "email", "organization", "submitted_at")
    list_filter = ("submitted_at",)
    search_fields = ("full_name", "email", "organization")
    readonly_fields = ("full_name", "email", "organization", "note", "submitted_at")
    ordering = ("-submitted_at",)

    def has_add_permission(self, request):
        return False

    def has_change_permission(self, request, obj=None):
        return False


# ─── KnowledgeCategory ────────────────────────────────────────────────────────

@admin.register(KnowledgeCategory)
class KnowledgeCategoryAdmin(admin.ModelAdmin):
    list_display = ("label", "slug", "display_order", "is_published", "is_active")
    list_editable = ("display_order", "is_published", "is_active")
    prepopulated_fields = {"slug": ("label",)}
    readonly_fields = ("cover_image_preview",)
    fieldsets = (
        ("Identity", {"fields": ("label", "slug", "heading", "description", "icon")}),
        ("Media", {"fields": ("cover_image", "cover_image_preview")}),
        ("Status", {"fields": ("is_published", "is_active", "display_order")}),
    )

    @admin.display(description="Cover preview")
    def cover_image_preview(self, obj):
        return _img_preview(obj.cover_image)


# ─── KnowledgeTopic ───────────────────────────────────────────────────────────

@admin.register(KnowledgeTopic)
class KnowledgeTopicAdmin(admin.ModelAdmin):
    list_display = ("label", "slug", "display_order", "is_published", "is_active")
    list_editable = ("display_order", "is_published", "is_active")
    prepopulated_fields = {"slug": ("label",)}
    readonly_fields = ("cover_image_preview",)
    fieldsets = (
        ("Identity", {"fields": ("label", "slug", "description", "icon")}),
        ("Media", {"fields": ("cover_image", "cover_image_preview")}),
        ("Status", {"fields": ("is_published", "is_active", "display_order")}),
    )

    @admin.display(description="Cover preview")
    def cover_image_preview(self, obj):
        return _img_preview(obj.cover_image)


# ─── KnowledgeArticle ─────────────────────────────────────────────────────────

@admin.register(KnowledgeArticle)
class KnowledgeArticleAdmin(admin.ModelAdmin):
    list_display = ("title", "category", "is_featured", "is_published", "display_order")
    list_filter = ("category", "topics", "is_featured", "is_published")
    search_fields = ("title", "summary")
    prepopulated_fields = {"slug": ("title",)}
    filter_horizontal = ("topics", "related_capabilities")
    readonly_fields = ("thumbnail_preview", "hero_image_preview")
    fieldsets = (
        ("Identity", {"fields": ("title", "slug")}),
        ("Content", {"fields": ("summary", "body")}),
        ("Media", {"fields": ("thumbnail", "thumbnail_preview", "hero_image", "hero_image_preview")}),
        ("Classification", {
            "fields": (
                "category", "topics",
                "author_name", "published_date", "read_time",
                "is_featured",
                "related_capabilities",
            ),
        }),
        ("SEO", {
            "fields": ("meta_title", "meta_description", "meta_keywords"),
            "classes": ("collapse",),
        }),
        ("Status", {"fields": ("is_published", "is_active", "display_order")}),
    )

    @admin.display(description="Thumbnail")
    def thumbnail_preview(self, obj):
        return _img_preview(obj.thumbnail, height=60)

    @admin.display(description="Hero preview")
    def hero_image_preview(self, obj):
        return _img_preview(obj.hero_image)


# ─── KnowledgeDownload ────────────────────────────────────────────────────────

@admin.register(KnowledgeDownload)
class KnowledgeDownloadAdmin(admin.ModelAdmin):
    list_display = ("title", "category", "file_type_label", "is_published", "display_order", "is_active")
    list_editable = ("display_order", "is_published", "is_active")
    prepopulated_fields = {"slug": ("title",)}
    readonly_fields = ("cover_image_preview",)
    fieldsets = (
        ("Identity", {"fields": ("title", "slug", "summary")}),
        ("Media", {"fields": ("cover_image", "cover_image_preview", "file", "file_type_label", "file_size_label")}),
        ("Classification", {"fields": ("category", "published_date")}),
        ("Status", {"fields": ("is_published", "is_active", "display_order")}),
    )

    @admin.display(description="Cover preview")
    def cover_image_preview(self, obj):
        return _img_preview(obj.cover_image)


# ─── KnowledgeNewsItem ────────────────────────────────────────────────────────

@admin.register(KnowledgeNewsItem)
class KnowledgeNewsItemAdmin(admin.ModelAdmin):
    list_display = ("title", "category", "published_date", "is_published", "display_order", "is_active")
    list_editable = ("display_order", "is_published", "is_active")
    prepopulated_fields = {"slug": ("title",)}
    filter_horizontal = ("topics",)
    readonly_fields = ("thumbnail_preview",)
    fieldsets = (
        ("Identity", {"fields": ("title", "slug", "summary")}),
        ("Media", {"fields": ("thumbnail", "thumbnail_preview")}),
        ("Status", {"fields": ("is_published", "is_active", "display_order")}),
    )

    @admin.display(description="Thumbnail")
    def thumbnail_preview(self, obj):
        return _img_preview(obj.thumbnail, height=60)


# ─── KnowledgeFilterGroup ──────────────────────────────────────────────────────

class KnowledgeFilterItemInline(admin.TabularInline):
    model = KnowledgeFilterItem
    extra = 1
    fields = ("label", "value", "color_default", "color_active", "display_order", "is_active")


@admin.register(KnowledgeFilterGroup)
class KnowledgeFilterGroupAdmin(admin.ModelAdmin):
    list_display = ("title", "param_key", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [KnowledgeFilterItemInline]
    fieldsets = (
        ("Group", {"fields": ("title", "param_key")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── KnowledgeContentTypeCard ─────────────────────────────────────────────────

@admin.register(KnowledgeContentTypeCard)
class KnowledgeContentTypeCardAdmin(admin.ModelAdmin):
    list_display = ("title", "category", "listing_page", "is_published", "display_order", "is_active")
    list_editable = ("display_order", "is_published", "is_active")
    list_filter = ("listing_page", "category", "is_published")
    filter_horizontal = ("tags",)
    readonly_fields = ("cover_image_preview",)
    fieldsets = (
        ("Card", {
            "fields": ("listing_page", "title", "category", "summary"),
        }),
        ("Media", {
            "fields": ("cover_image", "cover_image_preview"),
        }),
        ("Tags", {
            "fields": ("tags",),
        }),
        ("CTA", {
            "fields": ("cta_text", "cta_icon", "cta_url"),
        }),
        ("Status", {
            "fields": ("is_published", "is_active", "display_order"),
        }),
    )

    @admin.display(description="Cover preview")
    def cover_image_preview(self, obj):
        return _img_preview(obj.cover_image)


# ─── KnowledgeTopicCardTag ────────────────────────────────────────────────────

@admin.register(KnowledgeTopicCardTag)
class KnowledgeTopicCardTagAdmin(admin.ModelAdmin):
    list_display = ("label", "slug", "color_chip", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    prepopulated_fields = {"slug": ("label",)}
    fieldsets = (
        ("Tag", {"fields": ("label", "slug", "color")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )

    @admin.display(description="Color")
    def color_chip(self, obj):
        return format_html(
            '<span style="display:inline-block;width:16px;height:16px;border-radius:3px;'
            'background:{};vertical-align:middle;margin-right:6px;"></span>{}',
            obj.color, obj.color,
        )


# ─── KnowledgeTopicCard ───────────────────────────────────────────────────────

@admin.register(KnowledgeTopicCard)
class KnowledgeTopicCardAdmin(admin.ModelAdmin):
    list_display = ("title", "topic", "listing_page", "is_published", "display_order", "is_active")
    list_editable = ("display_order", "is_published", "is_active")
    list_filter = ("listing_page", "is_published")
    filter_horizontal = ("tags",)
    readonly_fields = ("cover_image_preview",)
    fieldsets = (
        ("Card", {
            "fields": ("listing_page", "title", "topic", "description"),
        }),
        ("Media", {
            "fields": ("cover_image", "cover_image_preview", "icon"),
        }),
        ("Tags", {
            "fields": ("tags",),
        }),
        ("CTA", {
            "fields": ("cta_text", "cta_icon", "cta_url"),
        }),
        ("Status", {
            "fields": ("is_published", "is_active", "display_order"),
        }),
    )

    @admin.display(description="Cover preview")
    def cover_image_preview(self, obj):
        return _img_preview(obj.cover_image)
