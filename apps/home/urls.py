"""Homepage URL configuration."""

from django.urls import path

from .views import FeaturedSectionView, HomePageView, PartnerPageView, StatisticsSectionView

app_name = "home"

urlpatterns = [
    path("", HomePageView.as_view(), name="index"),
    path("doi-tac/", PartnerPageView.as_view(), name="partners"),
    # HTMX partials
    path(
        "partials/statistics/",
        StatisticsSectionView.as_view(),
        name="statistics",
    ),
    path(
        "partials/section/<str:section_key>/",
        FeaturedSectionView.as_view(),
        name="featured_section",
    ),
]
