"""Core context processors injecting site-wide data into every template."""

from django.http import HttpRequest

from .services import FooterService, NavigationService, SiteSettingsService


def global_context(request: HttpRequest) -> dict:
    """Inject header navigation, footer data and site settings into all templates."""
    return {
        "site_settings": SiteSettingsService.get_site_settings(),
        "header_menu": NavigationService.get_header_menu(),
        "footer_sections": FooterService.get_footer_sections(),
        "footer_menu": NavigationService.get_footer_menu(),
    }
