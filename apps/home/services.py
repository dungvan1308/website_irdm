"""Homepage service layer — all business logic for the public homepage."""

from __future__ import annotations

from typing import Optional

from .models import (
    AudienceSegment,
    AudienceSectionHeader,
    CTABanner,
    CapabilitiesSectionHeader,
    CoreCapability,
    EvidenceSectionHeader,
    FeaturedSectionConfig,
    HeroSection,
    KnowledgeCategory,
    KnowledgeSectionHeader,
    MethodologySectionHeader,
    MethodologyStep,
    PartnerLogo,
    PhilosophyPrinciple,
    PhilosophySectionHeader,
    StatisticItem,
)


class HomeService:
    """Retrieve all data required to render the public homepage."""

    @staticmethod
    def get_hero() -> Optional[HeroSection]:
        """Return the first active hero section by display order."""
        return (
            HeroSection.objects
            .filter(is_active=True)
            .prefetch_related("pill_tags")
            .first()
        )

    @staticmethod
    def get_statistics() -> list[StatisticItem]:
        """Return active statistic items ordered by display_order."""
        return list(StatisticItem.objects.filter(is_active=True))

    @staticmethod
    def get_partner_logos() -> list[PartnerLogo]:
        """Return active partner logos ordered by display_order."""
        return list(PartnerLogo.objects.filter(is_active=True))

    @staticmethod
    def get_featured_section(section_key: str) -> Optional[FeaturedSectionConfig]:
        """Return the config for a featured section if active and visible."""
        return FeaturedSectionConfig.objects.filter(
            section_key=section_key,
            is_active=True,
            is_visible=True,
        ).first()

    @staticmethod
    def get_all_featured_sections() -> list[FeaturedSectionConfig]:
        """Return all active and visible featured section configs ordered by display_order."""
        return list(
            FeaturedSectionConfig.objects.filter(is_active=True, is_visible=True)
        )

    # ─── Audience ─────────────────────────────────────────────────────────────

    @staticmethod
    def get_audience_header() -> Optional[AudienceSectionHeader]:
        return AudienceSectionHeader.objects.filter(is_active=True).first()

    @staticmethod
    def get_audience_segments() -> list[AudienceSegment]:
        return list(
            AudienceSegment.objects.filter(is_active=True).prefetch_related("tags")
        )

    # ─── Methodology ──────────────────────────────────────────────────────────

    @staticmethod
    def get_methodology_header() -> Optional[MethodologySectionHeader]:
        return MethodologySectionHeader.objects.filter(is_active=True).first()

    @staticmethod
    def get_methodology_steps() -> list[MethodologyStep]:
        return list(MethodologyStep.objects.filter(is_active=True))

    # ─── Capabilities ─────────────────────────────────────────────────────────

    @staticmethod
    def get_capabilities_header() -> Optional[CapabilitiesSectionHeader]:
        return CapabilitiesSectionHeader.objects.filter(is_active=True).first()

    @staticmethod
    def get_core_capabilities() -> list:
        """Return published Capability records from the capability module (single source of truth)."""
        from apps.capability.models import Capability
        return list(
            Capability.objects
            .filter(is_active=True, is_published=True)
            .order_by("display_order")
        )

    # ─── Philosophy ───────────────────────────────────────────────────────────

    @staticmethod
    def get_philosophy_header() -> Optional[PhilosophySectionHeader]:
        return PhilosophySectionHeader.objects.filter(is_active=True).first()

    @staticmethod
    def get_philosophy_principles() -> list[PhilosophyPrinciple]:
        return list(PhilosophyPrinciple.objects.filter(is_active=True))

    # ─── Evidence / Partners ──────────────────────────────────────────────────

    @staticmethod
    def get_evidence_header() -> Optional[EvidenceSectionHeader]:
        return EvidenceSectionHeader.objects.filter(is_active=True).first()

    # ─── Knowledge ────────────────────────────────────────────────────────────

    @staticmethod
    def get_knowledge_header() -> Optional[KnowledgeSectionHeader]:
        return KnowledgeSectionHeader.objects.filter(is_active=True).first()

    @staticmethod
    def get_knowledge_categories() -> list[KnowledgeCategory]:
        return list(KnowledgeCategory.objects.filter(is_active=True))

    # ─── CTA Banner ───────────────────────────────────────────────────────────

    @staticmethod
    def get_cta_banner() -> Optional[CTABanner]:
        return CTABanner.objects.filter(is_active=True).first()
