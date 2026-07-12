"""Django admin registrations for the Capability module."""

from django.contrib import admin

from .models import (
    Capability,
    CapabilityCaseStudy,
    CapabilityCaseStudyTag,
    CapabilityFeature,
    CapabilityHowStep,
    CapabilityListingPage,
    CapabilityNeedItem,
    CapabilityOutput,
)


# ─── Inlines ──────────────────────────────────────────────────────────────────

class CapabilityFeatureInline(admin.TabularInline):
    model = CapabilityFeature
    extra = 1
    fields = ("label", "display_order", "is_active")


class CapabilityNeedItemInline(admin.TabularInline):
    model = CapabilityNeedItem
    extra = 1
    fields = ("number", "content", "display_order", "is_active")


class CapabilityHowStepInline(admin.TabularInline):
    model = CapabilityHowStep
    extra = 1
    fields = ("title", "icon", "step_image", "display_order", "is_active")


class CapabilityOutputInline(admin.TabularInline):
    model = CapabilityOutput
    extra = 1
    fields = ("number", "content", "display_order", "is_active")


class CapabilityCaseStudyTagInline(admin.TabularInline):
    model = CapabilityCaseStudyTag
    extra = 1
    fields = ("label", "display_order", "is_active")


# ─── Admin registrations ──────────────────────────────────────────────────────

@admin.register(CapabilityListingPage)
class CapabilityListingPageAdmin(admin.ModelAdmin):
    list_display = ("heading", "is_active")
    fieldsets = (
        ("Hero", {
            "fields": ("section_label", "heading", "description", "hero_image"),
        }),
        ("Overview", {
            "fields": ("overview_heading", "overview_description"),
        }),
        ("CTA", {
            "fields": ("cta_label", "cta_url"),
        }),
        ("Status", {
            "fields": ("is_active", "display_order"),
        }),
    )


@admin.register(Capability)
class CapabilityAdmin(admin.ModelAdmin):
    list_display = ("title", "slug", "is_published", "display_order", "is_active")
    list_editable = ("is_published", "display_order", "is_active")
    prepopulated_fields = {"slug": ("title",)}
    search_fields = ("title", "slug")
    inlines = [
        CapabilityFeatureInline,
        CapabilityNeedItemInline,
        CapabilityHowStepInline,
        CapabilityOutputInline,
    ]
    fieldsets = (
        ("Identity", {
            "fields": ("title", "slug", "section_label"),
        }),
        ("Hero / Listing", {
            "fields": ("summary", "thumbnail", "card_icon", "hero_image", "description"),
        }),
        ("What-is section", {
            "fields": ("what_is_label", "what_is_description", "what_is_image"),
        }),
        ("Section labels", {
            "fields": ("need_section_label", "need_section_intro", "how_label", "output_label"),
        }),
        ("CTA buttons", {
            "fields": (
                "cta_primary_label", "cta_primary_url",
                "cta_secondary_label", "cta_secondary_url",
            ),
        }),
        ("SEO", {
            "fields": ("meta_title", "meta_description", "meta_keywords"),
            "classes": ("collapse",),
        }),
        ("Status", {
            "fields": ("is_published", "is_active", "display_order"),
        }),
    )


@admin.register(CapabilityCaseStudy)
class CapabilityCaseStudyAdmin(admin.ModelAdmin):
    list_display = ("capability", "title", "number", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    list_filter = ("capability",)
    inlines = [CapabilityCaseStudyTagInline]
    fieldsets = (
        ("Relationship", {
            "fields": ("capability", "number", "image"),
        }),
        ("Content", {
            "fields": ("category_label", "title", "description"),
        }),
        ("CTAs", {
            "fields": (
                "cta_primary_label", "cta_primary_url",
                "cta_secondary_label", "cta_secondary_url",
            ),
        }),
        ("Status", {
            "fields": ("is_active", "display_order"),
        }),
    )
