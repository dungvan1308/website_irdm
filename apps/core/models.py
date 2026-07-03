"""Core shared models: site settings, navigation menus and footer structure."""

from django.db import models
from django.utils.translation import gettext_lazy as _

from apps.common.models import BaseModel


class SiteSettings(BaseModel):
    """Singleton model storing global site configuration managed via CMS."""

    site_name = models.CharField(_("site name"), max_length=200)
    site_tagline = models.CharField(_("site tagline"), max_length=400, blank=True)
    site_description = models.TextField(_("site description"), blank=True)
    logo = models.ImageField(_("logo"), upload_to="core/logo/", blank=True)
    logo_white = models.ImageField(_("logo (white)"), upload_to="core/logo/", blank=True)
    favicon = models.ImageField(_("favicon"), upload_to="core/logo/", blank=True)

    # Contact details shown in header/footer
    email = models.EmailField(_("email"), blank=True)
    phone = models.CharField(_("phone"), max_length=50, blank=True)
    address = models.CharField(_("address"), max_length=400, blank=True)

    # Social media
    linkedin_url = models.URLField(_("LinkedIn URL"), blank=True)
    twitter_url = models.URLField(_("Twitter / X URL"), blank=True)
    facebook_url = models.URLField(_("Facebook URL"), blank=True)
    youtube_url = models.URLField(_("YouTube URL"), blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("site settings")
        verbose_name_plural = _("site settings")

    def __str__(self) -> str:
        return self.site_name


class MenuItem(BaseModel):
    """CMS-editable navigation menu item."""

    MENU_HEADER = "header"
    MENU_FOOTER = "footer"
    MENU_CHOICES = [
        (MENU_HEADER, _("Header")),
        (MENU_FOOTER, _("Footer")),
    ]

    menu = models.CharField(_("menu"), max_length=20, choices=MENU_CHOICES, db_index=True)
    label = models.CharField(_("label"), max_length=100)
    url = models.CharField(_("URL"), max_length=500, blank=True)
    open_in_new_tab = models.BooleanField(_("open in new tab"), default=False)
    parent = models.ForeignKey(
        "self",
        null=True,
        blank=True,
        on_delete=models.CASCADE,
        related_name="children",
        verbose_name=_("parent item"),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("menu item")
        verbose_name_plural = _("menu items")

    def __str__(self) -> str:
        return f"{self.get_menu_display()} — {self.label}"


class FooterSection(BaseModel):
    """A column in the footer, grouping related links."""

    title = models.CharField(_("title"), max_length=100)

    class Meta(BaseModel.Meta):
        verbose_name = _("footer section")
        verbose_name_plural = _("footer sections")

    def __str__(self) -> str:
        return self.title


class FooterLink(BaseModel):
    """A link inside a footer section column."""

    section = models.ForeignKey(
        FooterSection,
        on_delete=models.CASCADE,
        related_name="links",
        verbose_name=_("section"),
    )
    label = models.CharField(_("label"), max_length=100)
    url = models.CharField(_("URL"), max_length=500, blank=True)
    open_in_new_tab = models.BooleanField(_("open in new tab"), default=False)

    class Meta(BaseModel.Meta):
        verbose_name = _("footer link")
        verbose_name_plural = _("footer links")

    def __str__(self) -> str:
        return f"{self.section.title} — {self.label}"
