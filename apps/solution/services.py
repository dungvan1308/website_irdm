"""Solution service layer — all business logic for the Solution module."""

from __future__ import annotations
from typing import Optional
from django.db.models import Prefetch
from .models import Solution, SolutionApproachStep, SolutionChallenge, SolutionFeature, SolutionListingPage, SolutionMethodologyStep, SolutionOutput


class SolutionService:
    """Retrieve all data required for the Solution module pages."""

    @staticmethod
    def get_listing_page() -> Optional[SolutionListingPage]:
        return SolutionListingPage.objects.filter(is_active=True).first()

    @staticmethod
    def get_approach_steps() -> list[SolutionApproachStep]:
        return list(SolutionApproachStep.objects.filter(is_active=True).order_by("number"))

    @staticmethod
    def get_all_solutions() -> list[Solution]:
        """Return all published solutions with full sub-data for listing page rendering."""
        from apps.capability.models import Capability, CapabilityFeature
        return list(
            Solution.objects
            .filter(is_active=True, is_published=True)
            .prefetch_related(
                Prefetch("features", queryset=SolutionFeature.objects.filter(is_active=True).order_by("display_order")),
                Prefetch("challenges", queryset=SolutionChallenge.objects.filter(is_active=True).order_by("number")),
                Prefetch("methodology_steps", queryset=SolutionMethodologyStep.objects.filter(is_active=True).order_by("display_order")),
                Prefetch("outputs", queryset=SolutionOutput.objects.filter(is_active=True).order_by("number")),
                Prefetch(
                    "related_capabilities",
                    queryset=Capability.objects
                    .filter(is_active=True, is_published=True)
                    .prefetch_related(
                        Prefetch("features", queryset=CapabilityFeature.objects.filter(is_active=True).order_by("display_order"))
                    ),
                ),
            )
            .order_by("display_order")
        )

    @staticmethod
    def get_solution_by_slug(slug: str) -> Optional[Solution]:
        from apps.capability.models import Capability, CapabilityFeature
        return (
            Solution.objects
            .filter(slug=slug, is_active=True, is_published=True)
            .prefetch_related(
                Prefetch("features", queryset=SolutionFeature.objects.filter(is_active=True).order_by("display_order")),
                Prefetch("challenges", queryset=SolutionChallenge.objects.filter(is_active=True).order_by("number")),
                Prefetch("methodology_steps", queryset=SolutionMethodologyStep.objects.filter(is_active=True).order_by("display_order")),
                Prefetch("outputs", queryset=SolutionOutput.objects.filter(is_active=True).order_by("number")),
                Prefetch(
                    "related_capabilities",
                    queryset=Capability.objects.filter(is_active=True, is_published=True).prefetch_related(
                        Prefetch("features", queryset=CapabilityFeature.objects.filter(is_active=True).order_by("display_order"))
                    ),
                ),
            )
            .first()
        )

    @staticmethod
    def get_features(solution: Solution) -> list[SolutionFeature]:
        return list(solution.features.filter(is_active=True))

    @staticmethod
    def get_challenges(solution: Solution) -> list[SolutionChallenge]:
        return list(solution.challenges.filter(is_active=True).order_by("number"))

    @staticmethod
    def get_methodology_steps(solution: Solution) -> list[SolutionMethodologyStep]:
        return list(solution.methodology_steps.filter(is_active=True))

    @staticmethod
    def get_outputs(solution: Solution) -> list[SolutionOutput]:
        return list(solution.outputs.filter(is_active=True).order_by("number"))

    @staticmethod
    def get_related_solutions(solution: Solution, limit: int = 4) -> list[Solution]:
        return list(
            Solution.objects
            .filter(is_active=True, is_published=True)
            .exclude(pk=solution.pk)
            .prefetch_related("features")
            [:limit]
        )

