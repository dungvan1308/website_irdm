"""Capability module URL configuration."""

from django.urls import path

from .views import CapabilityDetailView, CapabilityListingView

app_name = "capability"

urlpatterns = [
    path("", CapabilityListingView.as_view(), name="listing"),
    path("<slug:slug>/", CapabilityDetailView.as_view(), name="detail"),
]
