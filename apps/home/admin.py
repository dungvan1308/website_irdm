"""Django admin registrations for homepage CMS models."""

from django.contrib import admin

from .models import (
    AudienceSegment,
    AudienceSectionHeader,
    AudienceTag,
    CTABanner,
    CapabilitiesSectionHeader,
    CoreCapability,
    EvidenceSectionHeader,
    FeaturedSectionConfig,
    HeroPillTag,
    HeroSection,
    KnowledgeCategory,
    KnowledgeSectionHeader,
    MethodologySectionHeader,
    MethodologyStep,
    PartnerLogo,
    PhilosophyPrinciple,
    PhilosophySectionHeader,
    StatisticItem,
)


class HeroPillTagInline(admin.TabularInline):
    model = HeroPillTag
    extra = 1
    fields = ("label", "display_order", "is_active")


@admin.register(HeroSection)
class HeroSectionAdmin(admin.ModelAdmin):
    list_display = ("heading", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [HeroPillTagInline]
    fieldsets = (
        (
            "Content",
            {"fields": ("eyebrow_text", "heading", "subheading", "description", "background_image", "quote_strip_text")},
        ),
        (
            "Primary CTA",
            {"fields": ("primary_cta_label", "primary_cta_url")},
        ),
        (
            "Secondary CTA",
            {"fields": ("secondary_cta_label", "secondary_cta_url")},
        ),
        (
            "Status",
            {"fields": ("is_active", "display_order")},
        ),
    )


@admin.register(StatisticItem)
class StatisticItemAdmin(admin.ModelAdmin):
    list_display = ("value", "label", "display_order", "is_active")
    list_editable = ("display_order", "is_active")


@admin.register(PartnerLogo)
class PartnerLogoAdmin(admin.ModelAdmin):
    list_display = ("name", "website_url", "display_order", "is_active")
    list_editable = ("display_order", "is_active")


@admin.register(FeaturedSectionConfig)
class FeaturedSectionConfigAdmin(admin.ModelAdmin):
    list_display = ("section_key", "title", "display_order", "is_visible", "is_active")
    list_editable = ("display_order", "is_visible", "is_active")
    fieldsets = (
        ("Section", {"fields": ("section_key",)}),
        ("Content", {"fields": ("title", "subtitle", "cta_label", "cta_url")}),
        ("Status", {"fields": ("is_visible", "is_active", "display_order")}),
    )


# ─── Audience ─────────────────────────────────────────────────────────────────

@admin.register(AudienceSectionHeader)
class AudienceSectionHeaderAdmin(admin.ModelAdmin):
    list_display = ("heading", "is_active")


class AudienceTagInline(admin.TabularInline):
    model = AudienceTag
    extra = 1
    fields = ("label", "display_order", "is_active")


@admin.register(AudienceSegment)
class AudienceSegmentAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AudienceTagInline]
    fieldsets = (
        ("Content", {"fields": ("icon", "title", "description")}),
        ("CTA", {"fields": ("cta_label", "cta_url")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── Methodology ──────────────────────────────────────────────────────────────

@admin.register(MethodologySectionHeader)
class MethodologySectionHeaderAdmin(admin.ModelAdmin):
    list_display = ("heading", "is_active")


@admin.register(MethodologyStep)
class MethodologyStepAdmin(admin.ModelAdmin):
    list_display = ("step_number", "title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")


# ─── Capabilities ─────────────────────────────────────────────────────────────

@admin.register(CapabilitiesSectionHeader)
class CapabilitiesSectionHeaderAdmin(admin.ModelAdmin):
    list_display = ("heading", "is_active")


@admin.register(CoreCapability)
class CoreCapabilityAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    fieldsets = (
        ("Content", {"fields": ("icon", "title", "description", "background_image")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── Philosophy ───────────────────────────────────────────────────────────────

@admin.register(PhilosophySectionHeader)
class PhilosophySectionHeaderAdmin(admin.ModelAdmin):
    list_display = ("heading", "is_active")


@admin.register(PhilosophyPrinciple)
class PhilosophyPrincipleAdmin(admin.ModelAdmin):
    list_display = ("number", "title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")


# ─── Evidence / Partners ──────────────────────────────────────────────────────

@admin.register(EvidenceSectionHeader)
class EvidenceSectionHeaderAdmin(admin.ModelAdmin):
    list_display = ("heading", "is_active")


# ─── Knowledge ────────────────────────────────────────────────────────────────

@admin.register(KnowledgeSectionHeader)
class KnowledgeSectionHeaderAdmin(admin.ModelAdmin):
    list_display = ("heading", "is_active")


@admin.register(KnowledgeCategory)
class KnowledgeCategoryAdmin(admin.ModelAdmin):
    list_display = ("category_label", "title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    fieldsets = (
        ("Content", {"fields": ("icon", "category_label", "title")}),
        ("CTA", {"fields": ("cta_label", "cta_url")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── CTA Banner ───────────────────────────────────────────────────────────────

@admin.register(CTABanner)
class CTABannerAdmin(admin.ModelAdmin):
    list_display = ("heading", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    fieldsets = (
        ("Content", {"fields": ("section_label", "heading", "description", "background_image")}),
        ("CTA", {"fields": ("cta_label", "cta_url")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )
