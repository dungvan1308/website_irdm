"""Homepage-specific CMS models."""

from django.db import models
from django.utils.translation import gettext_lazy as _

from apps.common.models import BaseModel


class HeroSection(BaseModel):
    """CMS-editable homepage hero banner section."""

    eyebrow_text = models.CharField(
        _("eyebrow text"), max_length=300, blank=True,
        help_text=_("Small label shown above the heading (e.g. institute type)")
    )
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
    quote_strip_text = models.CharField(
        _("quote strip text"), max_length=300, blank=True,
        help_text=_("Quote shown in the dark strip at the bottom of the hero")
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("hero section")
        verbose_name_plural = _("hero sections")

    def __str__(self) -> str:
        return self.heading


class HeroPillTag(BaseModel):
    """A pill tag displayed below the hero CTA buttons."""

    hero = models.ForeignKey(
        HeroSection,
        on_delete=models.CASCADE,
        related_name="pill_tags",
        verbose_name=_("hero section"),
    )
    label = models.CharField(_("label"), max_length=100)

    class Meta(BaseModel.Meta):
        verbose_name = _("hero pill tag")
        verbose_name_plural = _("hero pill tags")

    def __str__(self) -> str:
        return self.label


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


# ─── Audience Section ─────────────────────────────────────────────────────────

class AudienceSegment(BaseModel):
    """An audience type card in the 'IRDM đồng hành với ai?' section."""

    icon = models.CharField(
        _("icon"), max_length=100, blank=True,
        help_text=_("Heroicon name, e.g. building-office")
    )
    image = models.ImageField(
        _("card image"), upload_to="home/audience/", blank=True,
        help_text=_("Illustration image shown on the audience card.")
    )
    title = models.CharField(_("title"), max_length=200)
    description = models.TextField(_("description"), blank=True)
    cta_label = models.CharField(_("CTA label"), max_length=100, blank=True)
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("audience segment")
        verbose_name_plural = _("audience segments")

    def __str__(self) -> str:
        return self.title


class AudienceTag(BaseModel):
    """A keyword tag displayed on an audience segment card."""

    segment = models.ForeignKey(
        AudienceSegment,
        on_delete=models.CASCADE,
        related_name="tags",
        verbose_name=_("segment"),
    )
    label = models.CharField(_("label"), max_length=100)

    class Meta(BaseModel.Meta):
        verbose_name = _("audience tag")
        verbose_name_plural = _("audience tags")

    def __str__(self) -> str:
        return f"{self.segment.title} — {self.label}"


# ─── Audience Section Header ───────────────────────────────────────────────────

class AudienceSectionHeader(BaseModel):
    """CMS-editable header for the 'IRDM đồng hành với ai?' section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    heading = models.CharField(_("heading"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    cta_label = models.CharField(_("CTA label"), max_length=100, blank=True)
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("audience section header")
        verbose_name_plural = _("audience section headers")

    def __str__(self) -> str:
        return self.heading


# ─── Methodology Section ──────────────────────────────────────────────────────

class MethodologySectionHeader(BaseModel):
    """CMS-editable header for the methodology / working approach section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    heading = models.CharField(_("heading"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    cta_label = models.CharField(_("CTA label"), max_length=100, blank=True)
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("methodology section header")
        verbose_name_plural = _("methodology section headers")

    def __str__(self) -> str:
        return self.heading


class MethodologyStep(BaseModel):
    """A single step in the IRDM working methodology (5-step process)."""

    step_number = models.PositiveSmallIntegerField(_("step number"))
    icon = models.CharField(
        _("icon"), max_length=100, blank=True,
        help_text=_("Heroicon name, e.g. magnifying-glass")
    )
    title = models.CharField(_("title"), max_length=200)
    body = models.TextField(_("body"), blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("methodology step")
        verbose_name_plural = _("methodology steps")

    def __str__(self) -> str:
        return f"{self.step_number}. {self.title}"


# ─── Core Capabilities Section ────────────────────────────────────────────────

class CapabilitiesSectionHeader(BaseModel):
    """CMS-editable header for the core capabilities section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    heading = models.CharField(_("heading"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    cta_label = models.CharField(_("CTA label"), max_length=100, blank=True)
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("capabilities section header")
        verbose_name_plural = _("capabilities section headers")

    def __str__(self) -> str:
        return self.heading


class CoreCapability(BaseModel):
    """A core capability card displayed in the capabilities section."""

    icon = models.CharField(
        _("icon"), max_length=100, blank=True,
        help_text=_("Heroicon name, e.g. cpu-chip")
    )
    title = models.CharField(_("title"), max_length=200)
    description = models.TextField(_("description"), blank=True)
    background_image = models.ImageField(
        _("background image"), upload_to="home/capabilities/", blank=True
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("core capability")
        verbose_name_plural = _("core capabilities")

    def __str__(self) -> str:
        return self.title


# ─── Philosophy Section ───────────────────────────────────────────────────────

class PhilosophySectionHeader(BaseModel):
    """CMS-editable header for the philosophy & approach section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    heading = models.CharField(_("heading"), max_length=300)
    description = models.TextField(_("description"), blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("philosophy section header")
        verbose_name_plural = _("philosophy section headers")

    def __str__(self) -> str:
        return self.heading


class PhilosophyPrinciple(BaseModel):
    """A single principle card in the philosophy & approach section."""

    number = models.PositiveSmallIntegerField(_("number"))
    icon = models.CharField(
        _("icon"), max_length=100, blank=True,
        help_text=_("Heroicon name, e.g. link")
    )
    title = models.CharField(_("title"), max_length=200)
    body = models.TextField(_("body"), blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("philosophy principle")
        verbose_name_plural = _("philosophy principles")

    def __str__(self) -> str:
        return f"{self.number:02d}. {self.title}"


# ─── Evidence / Partners Section ─────────────────────────────────────────────

class EvidenceSectionHeader(BaseModel):
    """CMS-editable header for the partners/evidence section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    heading = models.CharField(_("heading"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    cta_label = models.CharField(_("CTA label"), max_length=100, blank=True)
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)
    partners_label = models.CharField(
        _("featured partners label"), max_length=100, blank=True,
        default="ĐỐI TÁC TIÊU BIỂU"
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("evidence section header")
        verbose_name_plural = _("evidence section headers")

    def __str__(self) -> str:
        return self.heading


# ─── Knowledge Section ────────────────────────────────────────────────────────

class KnowledgeSectionHeader(BaseModel):
    """CMS-editable header for the knowledge & forums section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    heading = models.CharField(_("heading"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    cta_label = models.CharField(_("CTA label"), max_length=100, blank=True)
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("knowledge section header")
        verbose_name_plural = _("knowledge section headers")

    def __str__(self) -> str:
        return self.heading


class KnowledgeCategory(BaseModel):
    """A content category card in the knowledge section."""

    icon = models.CharField(
        _("icon"), max_length=100, blank=True,
        help_text=_("Heroicon name, e.g. document-text")
    )
    category_label = models.CharField(_("category label"), max_length=100)
    title = models.CharField(_("title"), max_length=200)
    image = models.ImageField(
        _("card image"), upload_to="home/knowledge/", blank=True,
        help_text=_("Image shown at the bottom of the knowledge category card.")
    )
    cta_label = models.CharField(_("CTA label"), max_length=100, blank=True)
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("knowledge category")
        verbose_name_plural = _("knowledge categories")

    def __str__(self) -> str:
        return self.category_label


# ─── CTA Banner Section ───────────────────────────────────────────────────────

class CTABanner(BaseModel):
    """Full-width call-to-action banner section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    heading = models.CharField(_("heading"), max_length=400)
    description = models.TextField(_("description"), blank=True)
    cta_label = models.CharField(_("CTA label"), max_length=100, blank=True)
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)
    background_image = models.ImageField(
        _("background image"), upload_to="home/cta/", blank=True
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("CTA banner")
        verbose_name_plural = _("CTA banners")

    def __str__(self) -> str:
        return self.heading

