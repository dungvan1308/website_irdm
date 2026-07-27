"""Django admin registrations for the Expert module."""

from django.contrib import admin

from .models import (
    Expert,
    ExpertGroup,
    ExpertListingPage,
    KnowledgeTopic,
    ProcessStep,
    ResearchArea,
)


# ─── Inlines ──────────────────────────────────────────────────────────────────

class ProcessStepInline(admin.TabularInline):
    model = ProcessStep
    extra = 1
    fields = ("step_number", "title", "icon", "description", "display_order", "is_active")


# ─── Admin registrations ──────────────────────────────────────────────────────

@admin.register(ExpertListingPage)
class ExpertListingPageAdmin(admin.ModelAdmin):
    list_display = ("hero_heading", "is_active")
    fieldsets = (
        ("Hero", {
            "fields": (
                "hero_eyebrow", "hero_heading", "hero_description", "hero_image",
                "hero_btn1_label", "hero_btn1_url",
                "hero_btn2_label", "hero_btn2_url",
            ),
        }),
        ("Process Section", {
            "fields": ("process_heading", "process_description"),
        }),
        ("Senior Experts Section", {
            "fields": ("senior_heading", "senior_cta_label", "senior_cta_url"),
        }),
        ("Research Area Map Section", {
            "fields": ("map_heading", "map_description"),
        }),
        ("Expert Directory Section", {
            "fields": ("directory_heading",),
        }),
        ("Knowledge Topics Section", {
            "fields": ("topic_heading", "topic_description"),
        }),
        ("CTA Section", {
            "fields": (
                "cta_eyebrow", "cta_heading", "cta_description", "cta_bg_image",
                "cta_btn1_label", "cta_btn1_url",
                "cta_btn2_label", "cta_btn2_url",
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


@admin.register(ExpertGroup)
class ExpertGroupAdmin(admin.ModelAdmin):
    list_display = ("name", "slug", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    prepopulated_fields = {"slug": ("name",)}
    search_fields = ("name",)


@admin.register(ResearchArea)
class ResearchAreaAdmin(admin.ModelAdmin):
    list_display = ("name", "slug", "icon", "color", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    prepopulated_fields = {"slug": ("name",)}
    search_fields = ("name",)


@admin.register(ProcessStep)
class ProcessStepAdmin(admin.ModelAdmin):
    list_display = ("step_number", "title", "icon", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    ordering = ("step_number",)


@admin.register(KnowledgeTopic)
class KnowledgeTopicAdmin(admin.ModelAdmin):
    list_display = ("name", "slug", "display_order", "is_active")
    list_editable = ("display_order", "is_active")
    prepopulated_fields = {"slug": ("name",)}
    search_fields = ("name",)


@admin.register(Expert)
class ExpertAdmin(admin.ModelAdmin):
    list_display = (
        "display_name", "group", "organization",
        "is_senior", "is_featured", "is_published", "display_order", "is_active",
    )
    list_editable = ("is_senior", "is_featured", "is_published", "display_order", "is_active")
    list_filter = ("group", "is_senior", "is_featured", "is_published", "research_areas")
    search_fields = ("name", "position", "organization")
    prepopulated_fields = {"slug": ("name",)}
    filter_horizontal = ("research_areas", "knowledge_topics")
    fieldsets = (
        ("Identity", {
            "fields": ("name", "slug", "academic_title", "position", "organization"),
        }),
        ("Media", {
            "fields": ("avatar",),
        }),
        ("Content", {
            "fields": ("short_bio", "full_bio"),
        }),
        ("Contact", {
            "fields": ("email", "profile_url"),
        }),
        ("Classification", {
            "fields": ("group", "research_areas", "knowledge_topics"),
        }),
        ("Status", {
            "fields": ("is_published", "is_featured", "is_senior", "is_active", "display_order"),
        }),
    )
