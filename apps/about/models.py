"""About page CMS models."""

from django.db import models
from django.utils.translation import gettext_lazy as _

from apps.common.models import BaseModel


# ─── SEO ──────────────────────────────────────────────────────────────────────

class AboutPageSEO(BaseModel):
    """SEO & Open Graph meta for the /ve-irdm/ page."""

    meta_title = models.CharField(_("meta title"), max_length=200, blank=True)
    meta_description = models.TextField(_("meta description"), blank=True)
    meta_keywords = models.CharField(_("meta keywords"), max_length=500, blank=True)
    og_title = models.CharField(_("OG title"), max_length=200, blank=True)
    og_description = models.TextField(_("OG description"), blank=True)
    og_image = models.ImageField(_("OG image"), upload_to="about/seo/", blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("About Page SEO")
        verbose_name_plural = _("About Page SEO")

    def __str__(self) -> str:
        return self.meta_title or "About Page SEO"


# ─── Section 1: Hero ──────────────────────────────────────────────────────────

class AboutHero(BaseModel):
    """CMS model for the About page hero banner."""

    eyebrow = models.CharField(_("eyebrow label"), max_length=200, blank=True)
    title = models.CharField(_("title"), max_length=300)
    subtitle = models.CharField(_("subtitle"), max_length=400, blank=True)
    description = models.TextField(_("description"), blank=True)
    background_image = models.ImageField(_("background image"), upload_to="about/hero/", blank=True)
    foreground_image = models.ImageField(_("foreground illustration"), upload_to="about/hero/", blank=True)
    primary_cta_label = models.CharField(_("primary CTA label"), max_length=100, blank=True)
    primary_cta_url = models.CharField(_("primary CTA URL"), max_length=500, blank=True)
    secondary_cta_label = models.CharField(_("secondary CTA label"), max_length=100, blank=True)
    secondary_cta_url = models.CharField(_("secondary CTA URL"), max_length=500, blank=True)
    quote_text = models.CharField(_("quote text"), max_length=500, blank=True,
                                  help_text=_("Short inspirational quote shown below the CTA buttons"))
    quote_icon = models.ImageField(_("quote icon"), upload_to="about/hero/quote/", blank=True,
                                   help_text=_("Icon image shown left of the quote (PNG/SVG ~28×28px). Falls back to default chat-bubble icon if empty."))
    quote_show = models.BooleanField(_("show quote"), default=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("hero banner")
        verbose_name_plural = _("hero banners")

    def __str__(self) -> str:
        return self.title


class AboutHeroStatistic(BaseModel):
    """A key statistic shown in the hero section."""

    hero = models.ForeignKey(
        AboutHero, on_delete=models.CASCADE,
        related_name="statistics", verbose_name=_("hero"),
    )
    number = models.CharField(_("number"), max_length=50, help_text=_("e.g. 500+"))
    label = models.CharField(_("label"), max_length=150)
    animation_enabled = models.BooleanField(_("counter animation"), default=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("hero statistic")
        verbose_name_plural = _("hero statistics")

    def __str__(self) -> str:
        return f"{self.number} — {self.label}"


# ─── Section 2: Introduction ──────────────────────────────────────────────────

class AboutIntroduction(BaseModel):
    """CMS for the IRDM Introduction section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    title = models.CharField(_("title"), max_length=300)
    subtitle = models.CharField(_("subtitle"), max_length=400, blank=True)
    description = models.TextField(_("description"), blank=True)
    image = models.ImageField(_("large image"), upload_to="about/intro/", blank=True)
    image_alt = models.CharField(_("image alt text"), max_length=300, blank=True)
    background_image = models.ImageField(_("background image"), upload_to="about/intro/bg/", blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("introduction section")
        verbose_name_plural = _("introduction sections")

    def __str__(self) -> str:
        return self.title


class AboutHighlightCard(BaseModel):
    """A highlight card in the Introduction section."""

    intro = models.ForeignKey(
        AboutIntroduction, on_delete=models.CASCADE,
        related_name="highlight_cards", verbose_name=_("introduction"),
    )
    icon = models.CharField(_("icon (heroicon name)"), max_length=100, blank=True)
    icon_image = models.ImageField(_("icon image"), upload_to="about/intro/icons/", blank=True)
    title = models.CharField(_("title"), max_length=200)
    description = models.TextField(_("description"), blank=True)
    color = models.CharField(_("color theme"), max_length=50, blank=True, help_text=_("Tailwind color name, e.g. blue"))

    class Meta(BaseModel.Meta):
        verbose_name = _("highlight card")
        verbose_name_plural = _("highlight cards")

    def __str__(self) -> str:
        return self.title


# ─── Section 3: Purpose ───────────────────────────────────────────────────────

class AboutPurpose(BaseModel):
    """CMS for the 'Why IRDM Exists' section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    # Quote block
    highlight_box_text = models.TextField(_("quote text (bold)"), blank=True)
    quote_icon = models.ImageField(_("quote icon image"), upload_to="about/purpose/icons/", blank=True)
    quote_body = models.TextField(_("quote body text"), blank=True)
    # Diagram card (right column)
    diagram_title = models.CharField(_("diagram card title"), max_length=200, blank=True)
    diagram_image = models.ImageField(_("diagram image"), upload_to="about/purpose/", blank=True)
    diagram_alt = models.CharField(_("diagram alt text"), max_length=300, blank=True)
    diagram_caption = models.CharField(_("diagram caption"), max_length=400, blank=True)
    # Background
    background_image = models.ImageField(_("background image"), upload_to="about/purpose/bg/", blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("purpose section")
        verbose_name_plural = _("purpose sections")

    def __str__(self) -> str:
        return self.title


# ─── Section 4: Vision / Mission / Philosophy ─────────────────────────────────

class AboutVisionMission(BaseModel):
    """Container for the Vision / Mission / Development Philosophy section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    bottom_panel_text = models.TextField(_("bottom panel text"), blank=True)
    bottom_panel_title = models.CharField(_("bottom panel title"), max_length=200, blank=True)
    bottom_panel_description = models.TextField(_("bottom panel description"), blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("vision & mission section")
        verbose_name_plural = _("vision & mission sections")

    def __str__(self) -> str:
        return self.title


class AboutVisionMissionCard(BaseModel):
    """A single Vision / Mission / Philosophy card."""

    CARD_VISION = "vision"
    CARD_MISSION = "mission"
    CARD_PHILOSOPHY = "philosophy"
    CARD_CHOICES = [
        (CARD_VISION, _("Vision")),
        (CARD_MISSION, _("Mission")),
        (CARD_PHILOSOPHY, _("Development Philosophy")),
    ]

    section = models.ForeignKey(
        AboutVisionMission, on_delete=models.CASCADE,
        related_name="cards", verbose_name=_("section"),
    )
    card_type = models.CharField(_("card type"), max_length=20, choices=CARD_CHOICES)
    icon = models.CharField(_("icon (heroicon name)"), max_length=100, blank=True)
    icon_image = models.ImageField(_("icon image"), upload_to="about/vision/icons/", blank=True)
    title = models.CharField(_("title"), max_length=200)
    body = models.TextField(_("body"), blank=True)
    highlight_label = models.CharField(_("highlight label"), max_length=200, blank=True,
                                       help_text=_("Short label shown at card bottom e.g. 'Định hướng tương lai'"))
    bg_color = models.CharField(_("background color class"), max_length=100, blank=True,
                                help_text=_("Tailwind class e.g. bg-primary-900"))

    class Meta(BaseModel.Meta):
        verbose_name = _("vision/mission card")
        verbose_name_plural = _("vision/mission cards")

    def __str__(self) -> str:
        return f"{self.get_card_type_display()}: {self.title}"


class AboutVisionMissionIcon(BaseModel):
    """An icon displayed in the bottom panel of the Vision/Mission section."""

    section = models.ForeignKey(
        AboutVisionMission, on_delete=models.CASCADE,
        related_name="bottom_icons", verbose_name=_("section"),
    )
    icon_image = models.ImageField(_("icon image"), upload_to="about/vision/panel_icons/", blank=True)
    icon_alt = models.CharField(_("icon alt text"), max_length=200, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("vision/mission panel icon")
        verbose_name_plural = _("vision/mission panel icons")

    def __str__(self) -> str:
        return self.icon_alt or f"Icon {self.display_order}"


# ─── Section 5: Core Values ───────────────────────────────────────────────────

class AboutCoreValue(BaseModel):
    """A core value item."""

    icon = models.CharField(_("icon (heroicon name)"), max_length=100, blank=True)
    icon_image = models.ImageField(_("icon image"), upload_to="about/values/icons/", blank=True)
    title = models.CharField(_("title"), max_length=200)
    description = models.TextField(_("description"), blank=True)
    color_theme = models.CharField(_("color theme"), max_length=100, blank=True,
                                   help_text=_("Tailwind color name e.g. orange, blue, green"))

    class Meta(BaseModel.Meta):
        verbose_name = _("core value")
        verbose_name_plural = _("core values")

    def __str__(self) -> str:
        return self.title


class AboutCoreValueSection(BaseModel):
    """Header/section config for Core Values."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    background_image = models.ImageField(_("background image"), upload_to="about/core_values/", blank=True,
                                         help_text=_("Optional background image overlaid on the Core Values section."))

    class Meta(BaseModel.Meta):
        verbose_name = _("core values section")
        verbose_name_plural = _("core values sections")

    def __str__(self) -> str:
        return self.title


# ─── Section 6: Legal Foundation ─────────────────────────────────────────────

class AboutLegalInfo(BaseModel):
    """CMS for the Legal Foundation section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    image = models.ImageField(_("left image"), upload_to="about/legal/", blank=True)
    image_alt = models.CharField(_("image alt text"), max_length=300, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("legal foundation section")
        verbose_name_plural = _("legal foundation sections")

    def __str__(self) -> str:
        return self.title


class AboutLegalTimelineItem(BaseModel):
    """A timeline item in the Legal Foundation section."""

    legal_info = models.ForeignKey(
        AboutLegalInfo, on_delete=models.CASCADE,
        related_name="timeline_items", verbose_name=_("legal section"),
    )
    year = models.CharField(_("year"), max_length=20)
    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    document_url = models.CharField(_("document URL"), max_length=500, blank=True)
    document_label = models.CharField(_("document link label"), max_length=100, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("legal timeline item")
        verbose_name_plural = _("legal timeline items")

    def __str__(self) -> str:
        return f"{self.year} — {self.title}"


# ─── Section 7: CTA Banner ────────────────────────────────────────────────────

class AboutCTABanner(BaseModel):
    """CMS for the mid-page CTA banner."""

    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    background_image = models.ImageField(_("background image"), upload_to="about/cta/", blank=True)
    primary_cta_label = models.CharField(_("primary CTA label"), max_length=100, blank=True)
    primary_cta_url = models.CharField(_("primary CTA URL"), max_length=500, blank=True)
    secondary_cta_label = models.CharField(_("secondary CTA label"), max_length=100, blank=True)
    secondary_cta_url = models.CharField(_("secondary CTA URL"), max_length=500, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("CTA banner")
        verbose_name_plural = _("CTA banners")

    def __str__(self) -> str:
        return self.title


# ─── Section 8: Partner Benefits ─────────────────────────────────────────────

class AboutPartnerBenefitSection(BaseModel):
    """Header for the 'Đối tác nhận được gì' section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("partner benefit section")
        verbose_name_plural = _("partner benefit sections")

    def __str__(self) -> str:
        return self.title


class AboutPartnerBenefit(BaseModel):
    """A benefit item for partners."""

    section = models.ForeignKey(
        AboutPartnerBenefitSection, on_delete=models.CASCADE,
        related_name="benefits", verbose_name=_("section"),
    )
    icon = models.CharField(_("icon (heroicon name)"), max_length=100, blank=True)
    icon_image = models.ImageField(_("icon image"), upload_to="about/benefits/icons/", blank=True)
    title = models.CharField(_("title"), max_length=200)
    description = models.TextField(_("description"), blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("partner benefit")
        verbose_name_plural = _("partner benefits")

    def __str__(self) -> str:
        return self.title


# ─── Section 9: Professional Network ─────────────────────────────────────────

class AboutProfessionalNetwork(BaseModel):
    """A partner/network organization displayed in the network section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True,
                                     help_text=_("Section heading override (first item used)"))
    logo = models.ImageField(_("logo"), upload_to="about/network/logos/", blank=True)
    name = models.CharField(_("name"), max_length=200)
    description = models.CharField(_("description"), max_length=300, blank=True)
    link_url = models.CharField(_("link URL"), max_length=500, blank=True)
    link_label = models.CharField(_("link label"), max_length=100, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("professional network")
        verbose_name_plural = _("professional networks")

    def __str__(self) -> str:
        return self.name


class AboutNetworkSectionHeader(BaseModel):
    """Header text for the professional network section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    cta_label = models.CharField(_("CTA label"), max_length=100, blank=True)
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("network section header")
        verbose_name_plural = _("network section headers")

    def __str__(self) -> str:
        return self.title


# ─── Section 10: Target Audience ─────────────────────────────────────────────

class AboutTargetAudienceSection(BaseModel):
    """Header for 'IRDM đồng hành cùng những ai' section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    cta_label = models.CharField(_("CTA label"), max_length=100, blank=True)
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("target audience section")
        verbose_name_plural = _("target audience sections")

    def __str__(self) -> str:
        return self.title


class AboutTargetAudience(BaseModel):
    """A target audience card."""

    section = models.ForeignKey(
        AboutTargetAudienceSection, on_delete=models.CASCADE,
        related_name="audiences", verbose_name=_("section"),
    )
    icon = models.CharField(_("icon (heroicon name)"), max_length=100, blank=True)
    icon_image = models.ImageField(_("icon image"), upload_to="about/audience/icons/", blank=True)
    image = models.ImageField(_("card image"), upload_to="about/audience/", blank=True)
    title = models.CharField(_("title"), max_length=200)
    description = models.TextField(_("description"), blank=True)
    cta_label = models.CharField(_("CTA label"), max_length=100, blank=True)
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("target audience")
        verbose_name_plural = _("target audiences")

    def __str__(self) -> str:
        return self.title


# ─── Section 11: Capability & Ecosystem ──────────────────────────────────────

class AboutCapabilityEcosystem(BaseModel):
    """Container for the Capability & Ecosystem section."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    diagram_image = models.ImageField(_("floating diagram"), upload_to="about/ecosystem/", blank=True)
    diagram_alt = models.CharField(_("diagram alt"), max_length=300, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("capability & ecosystem section")
        verbose_name_plural = _("capability & ecosystem sections")

    def __str__(self) -> str:
        return self.title


class AboutEcosystemPartnerGroup(BaseModel):
    """A partner group within the Capability & Ecosystem section."""

    ecosystem = models.ForeignKey(
        AboutCapabilityEcosystem, on_delete=models.CASCADE,
        related_name="partner_groups", verbose_name=_("ecosystem"),
    )
    title = models.CharField(_("group title"), max_length=200)
    color = models.CharField(_("color class"), max_length=100, blank=True,
                             help_text=_("Tailwind color e.g. blue, orange"))

    class Meta(BaseModel.Meta):
        verbose_name = _("ecosystem partner group")
        verbose_name_plural = _("ecosystem partner groups")

    def __str__(self) -> str:
        return self.title


class AboutEcosystemPartnerItem(BaseModel):
    """An item (partner/org) within an ecosystem partner group."""

    group = models.ForeignKey(
        AboutEcosystemPartnerGroup, on_delete=models.CASCADE,
        related_name="items", verbose_name=_("group"),
    )
    name = models.CharField(_("name"), max_length=200)
    logo = models.ImageField(_("logo"), upload_to="about/ecosystem/logos/", blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("ecosystem partner item")
        verbose_name_plural = _("ecosystem partner items")

    def __str__(self) -> str:
        return self.name


class AboutEcosystemStatistic(BaseModel):
    """A bottom statistic in the Ecosystem section."""

    ecosystem = models.ForeignKey(
        AboutCapabilityEcosystem, on_delete=models.CASCADE,
        related_name="statistics", verbose_name=_("ecosystem"),
    )
    number = models.CharField(_("number"), max_length=50)
    label = models.CharField(_("label"), max_length=150)

    class Meta(BaseModel.Meta):
        verbose_name = _("ecosystem statistic")
        verbose_name_plural = _("ecosystem statistics")

    def __str__(self) -> str:
        return f"{self.number} {self.label}"


# ─── Section 12: Contact Banner ───────────────────────────────────────────────

class AboutContactBanner(BaseModel):
    """CMS for the contact/reach-us banner at the bottom of the About page."""

    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    hotline = models.CharField(_("hotline"), max_length=50, blank=True)
    email = models.EmailField(_("email"), blank=True)
    facebook_url = models.CharField(_("Facebook URL"), max_length=500, blank=True)
    linkedin_url = models.CharField(_("LinkedIn URL"), max_length=500, blank=True)
    youtube_url = models.CharField(_("YouTube URL"), max_length=500, blank=True)
    background_image = models.ImageField(_("background image"), upload_to="about/contact/", blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("contact banner")
        verbose_name_plural = _("contact banners")

    def __str__(self) -> str:
        return self.title
