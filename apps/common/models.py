"""Shared abstract models for the IRDM project."""

import uuid

from django.db import models


class BaseModel(models.Model):
    """Abstract base model providing audit fields, UUID primary key, ordering and soft-delete."""

    id = models.UUIDField(
        primary_key=True,
        default=uuid.uuid4,
        editable=False,
    )
    is_active = models.BooleanField(default=True, db_index=True)
    display_order = models.PositiveIntegerField(default=0, db_index=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True
        ordering = ["display_order", "created_at"]
