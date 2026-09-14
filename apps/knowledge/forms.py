from django import forms
from django.core.exceptions import ValidationError
from django_ckeditor_5.widgets import CKEditor5Widget

from .models import KnowledgeActivityNews, KnowledgeArticle, KnowledgeDownloadRequest, KnowledgeNewsItem
from .rich_text import RichTextImageError, normalize_rich_text


class RichBodyAdminFormMixin:
    def clean_body(self):
        try:
            return normalize_rich_text(self.cleaned_data.get("body", ""))
        except RichTextImageError as exc:
            raise ValidationError(str(exc)) from exc


class KnowledgeArticleAdminForm(RichBodyAdminFormMixin, forms.ModelForm):
    def clean_summary(self):
        try:
            return normalize_rich_text(self.cleaned_data.get("summary", ""))
        except RichTextImageError as exc:
            raise ValidationError(str(exc)) from exc

    class Meta:
        model = KnowledgeArticle
        fields = "__all__"
        help_texts = {
            "summary": "Có thể định dạng nội dung và dán hình ảnh. Ảnh sẽ được lưu vào thư viện media của IRDM.",
            "body": "Có thể dán nội dung từ website hoặc Word. Ảnh sẽ được tải về thư viện media của IRDM khi lưu.",
        }
        widgets = {
            "title": forms.TextInput(attrs={"style": "width: 100%; box-sizing: border-box;"}),
            "slug": forms.TextInput(attrs={"style": "width: 100%; box-sizing: border-box;"}),
            "summary": CKEditor5Widget(
                attrs={"class": "django_ckeditor_5"},
                config_name="knowledge",
            ),
            "body": CKEditor5Widget(
                attrs={"class": "django_ckeditor_5"},
                config_name="knowledge",
            ),
        }


class KnowledgeActivityNewsAdminForm(RichBodyAdminFormMixin, forms.ModelForm):
    def clean_summary(self):
        try:
            return normalize_rich_text(self.cleaned_data.get("summary", ""))
        except RichTextImageError as exc:
            raise ValidationError(str(exc)) from exc

    class Meta:
        model = KnowledgeActivityNews
        fields = "__all__"
        help_texts = {
            "summary": "Có thể định dạng nội dung và dán hình ảnh. Ảnh sẽ được lưu vào thư viện media của IRDM.",
            "body": "Có thể dán nội dung từ website hoặc Word. Ảnh sẽ được tải về thư viện media của IRDM khi lưu.",
        }
        widgets = {
            "title": forms.TextInput(attrs={"style": "width: 100%; box-sizing: border-box;"}),
            "slug": forms.TextInput(attrs={"style": "width: 100%; box-sizing: border-box;"}),
            "summary": CKEditor5Widget(
                attrs={"class": "django_ckeditor_5"},
                config_name="knowledge",
            ),
            "body": CKEditor5Widget(
                attrs={"class": "django_ckeditor_5"},
                config_name="knowledge",
            ),
        }


class KnowledgeNewsItemAdminForm(forms.ModelForm):
    def clean_summary(self):
        try:
            return normalize_rich_text(self.cleaned_data.get("summary", ""))
        except RichTextImageError as exc:
            raise ValidationError(str(exc)) from exc

    class Meta:
        model = KnowledgeNewsItem
        fields = "__all__"
        help_texts = {
            "summary": "Có thể định dạng nội dung và dán hình ảnh. Ảnh sẽ được lưu vào thư viện media của IRDM.",
        }
        widgets = {
            "title": forms.Textarea(attrs={"rows": 2, "style": "width: 100%; box-sizing: border-box;"}),
            "summary": CKEditor5Widget(
                attrs={"class": "django_ckeditor_5"},
                config_name="knowledge",
            ),
            "source_url": forms.URLInput(attrs={"style": "width: 100%; box-sizing: border-box;"}),
        }


class KnowledgeDownloadRequestForm(forms.ModelForm):
    """Form for submitting a document download request."""

    class Meta:
        model = KnowledgeDownloadRequest
        fields = ["full_name", "organization", "email", "note"]
