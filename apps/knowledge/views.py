"""Knowledge module views."""

from django.http import Http404, HttpResponseRedirect
from django.urls import reverse
from django.views.generic import TemplateView

from .forms import KnowledgeDownloadRequestForm
from .services import KnowledgeService


class KnowledgeListingView(TemplateView):
    """Public knowledge listing page /tri-thuc-goc-nhin/."""

    template_name = "knowledge/listing.html"

    def get_context_data(self, **kwargs: object) -> dict:
        context = super().get_context_data(**kwargs)
        listing_page = KnowledgeService.get_listing_page()
        context["listing_page"] = listing_page
        context["topics"] = KnowledgeService.get_topics()  # kept for Topic Browse section

        # ── Build filter groups + annotate active state ─────────────────────
        filter_groups = KnowledgeService.get_filter_groups()
        search_query = self.request.GET.get("search", "").strip()
        active_filters: dict[str, list[str]] = {}
        for group in filter_groups:
            values = self.request.GET.getlist(group.param_key)
            active_filters[group.param_key] = values
            for item in group.active_items:
                item.is_checked = item.value in values

        # backward-compat: single active_topic for Topic Browse section links
        active_topic = self.request.GET.get("topic", "").strip()
        context["filter_groups"] = filter_groups
        context["active_filters"] = active_filters
        context["active_topic"] = active_topic
        context["search_query"] = search_query

        # ── Decide which content to show ──────────────────────────────
        has_active_filters = any(v for v in active_filters.values())

        if search_query:
            context["search_results"] = KnowledgeService.search_articles(search_query)
            context["categories"] = []
            context["featured_articles"] = []
        elif has_active_filters:
            context["search_results"] = KnowledgeService.filter_articles_multi(active_filters)
            context["categories"] = []
            context["featured_articles"] = []
        else:
            context["search_results"] = None
            context["categories"] = KnowledgeService.get_categories_with_articles()
            context["featured_articles"] = (
                KnowledgeService.get_featured_articles(listing_page) if listing_page else []
            )
            context["featured_pins"] = (
                KnowledgeService.get_featured_pins(listing_page) if listing_page else []
            )
            context["content_type_cards"] = (
                KnowledgeService.get_content_type_cards(listing_page) if listing_page else []
            )
            context["topic_cards"] = (
                KnowledgeService.get_topic_cards(listing_page) if listing_page else []
            )

        context["downloads"] = KnowledgeService.get_downloads()
        context["news_items"] = KnowledgeService.get_news_items()
        context["press_items"] = KnowledgeService.get_press_items()
        context["ready_section_buttons"] = KnowledgeService.get_ready_section_buttons(listing_page)
        context["activity_news"] = KnowledgeService.get_activity_news()
        context["upcoming_events"] = KnowledgeService.get_upcoming_events()
        context["post_event_accordions"] = KnowledgeService.get_accordion_items("post_event")
        context["cooperation_accordions"] = KnowledgeService.get_accordion_items("cooperation")
        # ── Publication section form ──────────────────────────────────────────
        context["pub_form"] = KnowledgeDownloadRequestForm()
        context["pub_form_success"] = self.request.GET.get("pub_form") == "success"
        return context

    def post(self, request, *args, **kwargs):
        """Handle publication download request form submission."""
        form = KnowledgeDownloadRequestForm(request.POST)
        if form.is_valid():
            KnowledgeService.save_download_request(form.cleaned_data)
            return HttpResponseRedirect(
                reverse("knowledge:listing") + "?pub_form=success#tai-lieu-tai-ve"
            )
        context = self.get_context_data(**kwargs)
        context["pub_form"] = form  # override with error form
        return self.render_to_response(context)


class KnowledgeArticleDetailView(TemplateView):
    """Public article detail page /tri-thuc-goc-nhin/<slug>/."""

    template_name = "knowledge/detail.html"

    def get_context_data(self, **kwargs: object) -> dict:
        context = super().get_context_data(**kwargs)
        slug = self.kwargs["slug"]
        article = KnowledgeService.get_article_by_slug(slug)
        if article is None:
            raise Http404
        context["article"] = article
        context["related_capabilities"] = list(article.related_capabilities.filter(is_active=True, is_published=True))
        context["related_articles"] = KnowledgeService.get_related_articles(article)
        context["listing_page"] = KnowledgeService.get_listing_page()
        return context
