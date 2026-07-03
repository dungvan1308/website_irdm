"""Core services providing site-wide navigation, settings and footer data."""

from __future__ import annotations

from typing import Optional

from .models import FooterSection, MenuItem, SiteSettings


class SiteSettingsService:
    """Retrieve global site configuration."""

    @staticmethod
    def get_site_settings() -> Optional[SiteSettings]:
        """Return the first active SiteSettings record, or None."""
        return SiteSettings.objects.filter(is_active=True).first()


class NavigationService:
    """Retrieve CMS-managed navigation menus."""

    @staticmethod
    def get_header_menu() -> list[MenuItem]:
        """Return active top-level header menu items ordered by display_order."""
        return list(
            MenuItem.objects.filter(
                menu=MenuItem.MENU_HEADER,
                is_active=True,
                parent__isnull=True,
            ).prefetch_related("children")
        )

    @staticmethod
    def get_footer_menu() -> list[MenuItem]:
        """Return active top-level footer menu items ordered by display_order."""
        return list(
            MenuItem.objects.filter(
                menu=MenuItem.MENU_FOOTER,
                is_active=True,
                parent__isnull=True,
            )
        )


class FooterService:
    """Retrieve footer sections with their links."""

    @staticmethod
    def get_footer_sections() -> list[FooterSection]:
        """Return active footer sections with prefetched active links."""
        return list(
            FooterSection.objects.filter(is_active=True).prefetch_related(
                "links"
            )
        )
