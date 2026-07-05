"""Solution domain models — business entry point for the IRDM Website."""

from django.db import models
from django.utils.translation import gettext_lazy as _

from apps.common.models import BaseModel


# ─── Listing page CMS ─────────────────────────────────────────────────────────

class SolutionListingPage(BaseModel):
    """CMS-editable header/hero for the solution landing page (/giai-phap/)."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    heading = models.CharField(_("heading"), max_length=300)
    hero_image = models.ImageField(_("hero image"), upload_to="solution/listing/", blank=True,
                                   help_text=_("Illustration shown in the right column of the hero section."))
    description = models.TextField(_("description"), blank=True)
    cta_primary_label = models.CharField(_("primary CTA label"), max_length=100, blank=True)
    cta_primary_url = models.CharField(_("primary CTA URL"), max_length=500, blank=True)
    cta_secondary_label = models.CharField(_("secondary CTA label"), max_length=100, blank=True)
    cta_secondary_url = models.CharField(_("secondary CTA URL"), max_length=500, blank=True)
    quicknav_heading = models.CharField(_("quick-nav heading"), max_length=300, blank=True)
    approach_label = models.CharField(_("approach section label"), max_length=200, blank=True)
    approach_heading = models.CharField(_("approach heading"), max_length=300, blank=True)
    approach_description = models.TextField(_("approach description"), blank=True)
    meta_title = models.CharField(_("meta title"), max_length=200, blank=True)
    meta_description = models.CharField(_("meta description"), max_length=300, blank=True)
    meta_keywords = models.CharField(_("meta keywords"), max_length=300, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("solution listing page")
        verbose_name_plural = _("solution listing pages")

    def __str__(self) -> str:
        return self.heading


# ─── Approach Steps ───────────────────────────────────────────────────────────

class SolutionApproachStep(BaseModel):
    """A step in the global IRDM approach shown on the landing page."""

    number = models.PositiveSmallIntegerField(_("number"))
    title = models.CharField(_("title"), max_length=200)
    description = models.TextField(_("description"), blank=True)
    icon = models.CharField(_("icon"), max_length=100, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("solution approach step")
        verbose_name_plural = _("solution approach steps")

    def __str__(self) -> str:
        return f"{self.number:02d}. {self.title}"


# ─── Solution ─────────────────────────────────────────────────────────────────

class Solution(BaseModel):
    """A Solution targeting a specific customer segment."""

    title = models.CharField(_("title"), max_length=300)
    slug = models.SlugField(_("slug"), max_length=300, unique=True, db_index=True)
    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    summary = models.TextField(_("summary"), blank=True)
    thumbnail = models.ImageField(_("thumbnail"), upload_to="solution/thumbnails/", blank=True)
    hero_image = models.ImageField(_("hero image"), upload_to="solution/hero/", blank=True)
    description = models.TextField(_("description"), blank=True)

    challenge_label = models.CharField(_("challenge label"), max_length=200, default="Các thách thức trọng tâm")
    methodology_label = models.CharField(_("methodology label"), max_length=200, default="Viện IRDM đồng hành như thế nào?")
    output_label = models.CharField(_("output label"), max_length=200, default="Đầu ra có thể bao gồm")
    capability_label = models.CharField(_("capability label"), max_length=200, default="Năng lực liên quan")

    cta_heading = models.CharField(_("CTA heading"), max_length=200, blank=True)
    cta_sub = models.CharField(_("CTA sub-heading"), max_length=200, blank=True)
    cta_primary_label = models.CharField(_("primary CTA label"), max_length=100, blank=True)
    cta_primary_url = models.CharField(_("primary CTA URL"), max_length=500, blank=True)
    cta_secondary_label = models.CharField(_("secondary CTA label"), max_length=100, blank=True)
    cta_secondary_url = models.CharField(_("secondary CTA URL"), max_length=500, blank=True)
    cta_image = models.ImageField(_("CTA background image"), upload_to="solution/cta/", blank=True,
                                  help_text=_("Background image for the CTA section at the bottom of the detail page."))

    related_capabilities = models.ManyToManyField(
        "capability.Capability",
        blank=True,
        related_name="solutions",
        verbose_name=_("related capabilities"),
    )

    is_published = models.BooleanField(_("published"), default=False, db_index=True)
    meta_title = models.CharField(_("meta title"), max_length=200, blank=True)
    meta_description = models.CharField(_("meta description"), max_length=300, blank=True)
    meta_keywords = models.CharField(_("meta keywords"), max_length=300, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("solution")
        verbose_name_plural = _("solutions")

    def __str__(self) -> str:
        return self.title

    def get_absolute_url(self) -> str:
        from django.urls import reverse
        return reverse("solution:detail", kwargs={"slug": self.slug})


# ─── Feature Tags ─────────────────────────────────────────────────────────────

class SolutionFeature(BaseModel):
    """Topic tag pill for a solution card."""

    solution = models.ForeignKey(Solution, on_delete=models.CASCADE, related_name="features", verbose_name=_("solution"))
    label = models.CharField(_("label"), max_length=100)

    class Meta(BaseModel.Meta):
        verbose_name = _("solution feature")
        verbose_name_plural = _("solution features")

    def __str__(self) -> str:
        return f"{self.solution.title} — {self.label}"


# ─── Challenges ───────────────────────────────────────────────────────────────

class SolutionChallenge(BaseModel):
    """A challenge item in the detail page."""

    solution = models.ForeignKey(Solution, on_delete=models.CASCADE, related_name="challenges", verbose_name=_("solution"))
    number = models.PositiveSmallIntegerField(_("number"))
    content = models.TextField(_("content"))

    class Meta(BaseModel.Meta):
        verbose_name = _("solution challenge")
        verbose_name_plural = _("solution challenges")

    def __str__(self) -> str:
        return f"{self.solution.title} — challenge {self.number:02d}"


# ─── Methodology Steps ────────────────────────────────────────────────────────

class SolutionMethodologyStep(BaseModel):
    """How IRDM delivers this solution."""

    solution = models.ForeignKey(Solution, on_delete=models.CASCADE, related_name="methodology_steps", verbose_name=_("solution"))
    title = models.CharField(_("title"), max_length=200)
    icon = models.CharField(_("icon"), max_length=100, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("solution methodology step")
        verbose_name_plural = _("solution methodology steps")

    def __str__(self) -> str:
        return f"{self.solution.title} — {self.title}"


# ─── Outputs ──────────────────────────────────────────────────────────────────

class SolutionOutput(BaseModel):
    """A numbered deliverable output."""

    solution = models.ForeignKey(Solution, on_delete=models.CASCADE, related_name="outputs", verbose_name=_("solution"))
    number = models.PositiveSmallIntegerField(_("number"))
    content = models.TextField(_("content"))

    class Meta(BaseModel.Meta):
        verbose_name = _("solution output")
        verbose_name_plural = _("solution outputs")

    def __str__(self) -> str:
        return f"{self.solution.title} — output {self.number:02d}"
