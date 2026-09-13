from django import forms
from django.core.exceptions import ValidationError
from django_ckeditor_5.widgets import CKEditor5Widget

from .models import KnowledgeActivityNews, KnowledgeArticle, KnowledgeDownloadRequest
from .rich_text import RichTextImageError, normalize_rich_text


class RichBodyAdminFormMixin:
    def clean_body(self):
        try:
            return normalize_rich_text(self.cleaned_data.get("body", ""))
        except RichTextImageError as exc:
            raise ValidationError(str(exc)) from exc


class KnowledgeArticleAdminForm(RichBodyAdminFormMixin, forms.ModelForm):
    class Meta:
        model = KnowledgeArticle
        fields = "__all__"
        help_texts = {
            "body": "Có thể dán nội dung từ website hoặc Word. Ảnh sẽ được tải về thư viện media của IRDM khi lưu.",
        }
        widgets = {
            "body": CKEditor5Widget(
                attrs={"class": "django_ckeditor_5"},
                config_name="knowledge",
            ),
        }


class KnowledgeActivityNewsAdminForm(RichBodyAdminFormMixin, forms.ModelForm):
    class Meta:
        model = KnowledgeActivityNews
        fields = "__all__"
        help_texts = {
            "body": "Có thể dán nội dung từ website hoặc Word. Ảnh sẽ được tải về thư viện media của IRDM khi lưu.",
        }
        widgets = {
            "body": CKEditor5Widget(
                attrs={"class": "django_ckeditor_5"},
                config_name="knowledge",
            ),
        }


class KnowledgeDownloadRequestForm(forms.ModelForm):
    """Form for submitting a document download request."""

    class Meta:
        model = KnowledgeDownloadRequest
        fields = ["full_name", "organization", "email", "note"]
