"""Knowledge module URL configuration."""

from django.urls import path

from .views import KnowledgeArticleDetailView, KnowledgeListingView

app_name = "knowledge"

urlpatterns = [
    path("", KnowledgeListingView.as_view(), name="listing"),
    path("<slug:slug>/", KnowledgeArticleDetailView.as_view(), name="detail"),
]
