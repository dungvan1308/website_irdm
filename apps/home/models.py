"""Homepage-specific CMS models."""

from django.db import models
from django.utils.translation import gettext_lazy as _

from apps.common.models import BaseModel


class HeroSection(BaseModel):
    """CMS-editable homepage hero banner section."""

    heading = models.CharField(_("heading"), max_length=300)
    subheading = models.CharField(_("subheading"), max_length=300, blank=True)
    description = models.TextField(_("description"), blank=True)
    primary_cta_label = models.CharField(_("primary CTA label"), max_length=100, blank=True)
    primary_cta_url = models.CharField(_("primary CTA URL"), max_length=500, blank=True)
    secondary_cta_label = models.CharField(_("secondary CTA label"), max_length=100, blank=True)
    secondary_cta_url = models.CharField(_("secondary CTA URL"), max_length=500, blank=True)
    background_image = models.ImageField(
        _("background image"), upload_to="home/hero/", blank=True
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("hero section")
        verbose_name_plural = _("hero sections")

    def __str__(self) -> str:
        return self.heading


class StatisticItem(BaseModel):
    """A single key metric displayed in the statistics strip."""

    value = models.CharField(_("value"), max_length=50, help_text=_("e.g. 200+"))
    label = models.CharField(_("label"), max_length=150)
    description = models.CharField(_("description"), max_length=300, blank=True)
    icon = models.CharField(
        _("icon CSS class / name"),
        max_length=100,
        blank=True,
        help_text=_("Heroicon name, e.g. chart-bar"),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("statistic item")
        verbose_name_plural = _("statistic items")

    def __str__(self) -> str:
        return f"{self.value} — {self.label}"


class PartnerLogo(BaseModel):
    """Partner or client logo displayed in the logo strip."""

    name = models.CharField(_("name"), max_length=200)
    logo = models.ImageField(_("logo"), upload_to="home/partners/")
    website_url = models.URLField(_("website URL"), blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("partner logo")
        verbose_name_plural = _("partner logos")

    def __str__(self) -> str:
        return self.name


class FeaturedSectionConfig(BaseModel):
    """Controls visibility and headings for each featured content section on the Homepage."""

    SECTION_SOLUTIONS = "solutions"
    SECTION_CAPABILITIES = "capabilities"
    SECTION_EXPERTS = "experts"
    SECTION_INSIGHTS = "insights"
    SECTION_EVENTS = "events"
    SECTION_RESOURCES = "resources"

    SECTION_CHOICES = [
        (SECTION_SOLUTIONS, _("Featured Solutions")),
        (SECTION_CAPABILITIES, _("Featured Capabilities")),
        (SECTION_EXPERTS, _("Featured Experts")),
        (SECTION_INSIGHTS, _("Featured Insights")),
        (SECTION_EVENTS, _("Featured Events")),
        (SECTION_RESOURCES, _("Featured Resources")),
    ]

    section_key = models.CharField(
        _("section"),
        max_length=30,
        choices=SECTION_CHOICES,
        unique=True,
        db_index=True,
    )
    title = models.CharField(_("title"), max_length=200)
    subtitle = models.CharField(_("subtitle"), max_length=400, blank=True)
    cta_label = models.CharField(_("CTA label"), max_length=100, blank=True)
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)
    is_visible = models.BooleanField(_("visible"), default=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("featured section config")
        verbose_name_plural = _("featured section configs")

    def __str__(self) -> str:
        return self.get_section_key_display()
