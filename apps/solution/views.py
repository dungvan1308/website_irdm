"""Solution module views."""

from django.http import Http404
from django.views.generic import TemplateView

from .services import SolutionService


class SolutionListingView(TemplateView):
    """Public solution landing page."""

    template_name = "solution/listing.html"

    def get_context_data(self, **kwargs: object) -> dict:
        context = super().get_context_data(**kwargs)
        context["listing_page"] = SolutionService.get_listing_page()
        context["solutions"] = SolutionService.get_all_solutions()
        context["approach_steps"] = SolutionService.get_approach_steps()
        return context


class SolutionDetailView(TemplateView):
    """Public solution detail page."""

    template_name = "solution/detail.html"

    def get_context_data(self, **kwargs: object) -> dict:
        context = super().get_context_data(**kwargs)
        slug = self.kwargs["slug"]
        solution = SolutionService.get_solution_by_slug(slug)
        if solution is None:
            raise Http404
        context["solution"] = solution
        context["features"] = SolutionService.get_features(solution)
        context["challenges"] = SolutionService.get_challenges(solution)
        context["methodology_steps"] = SolutionService.get_methodology_steps(solution)
        context["outputs"] = SolutionService.get_outputs(solution)
        context["related_capabilities"] = list(solution.related_capabilities.filter(is_active=True, is_published=True))
        context["all_solutions"] = SolutionService.get_all_solutions()
        context["related_solutions"] = SolutionService.get_related_solutions(solution)
        return context
