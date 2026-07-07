from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class CapabilityConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "apps.capability"
    label = "capability"
    verbose_name = _("Capability")
