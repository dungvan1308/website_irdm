"""Knowledge module views."""

from django.http import Http404
from django.views.generic import TemplateView

from .services import KnowledgeService


class KnowledgeListingView(TemplateView):
    """Public knowledge listing page /tri-thuc-goc-nhin/."""

    template_name = "knowledge/listing.html"

    def get_context_data(self, **kwargs: object) -> dict:
        context = super().get_context_data(**kwargs)
        listing_page = KnowledgeService.get_listing_page()
        context["listing_page"] = listing_page
        context["topics"] = KnowledgeService.get_topics()

        active_topic = self.request.GET.get("topic", "").strip()
        search_query = self.request.GET.get("search", "").strip()
        context["active_topic"] = active_topic
        context["search_query"] = search_query

        if search_query:
            context["search_results"] = KnowledgeService.search_articles(search_query)
            context["categories"] = []
            context["featured_articles"] = []
        elif active_topic:
            context["search_results"] = KnowledgeService.filter_articles_by_topic(active_topic)
            context["categories"] = []
            context["featured_articles"] = []
        else:
            context["search_results"] = None
            context["categories"] = KnowledgeService.get_categories_with_articles()
            context["featured_articles"] = (
                KnowledgeService.get_featured_articles(listing_page) if listing_page else []
            )

        context["downloads"] = KnowledgeService.get_downloads()
        context["news_items"] = KnowledgeService.get_news_items()
        return context


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
