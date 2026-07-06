"""Django admin registrations for the Solution module."""

from django.contrib import admin
from django.utils.html import format_html

from .models import (
    Solution,
    SolutionApproachStep,
    SolutionChallenge,
    SolutionFeature,
    SolutionListingPage,
    SolutionMethodologyStep,
    SolutionOutput,
)


# ─── Image preview helper ──────────────────────────────────────────────────

def _img_preview(image_field, height: int = 80) -> str:
    if image_field:
        return format_html(
            '<img src="{}" style="height:{}px;border-radius:4px;object-fit:cover;" />',
            image_field.url,
            height,
        )
    return "—"


# ─── Inlines ───────────────────────────────────────────────────────────────

class SolutionFeatureInline(admin.TabularInline):
    model = SolutionFeature
    extra = 1
    fields = ("label", "display_order", "is_active")


class SolutionChallengeInline(admin.TabularInline):
    model = SolutionChallenge
    extra = 1
    fields = ("number", "content", "display_order", "is_active")


class SolutionMethodologyStepInline(admin.TabularInline):
    model = SolutionMethodologyStep
    extra = 1
    fields = ("title", "description", "icon", "display_order", "is_active")


class SolutionOutputInline(admin.StackedInline):
    model = SolutionOutput
    extra = 1
    fields = ("number", "content", "image", "output_image_preview", "display_order", "is_active")
    readonly_fields = ("output_image_preview",)

    @admin.display(description="Image preview")
    def output_image_preview(self, obj):
        return _img_preview(obj.image, height=80) if obj.pk else "—"


# ─── Admin registrations ─────────────────────────────────────────────────────

@admin.register(SolutionListingPage)
class SolutionListingPageAdmin(admin.ModelAdmin):
    list_display = ("heading", "hero_image_preview", "is_active")
    readonly_fields = ("hero_image_preview",)
    fieldsets = (
        ("Hero", {"fields": ("section_label", "heading", "description", "hero_image", "hero_image_preview")}),
        ("CTA", {"fields": ("cta_primary_label", "cta_primary_url", "cta_secondary_label", "cta_secondary_url")}),
        ("Quick-nav", {"fields": ("quicknav_heading",)}),
        ("Approach Section", {"fields": ("approach_label", "approach_heading", "approach_description")}),
        ("SEO", {"fields": ("meta_title", "meta_description", "meta_keywords"), "classes": ("collapse",)}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )

    @admin.display(description="Hero preview")
    def hero_image_preview(self, obj):
        return _img_preview(obj.hero_image, height=80)


@admin.register(SolutionApproachStep)
class SolutionApproachStepAdmin(admin.ModelAdmin):
    list_display = ("number", "title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")


@admin.register(Solution)
class SolutionAdmin(admin.ModelAdmin):
    list_display = ("title", "slug", "thumbnail_preview", "is_published", "display_order", "is_active")
    list_editable = ("is_published", "display_order", "is_active")
    readonly_fields = ("thumbnail_preview", "hero_image_preview", "cta_image_preview")
    prepopulated_fields = {"slug": ("title",)}
    search_fields = ("title", "slug")
    filter_horizontal = ("related_capabilities",)
    inlines = [
        SolutionFeatureInline,
        SolutionChallengeInline,
        SolutionMethodologyStepInline,
        SolutionOutputInline,
    ]
    fieldsets = (
        ("Identity", {"fields": ("title", "slug", "section_label")}),
        ("Hero / Listing", {"fields": (
            "summary",
            "thumbnail", "thumbnail_preview",
            "hero_image", "hero_image_preview",
            "card_color",
            "description",
        )}),
        ("Section labels", {"fields": ("challenge_label", "methodology_label", "output_label", "capability_label")}),
        ("CTA", {"fields": ("cta_heading", "cta_sub", "cta_primary_label", "cta_primary_url", "cta_secondary_label", "cta_secondary_url", "cta_image", "cta_image_preview")}),
        ("Related Capabilities", {"fields": ("related_capabilities",)}),
        ("SEO", {"fields": ("meta_title", "meta_description", "meta_keywords"), "classes": ("collapse",)}),
        ("Status", {"fields": ("is_published", "is_active", "display_order")}),
    )

    @admin.display(description="Thumbnail")
    def thumbnail_preview(self, obj):
        return _img_preview(obj.thumbnail, height=60)

    @admin.display(description="Hero preview")
    def hero_image_preview(self, obj):
        return _img_preview(obj.hero_image, height=80)

    @admin.display(description="CTA preview")
    def cta_image_preview(self, obj):
        return _img_preview(obj.cta_image, height=60)
