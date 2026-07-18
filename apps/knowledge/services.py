"""Knowledge service layer — all business logic for the Knowledge module."""

from __future__ import annotations

from typing import Optional

from django.db.models import Prefetch, QuerySet

from .models import (
    KnowledgeArticle,
    KnowledgeCategory,
    KnowledgeContentTypeCard,
    KnowledgeDownload,
    KnowledgeFilterGroup,
    KnowledgeFilterItem,
    KnowledgeListingPage,
    KnowledgeNewsItem,
    KnowledgeTopic,
)


class KnowledgeService:
    """Retrieve all data required for the Knowledge module pages."""

    @staticmethod
    def get_listing_page() -> Optional[KnowledgeListingPage]:
        return KnowledgeListingPage.objects.filter(is_active=True).first()

    @staticmethod
    def get_categories() -> QuerySet:
        return (
            KnowledgeCategory.objects
            .filter(is_active=True, is_published=True)
            .order_by("display_order")
        )

    @staticmethod
    def get_topics() -> QuerySet:
        return (
            KnowledgeTopic.objects
            .filter(is_active=True, is_published=True)
            .order_by("display_order")
        )

    @staticmethod
    def get_articles_by_category(category: KnowledgeCategory) -> QuerySet:
        return (
            KnowledgeArticle.objects
            .filter(is_active=True, is_published=True, category=category)
            .select_related("category")
            .prefetch_related("topics")
            .order_by("display_order", "-published_date")
        )

    @staticmethod
    def get_featured_articles(listing_page: KnowledgeListingPage) -> QuerySet:
        from .models import KnowledgeFeaturedArticle
        pins = (
            KnowledgeFeaturedArticle.objects
            .filter(listing_page=listing_page, is_active=True)
            .select_related("article", "article__category")
            .prefetch_related("article__topics")
            .order_by("display_order")
        )
        return [pin.article for pin in pins if pin.article.is_published and pin.article.is_active]

    @staticmethod
    def get_featured_pins(listing_page: KnowledgeListingPage) -> list:
        """Return KnowledgeFeaturedArticle pins (with CMS fields) for the featured section."""
        from .models import KnowledgeFeaturedArticle
        pins = (
            KnowledgeFeaturedArticle.objects
            .filter(listing_page=listing_page, is_active=True)
            .select_related("article", "article__category")
            .prefetch_related("article__topics")
            .order_by("display_order")
        )
        return [pin for pin in pins if pin.article.is_published and pin.article.is_active]

    @staticmethod
    def get_downloads() -> QuerySet:
        return (
            KnowledgeDownload.objects
            .filter(is_active=True, is_published=True)
            .select_related("category")
            .order_by("display_order", "-published_date")
        )

    @staticmethod
    def get_news_items() -> QuerySet:
        return (
            KnowledgeNewsItem.objects
            .filter(is_active=True, is_published=True)
            .select_related("category")
            .prefetch_related("topics")
            .order_by("display_order", "-published_date")
        )

    @staticmethod
    def get_article_by_slug(slug: str) -> Optional[KnowledgeArticle]:
        return (
            KnowledgeArticle.objects
            .filter(slug=slug, is_active=True, is_published=True)
            .select_related("category")
            .prefetch_related(
                "topics",
                Prefetch(
                    "related_capabilities",
                    queryset=__import__(
                        "apps.capability.models", fromlist=["Capability"]
                    ).Capability.objects.filter(is_active=True, is_published=True),
                ),
            )
            .first()
        )

    @staticmethod
    def filter_articles_by_topic(topic_slug: str) -> QuerySet:
        return (
            KnowledgeArticle.objects
            .filter(is_active=True, is_published=True, topics__slug=topic_slug)
            .select_related("category")
            .prefetch_related("topics")
            .order_by("display_order", "-published_date")
            .distinct()
        )

    @staticmethod
    def search_articles(query: str) -> QuerySet:
        from django.db.models import Q
        return (
            KnowledgeArticle.objects
            .filter(is_active=True, is_published=True)
            .filter(Q(title__icontains=query) | Q(summary__icontains=query) | Q(body__icontains=query))
            .select_related("category")
            .prefetch_related("topics")
            .order_by("display_order", "-published_date")
            .distinct()
        )

    @staticmethod
    def get_categories_with_articles() -> list:
        """Return categories with their prefetched articles for listing page rendering."""
        categories = list(
            KnowledgeCategory.objects
            .filter(is_active=True, is_published=True)
            .prefetch_related(
                Prefetch(
                    "articles",
                    queryset=KnowledgeArticle.objects
                    .filter(is_active=True, is_published=True)
                    .select_related("category")
                    .prefetch_related("topics")
                    .order_by("display_order", "-published_date"),
                    to_attr="published_articles",
                )
            )
            .order_by("display_order")
        )
        return categories

    @staticmethod
    def get_related_articles(article: KnowledgeArticle, limit: int = 3) -> QuerySet:
        return (
            KnowledgeArticle.objects
            .filter(is_active=True, is_published=True, category=article.category)
            .exclude(pk=article.pk)
            .select_related("category")
            .prefetch_related("topics")
            .order_by("display_order", "-published_date")
            [:limit]
        )

    # ─── Filter groups ────────────────────────────────────────────────────────

    @staticmethod
    def get_filter_groups() -> list:
        """Return active filter groups with prefetched active items."""
        return list(
            KnowledgeFilterGroup.objects
            .filter(is_active=True)
            .prefetch_related(
                Prefetch(
                    "items",
                    queryset=KnowledgeFilterItem.objects.filter(is_active=True).order_by("display_order"),
                    to_attr="active_items",
                )
            )
            .order_by("display_order")
        )

    @staticmethod
    def filter_articles_multi(active_filters: dict) -> QuerySet:
        """Filter articles by multiple filter groups. active_filters = {param_key: [values]}."""
        qs = KnowledgeArticle.objects.filter(is_active=True, is_published=True)
        topic_values = active_filters.get("topic", [])
        ctype_values = active_filters.get("ctype", [])
        partner_values = active_filters.get("partner", [])
        if topic_values:
            qs = qs.filter(topics__slug__in=topic_values)
        if ctype_values:
            qs = qs.filter(category__slug__in=ctype_values)
        if partner_values:
            qs = qs.filter(topics__slug__in=partner_values)
        return (
            qs.select_related("category")
            .prefetch_related("topics")
            .distinct()
            .order_by("display_order", "-published_date")
        )

    @staticmethod
    def get_content_type_cards(listing_page: KnowledgeListingPage) -> list:
        """Return published Content Type Cards for the 'Khám phá theo Loại Nội Dung' section."""
        return list(
            KnowledgeContentTypeCard.objects
            .filter(listing_page=listing_page, is_active=True, is_published=True)
            .select_related("category")
            .prefetch_related("tags")
            .order_by("display_order")
        )
