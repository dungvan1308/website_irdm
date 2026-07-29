"""Expert service layer — all business logic and DB queries for the Expert module."""

from __future__ import annotations

from typing import Optional

from django.db.models import Count, Prefetch, Q, QuerySet

from .models import EngagementType, Expert, ExpertGroup, ExpertListingPage, InfoGroup, InfoGroupBlock, KnowledgeTopic, OrgNode, ProcessStep, ResearchArea


class ExpertService:
    """Retrieve all data required for the Expert module pages."""

    # ─── Listing page CMS ─────────────────────────────────────────────────────

    @staticmethod
    def get_listing_page() -> Optional[ExpertListingPage]:
        """Return the first active listing page config."""
        return ExpertListingPage.objects.filter(is_active=True).first()

    # ─── Process Steps ────────────────────────────────────────────────────────

    @staticmethod
    def get_process_steps() -> list[ProcessStep]:
        """Return all active process steps ordered by step_number."""
        return list(ProcessStep.objects.filter(is_active=True).order_by("step_number"))

    # ─── Senior / Featured Experts ────────────────────────────────────────────

    @staticmethod
    def get_senior_experts(limit: int = 6) -> list[Expert]:
        """Return senior published experts for the featured section."""
        return list(
            Expert.objects
            .filter(is_active=True, is_published=True, is_senior=True)
            .select_related("group")
            .prefetch_related("research_areas")
            .order_by("display_order")[:limit]
        )

    # ─── Research Area Map ────────────────────────────────────────────────────

    @staticmethod
    def get_research_areas() -> list[ResearchArea]:
        """Return all active research areas with expert count."""
        return list(
            ResearchArea.objects
            .filter(is_active=True)
            .annotate(expert_count=Count(
                "experts",
                filter=Q(experts__is_active=True, experts__is_published=True),
            ))
            .order_by("display_order")
        )

    # ─── Expert Groups (filter tabs) ──────────────────────────────────────────

    @staticmethod
    def get_expert_groups() -> list[ExpertGroup]:
        """Return all active expert groups for filter tabs."""
        return list(
            ExpertGroup.objects
            .filter(is_active=True)
            .annotate(expert_count=Count(
                "experts",
                filter=Q(experts__is_active=True, experts__is_published=True),
            ))
            .order_by("display_order")
        )

    # ─── Engagement Types (filter sidebar) ──────────────────────────────────────

    @staticmethod
    def get_engagement_types() -> list[EngagementType]:
        """Return all active engagement types for the sidebar filter."""
        return list(
            EngagementType.objects
            .filter(is_active=True)
            .annotate(expert_count=Count(
                "experts",
                filter=Q(experts__is_active=True, experts__is_published=True),
            ))
            .order_by("display_order")
        )

    # ─── Expert Directory (search + filter) ──────────────────────────────────────

    @staticmethod
    def get_experts(
        q: str = "",
        group_slug: str = "",
        area_slug: str = "",
        engagement_slug: str = "",
        page: int = 1,
        per_page: int = 12,
    ) -> dict:
        """Return filtered, paginated experts for the directory section."""
        from django.core.paginator import Paginator

        qs: QuerySet = (
            Expert.objects
            .filter(is_active=True, is_published=True)
            .select_related("group")
            .prefetch_related("research_areas", "engagement_types")
            .order_by("display_order", "name")
        )

        if q:
            from django.db.models import Q
            qs = qs.filter(
                Q(name__icontains=q)
                | Q(position__icontains=q)
                | Q(organization__icontains=q)
                | Q(research_areas__name__icontains=q)
                | Q(short_bio__icontains=q)
            ).distinct()

        if group_slug and group_slug != "all":
            qs = qs.filter(group__slug=group_slug)

        if area_slug:
            qs = qs.filter(research_areas__slug=area_slug).distinct()

        if engagement_slug:
            qs = qs.filter(engagement_types__slug=engagement_slug).distinct()

        paginator = Paginator(qs, per_page)
        page_obj = paginator.get_page(page)
        return {
            "experts": list(page_obj),
            "page_obj": page_obj,
            "has_next": page_obj.has_next(),
            "total": paginator.count,
        }

    # ─── Knowledge Topics (Accordion) ─────────────────────────────────────────

    @staticmethod
    def get_knowledge_topics(limit: int = 10) -> list[KnowledgeTopic]:
        """Return active knowledge topics with their published experts."""
        expert_qs = Expert.objects.filter(is_active=True, is_published=True).select_related("group")
        return list(
            KnowledgeTopic.objects
            .filter(is_active=True)
            .prefetch_related(Prefetch("experts", queryset=expert_qs))
            .order_by("display_order")[:limit]
        )

    # ─── Info Groups (CÁC NHÓM THÔNG TIN CHUYÊN MÔN) ─────────────────────────

    @staticmethod
    def get_info_groups(limit: int = 20) -> list:
        """Return active info groups with prefetched org nodes and blocks."""
        groups = list(
            InfoGroup.objects
            .filter(is_active=True)
            .prefetch_related(
                Prefetch(
                    "org_nodes",
                    queryset=OrgNode.objects.filter(is_active=True).order_by("level", "display_order"),
                ),
                Prefetch(
                    "blocks",
                    queryset=InfoGroupBlock.objects.filter(is_active=True).order_by("display_order"),
                ),
            )
            .order_by("display_order")[:limit]
        )
        for group in groups:
            all_nodes = list(group.org_nodes.all())
            group.org_nodes_l0 = [n for n in all_nodes if n.level == 0]
            group.org_nodes_l1 = [n for n in all_nodes if n.level == 1]
            group.org_nodes_l2 = [n for n in all_nodes if n.level == 2]
        return groups

    # ─── Detail page ──────────────────────────────────────────────────────────

    @staticmethod
    def get_expert_by_slug(slug: str) -> Optional[Expert]:
        """Return a single published expert by slug."""
        return (
            Expert.objects
            .filter(slug=slug, is_active=True, is_published=True)
            .select_related("group")
            .prefetch_related("research_areas", "knowledge_topics")
            .first()
        )
