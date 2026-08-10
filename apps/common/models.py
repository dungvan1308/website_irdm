"""Shared abstract models for the IRDM project."""

import uuid

from django.db import models
from django.utils.translation import gettext_lazy as _


class BaseModel(models.Model):
    """Abstract base model providing audit fields, UUID primary key, ordering and soft-delete."""

    id = models.UUIDField(
        primary_key=True,
        default=uuid.uuid4,
        editable=False,
    )
    is_active = models.BooleanField(_("is active"), default=True, db_index=True)
    display_order = models.PositiveIntegerField(_("display order"), default=0, db_index=True)
    created_at = models.DateTimeField(_("created at"), auto_now_add=True)
    updated_at = models.DateTimeField(_("updated at"), auto_now=True)

    class Meta:
        abstract = True
        ordering = ["display_order", "created_at"]
