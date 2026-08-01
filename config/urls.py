"""URL configuration for the IRDM Website project."""

from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.urls import include, path

admin.site.site_header = "Trang quản trị cho Website IRDM"
admin.site.site_title = "Website IRDM"
admin.site.index_title = "Quản trị nội dung"

urlpatterns = [
    path("admin/", admin.site.urls),
    path("i18n/", include("django.conf.urls.i18n")),
    path("", include("apps.home.urls", namespace="home")),
    path("ve-irdm/", include("apps.about.urls", namespace="about")),
    path("giai-phap/", include("apps.solution.urls", namespace="solution")),
    path("capabilities/", include("apps.capability.urls", namespace="capability")),
    path("tri-thuc-goc-nhin/", include("apps.knowledge.urls", namespace="knowledge")),
    path("chuyen-gia/", include("apps.expert.urls", namespace="expert")),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
