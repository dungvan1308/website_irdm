"""Expert module views."""

from django.http import Http404, HttpRequest, HttpResponse
from django.views.generic import TemplateView

from .forms import ExpertSearchForm
from .models import Expert
from .services import ExpertService


class ExpertListingView(TemplateView):
    """Public expert listing page."""

    template_name = "expert/listing.html"

    def get_context_data(self, **kwargs: object) -> dict:
        ctx = super().get_context_data(**kwargs)
        ctx["listing_page"] = ExpertService.get_listing_page()
        ctx["process_steps"] = ExpertService.get_process_steps()
        ctx["senior_experts"] = ExpertService.get_senior_experts()
        ctx["research_areas"] = ExpertService.get_research_areas()
        ctx["expert_groups"] = ExpertService.get_expert_groups()
        ctx["engagement_types"] = ExpertService.get_engagement_types()
        ctx["knowledge_topics"] = ExpertService.get_knowledge_topics()
        ctx["info_groups"] = ExpertService.get_info_groups()
        # Initial directory load
        search_data = ExpertService.get_experts()
        ctx["experts"] = search_data["experts"]
        ctx["page_obj"] = search_data["page_obj"]
        ctx["has_next"] = search_data["has_next"]
        ctx["total_experts"] = search_data["total"]
        ctx["form"] = ExpertSearchForm()
        ctx["active_group"] = "all"
        ctx["active_area"] = ""
        ctx["active_engagement"] = ""
        return ctx


class ExpertSearchView(TemplateView):
    """HTMX endpoint — returns the expert grid partial."""

    template_name = "expert/_expert_grid.html"

    def get(self, request: HttpRequest, *args: object, **kwargs: object) -> HttpResponse:
        form = ExpertSearchForm(request.GET)
        q = ""
        group_slug = ""
        area_slug = ""
        engagement_slug = ""
        if form.is_valid():
            q = form.cleaned_data.get("q") or ""
            group_slug = form.cleaned_data.get("group") or ""
            area_slug = form.cleaned_data.get("area") or ""
            engagement_slug = form.cleaned_data.get("engagement") or ""

        try:
            page = int(request.GET.get("page", 1))
        except (ValueError, TypeError):
            page = 1

        search_data = ExpertService.get_experts(
            q=q, group_slug=group_slug, area_slug=area_slug,
            engagement_slug=engagement_slug, page=page
        )
        ctx = self.get_context_data(**kwargs)
        ctx["experts"] = search_data["experts"]
        ctx["page_obj"] = search_data["page_obj"]
        ctx["has_next"] = search_data["has_next"]
        ctx["total_experts"] = search_data["total"]
        ctx["q"] = q
        ctx["active_group"] = group_slug or "all"
        ctx["active_area"] = area_slug
        ctx["active_engagement"] = engagement_slug
        return self.render_to_response(ctx)


class ExpertDetailView(TemplateView):
    """Public expert detail page (Sprint after)."""

    template_name = "expert/detail.html"

    def get_context_data(self, **kwargs: object) -> dict:
        ctx = super().get_context_data(**kwargs)
        slug = self.kwargs["slug"]
        expert = ExpertService.get_expert_by_slug(slug)
        if expert is None:
            raise Http404
        ctx["expert"] = expert
        ctx["listing_page"] = ExpertService.get_listing_page()

        # Ticker bar — only from ticker_text field (admin: TRANG HỒ SƠ — Hero)
        ctx["ticker_content"] = expert.ticker_text

        # Related experts: same research areas, excluding self, max 5
        area_ids = expert.research_areas.values_list("id", flat=True)
        ctx["related_experts"] = (
            Expert.objects.filter(
                is_published=True,
                is_active=True,
                research_areas__in=area_ids,
            )
            .exclude(pk=expert.pk)
            .distinct()
            .order_by("-is_featured", "-is_senior", "display_order")[:5]
        )
        return ctx
