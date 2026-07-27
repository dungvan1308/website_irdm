"""Expert module URL configuration."""

from django.urls import path

from .views import ExpertDetailView, ExpertListingView, ExpertSearchView

app_name = "expert"

urlpatterns = [
    path("", ExpertListingView.as_view(), name="listing"),
    path("tim-kiem/", ExpertSearchView.as_view(), name="search"),
    path("<slug:slug>/", ExpertDetailView.as_view(), name="detail"),
]
