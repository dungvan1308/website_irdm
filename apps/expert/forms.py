"""Expert module forms."""

from django import forms


class ExpertSearchForm(forms.Form):
    """Search and filter form for the Expert directory."""

    q = forms.CharField(
        required=False,
        label="Tìm kiếm",
        widget=forms.TextInput(attrs={
            "placeholder": "Tên, chức danh, đơn vị, lĩnh vực...",
            "autocomplete": "off",
        }),
    )
    group = forms.CharField(required=False, widget=forms.HiddenInput())
    area = forms.CharField(required=False, widget=forms.HiddenInput())
