"""Expert module URL configuration."""

from django.urls import path, re_path

from .views import ExpertDetailView, ExpertListingView, ExpertSearchView

app_name = "expert"

urlpatterns = [
    path("", ExpertListingView.as_view(), name="listing"),
    path("tim-kiem/", ExpertSearchView.as_view(), name="search"),
    re_path(r"^(?P<slug>[-\w]+)/$", ExpertDetailView.as_view(), name="detail"),
]
