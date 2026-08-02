"""About page service layer."""

from __future__ import annotations

from typing import Optional

from .models import (
    AboutCTABanner,
    AboutCapabilityEcosystem,
    AboutContactBanner,
    AboutCoreValue,
    AboutCoreValueSection,
    AboutHero,
    AboutIntroduction,
    AboutLegalInfo,
    AboutNetworkSectionHeader,
    AboutPageSEO,
    AboutPartnerBenefitSection,
    AboutProfessionalNetwork,
    AboutPurpose,
    AboutTargetAudienceSection,
    AboutVisionMission,
)


class AboutService:
    """Retrieve all data required to render the About page."""

    @staticmethod
    def get_seo() -> Optional[AboutPageSEO]:
        return AboutPageSEO.objects.filter(is_active=True).first()

    @staticmethod
    def get_hero() -> Optional[AboutHero]:
        return (
            AboutHero.objects
            .filter(is_active=True)
            .prefetch_related("statistics")
            .first()
        )

    @staticmethod
    def get_introduction() -> Optional[AboutIntroduction]:
        return (
            AboutIntroduction.objects
            .filter(is_active=True)
            .prefetch_related("highlight_cards")
            .first()
        )

    @staticmethod
    def get_purpose() -> Optional[AboutPurpose]:
        return AboutPurpose.objects.filter(is_active=True).first()

    @staticmethod
    def get_vision_mission() -> Optional[AboutVisionMission]:
        return (
            AboutVisionMission.objects
            .filter(is_active=True)
            .prefetch_related("cards", "bottom_icons")
            .first()
        )

    @staticmethod
    def get_core_value_section() -> Optional[AboutCoreValueSection]:
        return AboutCoreValueSection.objects.filter(is_active=True).first()

    @staticmethod
    def get_core_values() -> list[AboutCoreValue]:
        return list(AboutCoreValue.objects.filter(is_active=True))

    @staticmethod
    def get_legal_info() -> Optional[AboutLegalInfo]:
        return (
            AboutLegalInfo.objects
            .filter(is_active=True)
            .prefetch_related("timeline_items", "org_badges", "org_attributes")
            .first()
        )

    @staticmethod
    def get_cta_banner() -> Optional[AboutCTABanner]:
        return AboutCTABanner.objects.filter(is_active=True).first()

    @staticmethod
    def get_partner_benefit_section() -> Optional[AboutPartnerBenefitSection]:
        return (
            AboutPartnerBenefitSection.objects
            .filter(is_active=True)
            .prefetch_related("benefits")
            .first()
        )

    @staticmethod
    def get_network_header() -> Optional[AboutNetworkSectionHeader]:
        return AboutNetworkSectionHeader.objects.filter(is_active=True).first()

    @staticmethod
    def get_professional_networks() -> list[AboutProfessionalNetwork]:
        return list(AboutProfessionalNetwork.objects.filter(is_active=True))

    @staticmethod
    def get_target_audience_section() -> Optional[AboutTargetAudienceSection]:
        return (
            AboutTargetAudienceSection.objects
            .filter(is_active=True)
            .prefetch_related("audiences")
            .first()
        )

    @staticmethod
    def get_capability_ecosystem() -> Optional[AboutCapabilityEcosystem]:
        return (
            AboutCapabilityEcosystem.objects
            .filter(is_active=True)
            .prefetch_related(
                "partner_groups",
                "partner_groups__items",
                "statistics",
            )
            .first()
        )

    @staticmethod
    def get_contact_banner() -> Optional[AboutContactBanner]:
        return AboutContactBanner.objects.filter(is_active=True).first()
