"""Solution module URL configuration."""

from django.urls import path

from .views import SolutionDetailView, SolutionListingView

app_name = "solution"

urlpatterns = [
    path("", SolutionListingView.as_view(), name="listing"),
    path("<slug:slug>/", SolutionDetailView.as_view(), name="detail"),
]

