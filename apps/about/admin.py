"""About page CMS admin registrations."""

from django.contrib import admin
from django.utils.translation import gettext_lazy as _

from .models import (
    AboutCTABanner,
    AboutCapabilityEcosystem,
    AboutContactBanner,
    AboutContactBannerStat,
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
    AboutLegalBadge,
    AboutLegalOrgAttribute,
    AboutLegalTimelineItem,
    AboutNetworkSectionHeader,
    AboutOrgStructureBulletItem,
    AboutOrgStructureCard,
    AboutOrgStructureSection,
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
        (_("SEO"), {"fields": ("meta_title", "meta_description", "meta_keywords")}),
        (_("Open Graph"), {"fields": ("og_title", "og_description", "og_image")}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
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
        (_("Content"), {"fields": ("eyebrow", "title", "subtitle", "description")}),
        (_("Images"), {"fields": ("background_image", "foreground_image")}),
        (_("Primary CTA"), {"fields": ("primary_cta_label", "primary_cta_url")}),
        (_("Secondary CTA"), {"fields": ("secondary_cta_label", "secondary_cta_url")}),
        (_("Quote"), {"fields": ("quote_text", "quote_icon", "quote_show")}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
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
        (_("Content"), {"fields": ("section_label", "title", "subtitle", "description")}),
        (_("Image"), {"fields": ("image", "image_alt")}),
        (_("Background"), {"fields": ("background_image",)}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
    )


# ─── Purpose ──────────────────────────────────────────────────────────────────

@admin.register(AboutPurpose)
class AboutPurposeAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    fieldsets = (
        (_("Content"), {"fields": ("section_label", "title", "description")}),
        (_("Quote Block"), {"fields": ("highlight_box_text", "quote_icon", "quote_body")}),
        (_("Diagram Card"), {"fields": ("diagram_title", "diagram_image", "diagram_alt", "diagram_caption")}),
        (_("Background"), {"fields": ("background_image",)}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
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
        (_("Content"), {"fields": ("section_label", "title", "description")}),
        (_("Bottom Panel"), {"fields": ("bottom_panel_title", "bottom_panel_description", "bottom_panel_text")}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
    )


# ─── Core Values ──────────────────────────────────────────────────────────────

@admin.register(AboutCoreValueSection)
class AboutCoreValueSectionAdmin(admin.ModelAdmin):
    list_display = ("title", "is_active")
    fieldsets = (
        (_("Content"), {"fields": ("section_label", "title", "description")}),
        (_("Background"), {"fields": ("background_image",)}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
    )


@admin.register(AboutCoreValue)
class AboutCoreValueAdmin(admin.ModelAdmin):
    list_display = ("title", "color_theme", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    fieldsets = (
        (_("Content"), {"fields": ("icon", "icon_image", "title", "description", "color_theme")}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
    )


# ─── Legal Foundation ─────────────────────────────────────────────────────────

class AboutLegalBadgeInline(admin.TabularInline):
    model = AboutLegalBadge
    extra = 1
    fields = ("label", "display_order", "is_active")


class AboutLegalOrgAttributeInline(admin.TabularInline):
    model = AboutLegalOrgAttribute
    extra = 1
    fields = ("key", "value", "display_order", "is_active")


class AboutLegalTimelineItemInline(admin.TabularInline):
    model = AboutLegalTimelineItem
    extra = 1
    fields = ("year", "title", "description", "icon_image", "document_url", "document_label", "display_order", "is_active")


@admin.register(AboutLegalInfo)
class AboutLegalInfoAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutLegalBadgeInline, AboutLegalOrgAttributeInline, AboutLegalTimelineItemInline]
    fieldsets = (
        (_("Section Header"), {"fields": ("section_label", "title", "description")}),
        (_("Left Column Image"), {"fields": ("image", "image_alt")}),
        (_("Org Info Card"), {"fields": ("org_card_label", "org_name"),
                           "description": _("Badges and key/value attributes are managed via inlines below.")}),
        (_("Right Column"), {"fields": ("timeline_card_title",)}),
        (_("Footer Note"), {"fields": ("footer_note", "footer_note_show")}),
        (_("Background"), {"fields": ("background_image",)}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
    )


# ─── CTA Banner ───────────────────────────────────────────────────────────────

@admin.register(AboutCTABanner)
class AboutCTABannerAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    fieldsets = (
        (_("Content"), {"fields": ("title", "description", "background_image")}),
        (_("Primary CTA"), {"fields": ("primary_cta_label", "primary_cta_url")}),
        (_("Secondary CTA"), {"fields": ("secondary_cta_label", "secondary_cta_url")}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
    )


# ─── Partner Benefits ─────────────────────────────────────────────────────────

class AboutPartnerBenefitInline(admin.TabularInline):
    model = AboutPartnerBenefit
    extra = 1
    fields = (
        "icon", "icon_image", "title", "description",
        "color_theme", "link_url", "display_order", "is_active",
    )


@admin.register(AboutPartnerBenefitSection)
class AboutPartnerBenefitSectionAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutPartnerBenefitInline]
    fieldsets = (
        (
            "KPI Banner",
            {
                "fields": ("banner_badge", "banner_quote", "kpi_label", "kpi_value"),
                "description": _(
                    "Blue banner displayed above the section header. "
                    "Leave all fields blank to hide the banner."
                ),
            },
        ),
        (_("Section Header"), {"fields": ("section_label", "title", "description")}),
        (_("Background"), {"fields": ("background_image",)}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
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
        (_("Content"), {"fields": ("name", "description", "logo")}),
        (_("Link"), {"fields": ("link_url", "link_label")}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
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
        (_("Content"), {"fields": ("section_label", "title", "description")}),
        (_("CTA"), {"fields": ("cta_label", "cta_url")}),
        (_("Background"), {
            "fields": ("background_color", "background_image"),
            "description": _("background_color: CSS hex e.g. #0b3d6b for dark navy. Leave blank for white."),
        }),
        (_("Status"), {"fields": ("is_active", "display_order")}),
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
        (_("Content"), {"fields": ("section_label", "title", "description")}),
        (_("Primary CTA"), {"fields": ("primary_cta_label", "primary_cta_url")}),
        (_("Secondary CTA"), {"fields": ("secondary_cta_label", "secondary_cta_url")}),
        (_("Hub Diagram"), {"fields": ("hub_label", "diagram_image", "diagram_alt")}),
        (_("Background"), {"fields": ("background_image",)}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
    )


@admin.register(AboutEcosystemPartnerGroup)
class AboutEcosystemPartnerGroupAdmin(admin.ModelAdmin):
    list_display = ("title", "ecosystem", "color", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutEcosystemPartnerItemInline]


# ─── Org Structure ────────────────────────────────────────────────────────────

class AboutOrgStructureBulletItemInline(admin.TabularInline):
    model = AboutOrgStructureBulletItem
    extra = 2
    fields = ("text", "display_order", "is_active")


class AboutOrgStructureCardInline(admin.StackedInline):
    model = AboutOrgStructureCard
    extra = 1
    fields = (
        "icon", "icon_image", "color_theme", "title",
        "view_more_label", "view_more_url", "display_order", "is_active",
    )
    show_change_link = True


@admin.register(AboutOrgStructureSection)
class AboutOrgStructureSectionAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutOrgStructureCardInline]
    fieldsets = (
        (_("Section Header"), {"fields": ("section_label", "title", "description")}),
        (_("Primary CTA"), {"fields": ("primary_cta_label", "primary_cta_url")}),
        (_("Secondary CTA"), {"fields": ("secondary_cta_label", "secondary_cta_url")}),
        (_("Background"), {"fields": ("background_image",)}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
    )


@admin.register(AboutOrgStructureCard)
class AboutOrgStructureCardAdmin(admin.ModelAdmin):
    list_display = ("title", "color_theme", "section", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutOrgStructureBulletItemInline]
    fieldsets = (
        (_("Content"), {"fields": ("section", "icon", "icon_image", "color_theme", "title")}),
        (_("Link"), {"fields": ("view_more_label", "view_more_url")}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
    )


# ─── Contact Banner ───────────────────────────────────────────────────────────

class AboutContactBannerStatInline(admin.TabularInline):
    model = AboutContactBannerStat
    extra = 1
    fields = ("number", "label", "icon_key", "display_order", "is_active")


@admin.register(AboutContactBanner)
class AboutContactBannerAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [AboutContactBannerStatInline]
    fieldsets = (
        (_("Content"), {"fields": ("title", "description", "background_image")}),
        (_("CTAs"), {"fields": ("cta1_label", "cta1_url", "cta2_label", "cta2_url", "cta3_label", "cta3_url")}),
        (_("Quote"), {"fields": ("quote_text",)}),
        (_("Legacy Contact"), {"fields": ("hotline", "email", "facebook_url", "linkedin_url", "youtube_url"),
                           "classes": ("collapse",)}),
        (_("Status"), {"fields": ("is_active", "display_order")}),
    )
