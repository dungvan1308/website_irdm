from django import forms

from .models import KnowledgeDownloadRequest


class KnowledgeDownloadRequestForm(forms.ModelForm):
    """Form for submitting a document download request."""

    class Meta:
        model = KnowledgeDownloadRequest
        fields = ["full_name", "organization", "email", "note"]
