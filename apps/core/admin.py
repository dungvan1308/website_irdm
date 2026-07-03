"""Django admin registrations for core shared models."""

from django.contrib import admin

from .models import FooterLink, FooterSection, MenuItem, SiteSettings


@admin.register(SiteSettings)
class SiteSettingsAdmin(admin.ModelAdmin):
    fieldsets = (
        (
            "Site Identity",
            {"fields": ("site_name", "site_tagline", "site_description", "logo", "logo_white", "favicon")},
        ),
        (
            "Contact",
            {"fields": ("email", "phone", "address")},
        ),
        (
            "Social Media",
            {"fields": ("linkedin_url", "twitter_url", "facebook_url", "youtube_url")},
        ),
        (
            "Status",
            {"fields": ("is_active", "display_order")},
        ),
    )


@admin.register(MenuItem)
class MenuItemAdmin(admin.ModelAdmin):
    list_display = ("label", "menu", "url", "parent", "display_order", "is_active")
    list_filter = ("menu", "is_active")
    list_editable = ("display_order", "is_active")
    search_fields = ("label", "url")
    ordering = ("menu", "display_order")


class FooterLinkInline(admin.TabularInline):
    model = FooterLink
    extra = 1
    fields = ("label", "url", "open_in_new_tab", "display_order", "is_active")


@admin.register(FooterSection)
class FooterSectionAdmin(admin.ModelAdmin):
    list_display = ("title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    inlines = [FooterLinkInline]
