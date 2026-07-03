"""Homepage service layer — all business logic for the public homepage."""

from __future__ import annotations

from typing import Optional

from .models import FeaturedSectionConfig, HeroSection, PartnerLogo, StatisticItem


class HomeService:
    """Retrieve all data required to render the public homepage."""

    @staticmethod
    def get_hero() -> Optional[HeroSection]:
        """Return the first active hero section by display order."""
        return HeroSection.objects.filter(is_active=True).first()

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
