"""Django admin registrations for homepage CMS models."""

from django.contrib import admin

from .models import FeaturedSectionConfig, HeroSection, PartnerLogo, StatisticItem


@admin.register(HeroSection)
class HeroSectionAdmin(admin.ModelAdmin):
    list_display = ("heading", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    fieldsets = (
        (
            "Content",
            {"fields": ("heading", "subheading", "description", "background_image")},
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
        (
            "Section",
            {"fields": ("section_key",)},
        ),
        (
            "Content",
            {"fields": ("title", "subtitle", "cta_label", "cta_url")},
        ),
        (
            "Status",
            {"fields": ("is_visible", "is_active", "display_order")},
        ),
    )
