"""About page CMS admin registrations."""

from django.contrib import admin

from .models import (
    AboutCTABanner,
    AboutCapabilityEcosystem,
    AboutContactBanner,
    AboutCoreValue,
    AboutCoreValueSection,
    AboutEcosystemPartnerGroup,
    AboutEcosystemPartnerItem,
    AboutEcosystemStatistic,
    AboutHero,
    AboutHeroStatistic,
    AboutHighlightCard,
    AboutIntroduction,
    AboutLegalInfo,
    AboutLegalTimelineItem,
    AboutNetworkSectionHeader,
    AboutPageSEO,
    AboutPartnerBenefit,
    AboutPartnerBenefitSection,
    AboutProfessionalNetwork,
    AboutPurpose,
    AboutTargetAudience,
    AboutTargetAudienceSection,
    AboutVisionMission,
    AboutVisionMissionCard,
    AboutVisionMissionIcon,
)


# ─── SEO ──────────────────────────────────────────────────────────────────────

@admin.register(AboutPageSEO)
class AboutPageSEOAdmin(admin.ModelAdmin):
    list_display = ("meta_title", "is_active")
    fieldsets = (
        ("SEO", {"fields": ("meta_title", "meta_description", "meta_keywords")}),
        ("Open Graph", {"fields": ("og_title", "og_description", "og_image")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── Hero ─────────────────────────────────────────────────────────────────────

class AboutHeroStatisticInline(admin.TabularInline):
    model = AboutHeroStatistic
    extra = 1
    fields = ("number", "label", "animation_enabled", "display_order", "is_active")


@admin.register(AboutHero)
class AboutHeroAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutHeroStatisticInline]
    fieldsets = (
        ("Content", {"fields": ("eyebrow", "title", "subtitle", "description")}),
        ("Images", {"fields": ("background_image", "foreground_image")}),
        ("Primary CTA", {"fields": ("primary_cta_label", "primary_cta_url")}),
        ("Secondary CTA", {"fields": ("secondary_cta_label", "secondary_cta_url")}),
        ("Quote", {"fields": ("quote_text", "quote_icon", "quote_show")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── Introduction ─────────────────────────────────────────────────────────────

class AboutHighlightCardInline(admin.TabularInline):
    model = AboutHighlightCard
    extra = 1
    fields = ("icon", "icon_image", "title", "description", "color", "display_order", "is_active")


@admin.register(AboutIntroduction)
class AboutIntroductionAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutHighlightCardInline]
    fieldsets = (
        ("Content", {"fields": ("section_label", "title", "subtitle", "description")}),
        ("Image", {"fields": ("image", "image_alt")}),
        ("Background", {"fields": ("background_image",)}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── Purpose ──────────────────────────────────────────────────────────────────

@admin.register(AboutPurpose)
class AboutPurposeAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    fieldsets = (
        ("Content", {"fields": ("section_label", "title", "description")}),
        ("Quote Block", {"fields": ("highlight_box_text", "quote_icon", "quote_body")}),
        ("Diagram Card", {"fields": ("diagram_title", "diagram_image", "diagram_alt", "diagram_caption")}),
        ("Background", {"fields": ("background_image",)}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── Vision / Mission / Philosophy ────────────────────────────────────────────

class AboutVisionMissionCardInline(admin.TabularInline):
    model = AboutVisionMissionCard
    extra = 3
    fields = ("card_type", "icon", "icon_image", "title", "body", "highlight_label", "bg_color", "display_order", "is_active")


class AboutVisionMissionIconInline(admin.TabularInline):
    model = AboutVisionMissionIcon
    extra = 4
    fields = ("icon_image", "icon_alt", "display_order", "is_active")


@admin.register(AboutVisionMission)
class AboutVisionMissionAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutVisionMissionCardInline, AboutVisionMissionIconInline]
    fieldsets = (
        ("Content", {"fields": ("section_label", "title", "description")}),
        ("Bottom Panel", {"fields": ("bottom_panel_title", "bottom_panel_description", "bottom_panel_text")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── Core Values ──────────────────────────────────────────────────────────────

@admin.register(AboutCoreValueSection)
class AboutCoreValueSectionAdmin(admin.ModelAdmin):
    list_display = ("title", "is_active")
    fieldsets = (
        ("Content", {"fields": ("section_label", "title", "description")}),
        ("Background", {"fields": ("background_image",)}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


@admin.register(AboutCoreValue)
class AboutCoreValueAdmin(admin.ModelAdmin):
    list_display = ("title", "color_theme", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    fieldsets = (
        ("Content", {"fields": ("icon", "icon_image", "title", "description", "color_theme")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── Legal Foundation ─────────────────────────────────────────────────────────

class AboutLegalTimelineItemInline(admin.TabularInline):
    model = AboutLegalTimelineItem
    extra = 1
    fields = ("year", "title", "description", "document_url", "document_label", "display_order", "is_active")


@admin.register(AboutLegalInfo)
class AboutLegalInfoAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutLegalTimelineItemInline]
    fieldsets = (
        ("Content", {"fields": ("section_label", "title", "description")}),
        ("Image", {"fields": ("image", "image_alt")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── CTA Banner ───────────────────────────────────────────────────────────────

@admin.register(AboutCTABanner)
class AboutCTABannerAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    fieldsets = (
        ("Content", {"fields": ("title", "description", "background_image")}),
        ("Primary CTA", {"fields": ("primary_cta_label", "primary_cta_url")}),
        ("Secondary CTA", {"fields": ("secondary_cta_label", "secondary_cta_url")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── Partner Benefits ─────────────────────────────────────────────────────────

class AboutPartnerBenefitInline(admin.TabularInline):
    model = AboutPartnerBenefit
    extra = 1
    fields = ("icon", "icon_image", "title", "description", "display_order", "is_active")


@admin.register(AboutPartnerBenefitSection)
class AboutPartnerBenefitSectionAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutPartnerBenefitInline]
    fieldsets = (
        ("Content", {"fields": ("section_label", "title", "description")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── Professional Network ─────────────────────────────────────────────────────

@admin.register(AboutNetworkSectionHeader)
class AboutNetworkSectionHeaderAdmin(admin.ModelAdmin):
    list_display = ("title", "is_active")


@admin.register(AboutProfessionalNetwork)
class AboutProfessionalNetworkAdmin(admin.ModelAdmin):
    list_display = ("name", "link_url", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    fieldsets = (
        ("Content", {"fields": ("name", "description", "logo")}),
        ("Link", {"fields": ("link_url", "link_label")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── Target Audience ──────────────────────────────────────────────────────────

class AboutTargetAudienceInline(admin.TabularInline):
    model = AboutTargetAudience
    extra = 1
    fields = ("icon", "icon_image", "image", "title", "description", "cta_label", "cta_url", "display_order", "is_active")


@admin.register(AboutTargetAudienceSection)
class AboutTargetAudienceSectionAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutTargetAudienceInline]
    fieldsets = (
        ("Content", {"fields": ("section_label", "title", "description", "cta_label", "cta_url")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


# ─── Capability & Ecosystem ───────────────────────────────────────────────────

class AboutEcosystemPartnerItemInline(admin.TabularInline):
    model = AboutEcosystemPartnerItem
    extra = 1
    fields = ("name", "logo", "display_order", "is_active")


class AboutEcosystemPartnerGroupInline(admin.StackedInline):
    model = AboutEcosystemPartnerGroup
    extra = 1
    fields = ("title", "color", "display_order", "is_active")


class AboutEcosystemStatisticInline(admin.TabularInline):
    model = AboutEcosystemStatistic
    extra = 1
    fields = ("number", "label", "display_order", "is_active")


@admin.register(AboutCapabilityEcosystem)
class AboutCapabilityEcosystemAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutEcosystemPartnerGroupInline, AboutEcosystemStatisticInline]
    fieldsets = (
        ("Content", {"fields": ("section_label", "title", "description")}),
        ("Diagram", {"fields": ("diagram_image", "diagram_alt")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


@admin.register(AboutEcosystemPartnerGroup)
class AboutEcosystemPartnerGroupAdmin(admin.ModelAdmin):
    list_display = ("title", "ecosystem", "color", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutEcosystemPartnerItemInline]


# ─── Contact Banner ───────────────────────────────────────────────────────────

@admin.register(AboutContactBanner)
class AboutContactBannerAdmin(admin.ModelAdmin):
    list_display = ("title", "hotline", "email", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    fieldsets = (
        ("Content", {"fields": ("title", "description", "background_image")}),
        ("Contact", {"fields": ("hotline", "email")}),
        ("Social Links", {"fields": ("facebook_url", "linkedin_url", "youtube_url")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )
