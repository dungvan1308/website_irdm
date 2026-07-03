"""Homepage views."""

from django.views.generic import TemplateView

from .models import FeaturedSectionConfig
from .services import HomeService


class HomePageView(TemplateView):
    """Public homepage — assembles all homepage sections via HomeService."""

    template_name = "home/index.html"

    def get_context_data(self, **kwargs: object) -> dict:
        context = super().get_context_data(**kwargs)
        context["hero"] = HomeService.get_hero()
        context["audience_header"] = HomeService.get_audience_header()
        context["audience_segments"] = HomeService.get_audience_segments()
        context["methodology_header"] = HomeService.get_methodology_header()
        context["methodology_steps"] = HomeService.get_methodology_steps()
        context["capabilities_header"] = HomeService.get_capabilities_header()
        context["core_capabilities"] = HomeService.get_core_capabilities()
        context["philosophy_header"] = HomeService.get_philosophy_header()
        context["philosophy_principles"] = HomeService.get_philosophy_principles()
        context["evidence_header"] = HomeService.get_evidence_header()
        context["partner_logos"] = HomeService.get_partner_logos()
        context["statistics"] = HomeService.get_statistics()
        context["knowledge_header"] = HomeService.get_knowledge_header()
        context["knowledge_categories"] = HomeService.get_knowledge_categories()
        context["cta_banner"] = HomeService.get_cta_banner()
        return context


class FeaturedSectionView(TemplateView):
    """HTMX partial view — returns the items grid for one featured section."""

    template_name = "home/partials/featured_section_items.html"

    def get_context_data(self, **kwargs: object) -> dict:
        context = super().get_context_data(**kwargs)
        section_key = self.kwargs.get("section_key", "")
        context["section_key"] = section_key
        context["items"] = []
        return context


class StatisticsSectionView(TemplateView):
    """HTMX partial view — returns the statistics section."""

    template_name = "home/partials/statistics_section.html"

    def get_context_data(self, **kwargs: object) -> dict:
        context = super().get_context_data(**kwargs)
        context["statistics"] = HomeService.get_statistics()
        return context
