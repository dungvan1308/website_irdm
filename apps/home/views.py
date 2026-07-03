"""Homepage views."""

from django.http import HttpRequest, HttpResponse
from django.views.generic import TemplateView

from .models import FeaturedSectionConfig
from .services import HomeService


class HomePageView(TemplateView):
    """Public homepage — assembles all homepage sections via HomeService."""

    template_name = "home/index.html"

    def get_context_data(self, **kwargs: object) -> dict:
        context = super().get_context_data(**kwargs)
        service = HomeService()
        context["hero"] = HomeService.get_hero()
        context["statistics"] = HomeService.get_statistics()
        context["partner_logos"] = HomeService.get_partner_logos()
        context["featured_sections"] = HomeService.get_all_featured_sections()
        return context


class FeaturedSectionView(TemplateView):
    """HTMX partial view — returns the items grid for one featured section."""

    template_name = "home/partials/featured_section_items.html"

    def get_context_data(self, **kwargs: object) -> dict:
        context = super().get_context_data(**kwargs)
        section_key = self.kwargs.get("section_key", "")
        context["section_key"] = section_key
        # Items from other modules will be wired here as those modules are implemented.
        context["items"] = []
        return context


class StatisticsSectionView(TemplateView):
    """HTMX partial view — returns the statistics section."""

    template_name = "home/partials/statistics_section.html"

    def get_context_data(self, **kwargs: object) -> dict:
        context = super().get_context_data(**kwargs)
        context["statistics"] = HomeService.get_statistics()
        return context
