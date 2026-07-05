"""Django admin registrations for the Solution module."""

from django.contrib import admin

from .models import (
    Solution,
    SolutionApproachStep,
    SolutionChallenge,
    SolutionFeature,
    SolutionListingPage,
    SolutionMethodologyStep,
    SolutionOutput,
)


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
    fields = ("title", "icon", "display_order", "is_active")


class SolutionOutputInline(admin.TabularInline):
    model = SolutionOutput
    extra = 1
    fields = ("number", "content", "display_order", "is_active")


# ─── Admin registrations ─────────────────────────────────────────────────────

@admin.register(SolutionListingPage)
class SolutionListingPageAdmin(admin.ModelAdmin):
    list_display = ("heading", "is_active")
    fieldsets = (
        ("Hero", {"fields": ("section_label", "heading", "description")}),
        ("CTA", {"fields": ("cta_primary_label", "cta_primary_url", "cta_secondary_label", "cta_secondary_url")}),
        ("Quick-nav", {"fields": ("quicknav_heading",)}),
        ("Approach Section", {"fields": ("approach_label", "approach_heading", "approach_description")}),
        ("Status", {"fields": ("is_active", "display_order")}),
    )


@admin.register(SolutionApproachStep)
class SolutionApproachStepAdmin(admin.ModelAdmin):
    list_display = ("number", "title", "display_order", "is_active")
    list_editable = ("display_order", "is_active")


@admin.register(Solution)
class SolutionAdmin(admin.ModelAdmin):
    list_display = ("title", "slug", "is_published", "display_order", "is_active")
    list_editable = ("is_published", "display_order", "is_active")
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
        ("Hero / Listing", {"fields": ("summary", "thumbnail", "hero_image", "description")}),
        ("Section labels", {"fields": ("challenge_label", "methodology_label", "output_label", "capability_label")}),
        ("CTA", {"fields": ("cta_heading", "cta_sub", "cta_primary_label", "cta_primary_url", "cta_secondary_label", "cta_secondary_url")}),
        ("Related Capabilities", {"fields": ("related_capabilities",)}),
        ("SEO", {"fields": ("meta_title", "meta_description", "meta_keywords"), "classes": ("collapse",)}),
        ("Status", {"fields": ("is_published", "is_active", "display_order")}),
    )
