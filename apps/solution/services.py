"""Solution service layer — all business logic for the Solution module."""

from __future__ import annotations
from typing import Optional
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
        return list(Solution.objects.filter(is_active=True, is_published=True).prefetch_related("features"))

    @staticmethod
    def get_solution_by_slug(slug: str) -> Optional[Solution]:
        return (
            Solution.objects
            .filter(slug=slug, is_active=True, is_published=True)
            .prefetch_related("features", "challenges", "methodology_steps", "outputs", "related_capabilities")
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

