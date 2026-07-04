"""Capability module views."""

from django.http import Http404
from django.views.generic import TemplateView

from .services import CapabilityService


class CapabilityListingView(TemplateView):
    """Public capability listing page."""

    template_name = "capability/listing.html"

    def get_context_data(self, **kwargs: object) -> dict:
        context = super().get_context_data(**kwargs)
        context["listing_page"] = CapabilityService.get_listing_page()
        context["capabilities"] = CapabilityService.get_all_capabilities()
        return context


class CapabilityDetailView(TemplateView):
    """Public capability detail page."""

    template_name = "capability/detail.html"

    def get_context_data(self, **kwargs: object) -> dict:
        context = super().get_context_data(**kwargs)
        slug = self.kwargs["slug"]
        capability = CapabilityService.get_capability_by_slug(slug)
        if capability is None:
            raise Http404
        context["capability"] = capability
        context["features"] = CapabilityService.get_features(capability)
        context["need_items"] = CapabilityService.get_need_items(capability)
        context["how_steps"] = CapabilityService.get_how_steps(capability)
        context["outputs"] = CapabilityService.get_outputs(capability)
        context["case_studies"] = CapabilityService.get_case_studies(capability)
        context["related_capabilities"] = CapabilityService.get_related_capabilities(capability)
        context["all_capabilities"] = CapabilityService.get_all_capabilities()
        return context
