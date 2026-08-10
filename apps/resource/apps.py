from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class ResourceConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "apps.resource"
    label = "resource"
    verbose_name = _("Resources")
