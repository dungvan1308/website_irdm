"""Django admin registrations for the Knowledge module."""

from django.contrib import admin
from django.utils.html import format_html
from django.utils.translation import gettext_lazy as _

from .models import (
    KnowledgeAccordionItem,
    KnowledgeActivityNews,
    KnowledgeArticle,
    KnowledgeCategory,
    KnowledgeContentTypeCard,
    KnowledgeCTAButton,
    KnowledgeDownload,
    KnowledgeDownloadRequest,
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

    @admin.display(description=_("Cover preview"))
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

    @admin.display(description=_("Cover preview"))
    def cover_image_preview(self, obj):
        return _img_preview(obj.cover_image)


class KnowledgeCTAButtonInline(admin.TabularInline):
    model = KnowledgeCTAButton
    extra = 1
    fields = ("text", "url", "target", "style", "icon", "display_order", "is_published", "is_active")
    verbose_name = _("Ready section CTA button")
    verbose_name_plural = _("Ready section CTA buttons")


# ─── KnowledgeListingPage ───────────────────────────────────────────────────────────────────

@admin.register(KnowledgeListingPage)
class KnowledgeListingPageAdmin(admin.ModelAdmin):
    list_display = ("heading", "hero_image_preview", "is_active")
    readonly_fields = ("hero_image_preview", "cta_background_image_preview")
    inlines = [KnowledgeFeaturedArticleInline, KnowledgeContentTypeCardInline, KnowledgeTopicCardInline, KnowledgeCTAButtonInline]
    fieldsets = (
        (_("Hero"), {
            "fields": (
                "section_label", "heading", "description",
                "hero_image", "hero_image_preview",
                "hero_cta_primary_label", "hero_cta_primary_url",
                "hero_cta_secondary_label", "hero_cta_secondary_url",
            ),
        }),
        (_("Filter / Search Section"), {
            "description": _("Configure the filter section; filter groups are managed separately."),
            "fields": ("search_enabled", "search_placeholder", "filter_section_heading", "filter_section_description"),
        }),
        (_("Featured Section"), {
            "description": _("Configure the featured section; its cards are managed in the inlines below."),
            "fields": (
                "featured_section_label",
                "featured_section_heading",
                "featured_section_description",
                "featured_bg_image",
                "featured_bg_decoration",
            ),
        }),
        (_("Content Type Section (Khám phá theo Loại Nội Dung)"), {
            "description": _("Configure the content type section; its cards are managed in the inlines below."),
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
        (_("Topic Browse Section (Khám phá theo Chủ Đề)"), {
            "description": _("Configure the topic browse section; its cards are managed in the inlines below."),
            "fields": (
                "topic_section_label",
                "topic_section_heading",
                "topic_section_description",
                "topic_section_bg_image",
                "topic_section_bg_decoration",
            ),
        }),
        (_("Publication Section (Ấn phẩm & Báo cáo)"), {
            "description": _("Configure the publication section, including its heading, request form, and contact block."),
            "fields": (
                "pub_section_label",
                "pub_section_heading",
                "pub_section_description",
                "pub_section_bg_image",
                "pub_section_bg_decoration",
            ),
        }),
        (_("Publication Form"), {
            "description": _("Configure the publication request form."),
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
        (_("Publication Contact Block"), {
            "description": _("Configure the IRDM contact block displayed beside the request form."),
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
        (_("News & Events Section (Tin tức & Sự kiện)"), {
            "description": _("Configure the news and events section, including IRDM news and upcoming events."),
            "fields": (
                "news_section_label",
                "news_section_heading",
                "news_section_description",
                "news_section_bg_image",
                "news_section_bg_decoration",
                "news_activity_heading",
                "news_events_heading",
            ),
        }),
        (_("Press Section (IRDM trên báo chí và diễn đàn chuyên môn)"), {
            "description": _("Configure the press and professional forums section."),
            "fields": (
                "press_section_label",
                "press_section_heading",
                "press_section_description",
                "press_section_bg_image",
            ),
        }),
        (_("Ready Section (Sẵn sàng trao đổi)"), {
            "description": _("Configure the ready-section CTA; its buttons are managed in the inline below."),
            "fields": (
                "ready_section_is_active",
                "ready_section_subtitle",
                "ready_section_title",
                "ready_section_description",
                "ready_section_bg_image",
                "ready_section_overlay_color",
                "ready_section_overlay_opacity",
                "ready_section_text_color",
            ),
        }),
        (_("CTA"), {
            "fields": (
                "cta_sub", "cta_heading",
                "cta_background_image", "cta_background_image_preview",
                "cta_primary_label", "cta_primary_url",
                "cta_secondary_label", "cta_secondary_url",
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

    @admin.display(description=_("Hero preview"))
    def hero_image_preview(self, obj):
        return _img_preview(obj.hero_image)

    @admin.display(description=_("CTA background preview"))
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
        (_("Identity"), {"fields": ("label", "slug", "heading", "description", "icon")}),
        (_("Media"), {"fields": ("cover_image", "cover_image_preview")}),
        (_("Status"), {"fields": ("is_published", "is_active", "display_order")}),
    )

    @admin.display(description=_("Cover preview"))
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
        (_("Identity"), {"fields": ("label", "slug", "description", "icon")}),
        (_("Media"), {"fields": ("cover_image", "cover_image_preview")}),
        (_("Status"), {"fields": ("is_published", "is_active", "display_order")}),
    )

    @admin.display(description=_("Cover preview"))
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
        (_("Identity"), {"fields": ("title", "slug")}),
        (_("Content"), {"fields": ("summary", "body")}),
        (_("Media"), {"fields": ("thumbnail", "thumbnail_preview", "hero_image", "hero_image_preview")}),
        (_("Classification"), {
            "fields": (
                "category", "topics",
                "author_name", "published_date", "read_time",
                "is_featured",
                "related_capabilities",
            ),
        }),
        (_("SEO"), {
            "fields": ("meta_title", "meta_description", "meta_keywords"),
            "classes": ("collapse",),
        }),
        (_("Status"), {"fields": ("is_published", "is_active", "display_order")}),
    )

    @admin.display(description=_("Thumbnail"))
    def thumbnail_preview(self, obj):
        return _img_preview(obj.thumbnail, height=60)

    @admin.display(description=_("Hero preview"))
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
        (_("Identity"), {"fields": ("title", "slug", "summary")}),
        (_("Media"), {"fields": ("cover_image", "cover_image_preview", "file", "file_type_label", "file_size_label")}),
        (_("Classification"), {"fields": ("category", "published_date")}),
        (_("Status"), {"fields": ("is_published", "is_active", "display_order")}),
    )

    @admin.display(description=_("Cover preview"))
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
        (_("Identity"), {"fields": ("title", "slug", "summary")}),
        (_("Media"), {"fields": ("thumbnail", "thumbnail_preview")}),
        (_("Classification"), {"fields": ("category", "published_date", "source_url", "topics")}),
        (_("Press Section"), {
            "description": _("Enable 'press article' to show this item in the IRDM press section."),
            "fields": ("is_press_article", "cta_text", "cta_target"),
        }),
        (_("Status"), {"fields": ("is_published", "is_active", "display_order")}),
    )

    @admin.display(description=_("Thumbnail"))
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
        (_("Group"), {"fields": ("title", "param_key")}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
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
        (_("Card"), {
            "fields": ("listing_page", "title", "category", "summary"),
        }),
        (_("Media"), {
            "fields": ("cover_image", "cover_image_preview"),
        }),
        (_("Tags"), {
            "fields": ("tags",),
        }),
        (_("CTA"), {
            "fields": ("cta_text", "cta_icon", "cta_url"),
        }),
        (_("Status"), {
            "fields": ("is_published", "is_active", "display_order"),
        }),
    )

    @admin.display(description=_("Cover preview"))
    def cover_image_preview(self, obj):
        return _img_preview(obj.cover_image)


# ─── KnowledgeTopicCardTag ────────────────────────────────────────────────────

@admin.register(KnowledgeTopicCardTag)
class KnowledgeTopicCardTagAdmin(admin.ModelAdmin):
    list_display = ("label", "slug", "color_chip", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    prepopulated_fields = {"slug": ("label",)}
    fieldsets = (
        (_("Tag"), {"fields": ("label", "slug", "color")}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
    )

    @admin.display(description=_("Color"))
    def color_chip(self, obj):
        return format_html(
            '<span style="display:inline-block;width:16px;height:16px;border-radius:3px;'
            'background:{};vertical-align:middle;margin-right:6px;"></span>{}',
            obj.color, obj.color,
        )


# ─── KnowledgeActivityNews ───────────────────────────────────────────────────

@admin.register(KnowledgeActivityNews)
class KnowledgeActivityNewsAdmin(admin.ModelAdmin):
    list_display = ("title", "category", "published_date", "is_published", "display_order", "is_active")
    list_editable = ("display_order", "is_published", "is_active")
    list_filter = ("category", "is_published")
    search_fields = ("title", "summary")
    ordering = ("display_order", "-published_date")
    prepopulated_fields = {"slug": ("title",)}
    readonly_fields = ("thumbnail_preview", "hero_image_preview")
    fieldsets = (
        (_("Identity"), {"fields": ("title", "slug", "summary")}),
        (_("Content"), {"fields": ("body", "author_name", "read_time")}),
        (_("Media"), {
            "fields": (
                "thumbnail", "thumbnail_preview",
                "hero_image", "hero_image_preview",
            ),
        }),
        (_("Classification"), {"fields": ("category", "published_date")}),
        (_("CTA"), {
            "description": _("Leave CTA URL blank to open the internal activity news detail page."),
            "fields": ("cta_text", "cta_icon", "cta_url", "cta_target"),
        }),
        (_("SEO"), {
            "fields": ("meta_title", "meta_description"),
            "classes": ("collapse",),
        }),
        (_("Status"), {"fields": ("is_published", "is_active", "display_order")}),
    )

    @admin.display(description=_("Thumbnail"))
    def thumbnail_preview(self, obj):
        return _img_preview(obj.thumbnail, height=60)

    @admin.display(description=_("Hero preview"))
    def hero_image_preview(self, obj):
        return _img_preview(obj.hero_image, height=100)


# ─── KnowledgeEventTag ────────────────────────────────────────────────────────

@admin.register(KnowledgeEventTag)
class KnowledgeEventTagAdmin(admin.ModelAdmin):
    list_display = ("label", "slug", "color_chip", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    prepopulated_fields = {"slug": ("label",)}
    fieldsets = (
        (_("Tag"), {"fields": ("label", "slug", "color")}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
    )

    @admin.display(description=_("Color"))
    def color_chip(self, obj):
        return format_html(
            '<span style="display:inline-block;width:16px;height:16px;border-radius:3px;'
            'background:{};vertical-align:middle;margin-right:6px;"></span>{}',
            obj.color, obj.color,
        )


# ─── KnowledgeEvent ───────────────────────────────────────────────────────────

@admin.register(KnowledgeEvent)
class KnowledgeEventAdmin(admin.ModelAdmin):
    list_display = ("title", "category", "event_date", "location", "is_published", "display_order", "is_active")
    list_editable = ("display_order", "is_published", "is_active")
    list_filter = ("category", "is_published")
    search_fields = ("title", "description", "location")
    filter_horizontal = ("tags",)
    readonly_fields = ("cover_image_preview",)
    fieldsets = (
        (_("Identity"), {"fields": ("title", "description")}),
        (_("Media"), {"fields": ("cover_image", "cover_image_preview")}),
        (_("Classification"), {"fields": ("category", "event_date", "location", "tags")}),
        (_("CTA"), {"fields": ("cta_text", "cta_icon", "cta_url", "cta_target")}),
        (_("Status"), {"fields": ("is_published", "is_active", "display_order")}),
    )

    @admin.display(description=_("Cover preview"))
    def cover_image_preview(self, obj):
        return _img_preview(obj.cover_image)


# ─── KnowledgeAccordionItem ───────────────────────────────────────────────────

@admin.register(KnowledgeAccordionItem)
class KnowledgeAccordionItemAdmin(admin.ModelAdmin):
    list_display = ("title", "accordion_type", "is_published", "display_order", "is_active")
    list_editable = ("display_order", "is_published", "is_active")
    list_filter = ("accordion_type", "is_published")
    search_fields = ("title", "content")
    ordering = ("accordion_type", "display_order")
    fieldsets = (
        (_("Accordion"), {"fields": ("accordion_type", "title", "content")}),
        (_("Status"), {"fields": ("is_published", "is_active", "display_order")}),
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
        (_("Card"), {
            "fields": ("listing_page", "title", "topic", "description"),
        }),
        (_("Media"), {
            "fields": ("cover_image", "cover_image_preview", "icon"),
        }),
        (_("Tags"), {
            "fields": ("tags",),
        }),
        (_("CTA"), {
            "fields": ("cta_text", "cta_icon", "cta_url"),
        }),
        (_("Status"), {
            "fields": ("is_published", "is_active", "display_order"),
        }),
    )

    @admin.display(description=_("Cover preview"))
    def cover_image_preview(self, obj):
        return _img_preview(obj.cover_image)
