"""Capability domain models — core business taxonomy for the IRDM Website."""

import uuid

from django.db import models
from django.utils.translation import gettext_lazy as _

from apps.common.models import BaseModel


# ─── Listing page CMS ─────────────────────────────────────────────────────────

class CapabilityListingPage(BaseModel):
    """CMS-editable header/hero for the capability listing page."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    heading = models.CharField(_("heading"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    overview_heading = models.CharField(_("overview heading"), max_length=300, blank=True)
    overview_description = models.TextField(_("overview description"), blank=True)
    cta_label = models.CharField(_("CTA label"), max_length=100, blank=True)
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("capability listing page")
        verbose_name_plural = _("capability listing pages")

    def __str__(self) -> str:
        return self.heading


# ─── Capability ───────────────────────────────────────────────────────────────

class Capability(BaseModel):
    """Core Capability entity — central business domain and taxonomy."""

    # Identity
    title = models.CharField(_("title"), max_length=300)
    slug = models.SlugField(_("slug"), max_length=300, unique=True, db_index=True)
    summary = models.TextField(
        _("summary"),
        blank=True,
        help_text=_("Short description shown on the listing card."),
    )
    thumbnail = models.ImageField(
        _("thumbnail"), upload_to="capability/thumbnails/", blank=True
    )
    hero_image = models.ImageField(
        _("hero image"), upload_to="capability/hero/", blank=True,
        help_text=_("Background image for the detail page hero."),
    )

    # Hero / Overview
    section_label = models.CharField(
        _("section label"), max_length=200, blank=True,
        help_text=_("Small label above the heading, e.g. 'Nền tảng chuyên môn'"),
    )
    description = models.TextField(
        _("description"), blank=True,
        help_text=_("Detailed description for the detail page hero."),
    )

    # What-is section
    what_is_label = models.CharField(
        _("'What is' section label"), max_length=200,
        default="Năng lực này là gì?",
    )
    what_is_description = models.TextField(
        _("'What is' description"), blank=True
    )

    # When-needed section
    need_section_label = models.CharField(
        _("'When needed' section label"), max_length=200,
        default="Khi nào tổ chức cần năng lực này?",
    )

    # How-we-work section
    how_label = models.CharField(
        _("'How IRDM helps' section label"), max_length=200,
        default="Viện IRDM đồng hành như thế nào?",
    )

    # Outputs section
    output_label = models.CharField(
        _("'Outputs' section label"), max_length=200,
        default="Đầu ra có thể bao gồm",
    )

    # CTA buttons on detail page
    cta_primary_label = models.CharField(_("primary CTA label"), max_length=100, blank=True)
    cta_primary_url = models.CharField(_("primary CTA URL"), max_length=500, blank=True)
    cta_secondary_label = models.CharField(_("secondary CTA label"), max_length=100, blank=True)
    cta_secondary_url = models.CharField(_("secondary CTA URL"), max_length=500, blank=True)

    # Publish status
    is_published = models.BooleanField(_("published"), default=False, db_index=True)

    # SEO
    meta_title = models.CharField(_("meta title"), max_length=200, blank=True)
    meta_description = models.CharField(_("meta description"), max_length=300, blank=True)
    meta_keywords = models.CharField(_("meta keywords"), max_length=300, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("capability")
        verbose_name_plural = _("capabilities")

    def __str__(self) -> str:
        return self.title

    def get_absolute_url(self) -> str:
        from django.urls import reverse
        return reverse("capability:detail", kwargs={"slug": self.slug})


# ─── Feature Tags ─────────────────────────────────────────────────────────────

class CapabilityFeature(BaseModel):
    """Topic tag pill displayed on a capability card and detail page."""

    capability = models.ForeignKey(
        Capability,
        on_delete=models.CASCADE,
        related_name="features",
        verbose_name=_("capability"),
    )
    label = models.CharField(_("label"), max_length=100)

    class Meta(BaseModel.Meta):
        verbose_name = _("capability feature")
        verbose_name_plural = _("capability features")

    def __str__(self) -> str:
        return f"{self.capability.title} — {self.label}"


# ─── Need Items ───────────────────────────────────────────────────────────────

class CapabilityNeedItem(BaseModel):
    """A numbered item in the 'When does org need this capability?' section."""

    capability = models.ForeignKey(
        Capability,
        on_delete=models.CASCADE,
        related_name="need_items",
        verbose_name=_("capability"),
    )
    number = models.PositiveSmallIntegerField(_("number"))
    content = models.TextField(_("content"))

    class Meta(BaseModel.Meta):
        verbose_name = _("capability need item")
        verbose_name_plural = _("capability need items")

    def __str__(self) -> str:
        return f"{self.capability.title} — {self.number:02d}"


# ─── How-We-Work Steps ────────────────────────────────────────────────────────

class CapabilityHowStep(BaseModel):
    """A bullet step describing how IRDM accompanies the client."""

    capability = models.ForeignKey(
        Capability,
        on_delete=models.CASCADE,
        related_name="how_steps",
        verbose_name=_("capability"),
    )
    title = models.CharField(_("title"), max_length=200)
    icon = models.CharField(
        _("icon"), max_length=100, blank=True,
        help_text=_("Heroicon name, e.g. magnifying-glass"),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("capability how step")
        verbose_name_plural = _("capability how steps")

    def __str__(self) -> str:
        return f"{self.capability.title} — {self.title}"


# ─── Outputs ──────────────────────────────────────────────────────────────────

class CapabilityOutput(BaseModel):
    """A numbered output item in the 'Possible outputs' section."""

    capability = models.ForeignKey(
        Capability,
        on_delete=models.CASCADE,
        related_name="outputs",
        verbose_name=_("capability"),
    )
    number = models.PositiveSmallIntegerField(_("number"))
    content = models.TextField(_("content"))

    class Meta(BaseModel.Meta):
        verbose_name = _("capability output")
        verbose_name_plural = _("capability outputs")

    def __str__(self) -> str:
        return f"{self.capability.title} — output {self.number:02d}"


# ─── Case Study ───────────────────────────────────────────────────────────────

class CapabilityCaseStudy(BaseModel):
    """Mini case study ('Mini case tiêu biểu') for a capability."""

    capability = models.ForeignKey(
        Capability,
        on_delete=models.CASCADE,
        related_name="case_studies",
        verbose_name=_("capability"),
    )
    number = models.PositiveSmallIntegerField(_("number"), default=1)
    category_label = models.CharField(
        _("category label"), max_length=200,
        blank=True,
        help_text=_("e.g. 'Bệnh viện & KHCN'"),
    )
    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    cta_primary_label = models.CharField(_("primary CTA label"), max_length=100, blank=True)
    cta_primary_url = models.CharField(_("primary CTA URL"), max_length=500, blank=True)
    cta_secondary_label = models.CharField(_("secondary CTA label"), max_length=100, blank=True)
    cta_secondary_url = models.CharField(_("secondary CTA URL"), max_length=500, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("capability case study")
        verbose_name_plural = _("capability case studies")

    def __str__(self) -> str:
        return f"{self.capability.title} — case {self.number:02d}"


class CapabilityCaseStudyTag(BaseModel):
    """A tag pill displayed on a case study card."""

    case_study = models.ForeignKey(
        CapabilityCaseStudy,
        on_delete=models.CASCADE,
        related_name="tags",
        verbose_name=_("case study"),
    )
    label = models.CharField(_("label"), max_length=100)

    class Meta(BaseModel.Meta):
        verbose_name = _("case study tag")
        verbose_name_plural = _("case study tags")

    def __str__(self) -> str:
        return self.label
