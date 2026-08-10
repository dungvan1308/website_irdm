from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class ExpertConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "apps.expert"
    label = "expert"
    verbose_name = _("Experts")
