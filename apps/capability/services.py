"""Capability service layer — all business logic for the Capability module."""

from __future__ import annotations

from typing import Optional

from .models import (
    Capability,
    CapabilityCaseStudy,
    CapabilityFeature,
    CapabilityHowStep,
    CapabilityListingPage,
    CapabilityNeedItem,
    CapabilityOutput,
)


class CapabilityService:
    """Retrieve all data required for the Capability module pages."""

    # ─── Listing page ─────────────────────────────────────────────────────────

    @staticmethod
    def get_listing_page() -> Optional[CapabilityListingPage]:
        """Return the first active listing page config."""
        return CapabilityListingPage.objects.filter(is_active=True).first()

    @staticmethod
    def get_all_capabilities() -> list[Capability]:
        """Return all active and published capabilities ordered by display_order."""
        return list(
            Capability.objects.filter(is_active=True, is_published=True)
            .prefetch_related("features")
        )

    # ─── Detail page ──────────────────────────────────────────────────────────

    @staticmethod
    def get_capability_by_slug(slug: str) -> Optional[Capability]:
        """Return a single published capability by slug."""
        return (
            Capability.objects
            .filter(slug=slug, is_active=True, is_published=True)
            .prefetch_related("features", "need_items", "how_steps", "outputs")
            .first()
        )

    @staticmethod
    def get_features(capability: Capability) -> list[CapabilityFeature]:
        """Return active feature tags for a capability."""
        return list(capability.features.filter(is_active=True))

    @staticmethod
    def get_need_items(capability: Capability) -> list[CapabilityNeedItem]:
        """Return active 'when needed' items ordered by number."""
        return list(capability.need_items.filter(is_active=True).order_by("number"))

    @staticmethod
    def get_how_steps(capability: Capability) -> list[CapabilityHowStep]:
        """Return active 'how we work' steps ordered by display_order."""
        return list(capability.how_steps.filter(is_active=True))

    @staticmethod
    def get_outputs(capability: Capability) -> list[CapabilityOutput]:
        """Return active output items ordered by number."""
        return list(capability.outputs.filter(is_active=True).order_by("number"))

    @staticmethod
    def get_case_studies(capability: Capability) -> list[CapabilityCaseStudy]:
        """Return active case studies for a capability."""
        return list(
            CapabilityCaseStudy.objects
            .filter(capability=capability, is_active=True)
            .prefetch_related("tags")
            .order_by("number")
        )

    @staticmethod
    def get_related_capabilities(capability: Capability, limit: int = 3) -> list[Capability]:
        """Return other published capabilities for the related section."""
        return list(
            Capability.objects
            .filter(is_active=True, is_published=True)
            .exclude(pk=capability.pk)
            .prefetch_related("features")
            [:limit]
        )
