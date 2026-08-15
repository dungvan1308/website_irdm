"""Knowledge module URL configuration."""

from django.urls import path

from .views import (
    KnowledgeActivityNewsDetailView,
    KnowledgeArticleDetailView,
    KnowledgeListingView,
)

app_name = "knowledge"

urlpatterns = [
    path("", KnowledgeListingView.as_view(), name="listing"),
    path(
        "tin-hoat-dong/<slug:slug>/",
        KnowledgeActivityNewsDetailView.as_view(),
        name="activity_detail",
    ),
    path("<slug:slug>/", KnowledgeArticleDetailView.as_view(), name="detail"),
]
