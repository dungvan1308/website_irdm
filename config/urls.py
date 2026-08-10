"""URL configuration for the IRDM Website project."""

from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.urls import include, path
from django.utils.translation import gettext_lazy as _

admin.site.site_header = _("IRDM Website administration")
admin.site.site_title = _("IRDM Website admin")
admin.site.index_title = _("Content administration")

handler404 = "apps.common.views.error_404"

urlpatterns = [
    path("admin/", admin.site.urls),
    path("i18n/", include("django.conf.urls.i18n")),
    path("", include("apps.home.urls", namespace="home")),
    path("ve-irdm/", include("apps.about.urls", namespace="about")),
    path("giai-phap/", include("apps.solution.urls", namespace="solution")),
    path("capabilities/", include("apps.capability.urls", namespace="capability")),
    path("tri-thuc-goc-nhin/", include("apps.knowledge.urls", namespace="knowledge")),
    path("chuyen-gia/", include("apps.expert.urls", namespace="expert")),
    path("lien-he/", include("apps.contact.urls", namespace="contact")),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
