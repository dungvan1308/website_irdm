"""Django admin registrations for the Knowledge module."""

from django.contrib import admin
from django.utils.html import format_html

from .models import (
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
    fields = ("article", "display_order", "is_active")
    autocomplete_fields = ("article",)


# ─── KnowledgeListingPage ─────────────────────────────────────────────────────

@admin.register(KnowledgeListingPage)
class KnowledgeListingPageAdmin(admin.ModelAdmin):
    list_display = ("heading", "hero_image_preview", "is_active")
    readonly_fields = ("hero_image_preview", "cta_background_image_preview")
    inlines = [KnowledgeFeaturedArticleInline]
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
            "fields": ("featured_section_label", "featured_section_heading"),
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
