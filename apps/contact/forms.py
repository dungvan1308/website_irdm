from django import forms
from django.conf import settings
from django.utils.translation import gettext_lazy as _

from .models import ContactRequest, EmailSettings
from .services import encrypt_password


INPUT_CLASSES = (
	"w-full rounded-lg border border-slate-300 bg-white px-4 py-3 text-sm "
	"text-slate-800 placeholder:text-slate-400 focus:border-primary-500 "
	"focus:outline-none focus:ring-2 focus:ring-primary-200"
)


class ContactRequestForm(forms.ModelForm):
	class Meta:
		model = ContactRequest
		fields = [
			"full_name",
			"email",
			"phone",
			"organization",
			"inquiry_type",
			"message",
		]
		labels = {
			"full_name": _("Họ và tên"),
			"email": _("Email"),
			"phone": _("Số điện thoại"),
			"organization": _("Cơ quan / Tổ chức"),
			"inquiry_type": _("Nhu cầu trao đổi"),
			"message": _("Nội dung bạn muốn trao đổi"),
		}
		widgets = {
			"full_name": forms.TextInput(attrs={"class": INPUT_CLASSES, "placeholder": _("Nguyễn Văn A"), "autocomplete": "name"}),
			"email": forms.EmailInput(attrs={"class": INPUT_CLASSES, "placeholder": _("email@donvi.vn"), "autocomplete": "email"}),
			"phone": forms.TextInput(attrs={"class": INPUT_CLASSES, "placeholder": _("(+84) ..."), "autocomplete": "tel"}),
			"organization": forms.TextInput(attrs={"class": INPUT_CLASSES, "placeholder": _("Tên cơ quan, trường, bệnh viện hoặc doanh nghiệp"), "autocomplete": "organization"}),
			"inquiry_type": forms.Select(attrs={"class": INPUT_CLASSES}),
			"message": forms.Textarea(attrs={"class": f"{INPUT_CLASSES} resize-none", "rows": 6, "placeholder": _("Chia sẻ ngắn gọn bối cảnh, nhu cầu và kết quả bạn đang hướng tới...")}),
		}

	def clean_message(self) -> str:
		message = self.cleaned_data["message"].strip()
		if len(message) < 20:
			raise forms.ValidationError(_("Vui lòng nhập nội dung ít nhất 20 ký tự."))
		return message


class EmailSettingsAdminForm(forms.ModelForm):
	smtp_password = forms.CharField(
		label=_("SMTP App Password"),
		required=False,
		widget=forms.PasswordInput(render_value=False, attrs={"autocomplete": "new-password"}),
		help_text=_("Leave blank to keep the saved password. For Gmail, use a 16-character App Password."),
	)

	class Meta:
		model = EmailSettings
		fields = "__all__"

	def clean(self):
		cleaned_data = super().clean()
		password = cleaned_data.get("smtp_password")
		if password and not settings.EMAIL_CREDENTIAL_KEY:
			raise forms.ValidationError(
				_("EMAIL_CREDENTIAL_KEY must be configured in .env before saving an SMTP password."),
			)
		if cleaned_data.get("enabled"):
			for field_name in ("host", "username", "from_email", "contact_recipient"):
				if not cleaned_data.get(field_name):
					self.add_error(field_name, _("This field is required when email notifications are enabled."))
			if not password and not self.instance.encrypted_password:
				self.add_error("smtp_password", _("Enter an SMTP App Password to enable email notifications."))
		return cleaned_data

	def save(self, commit=True):
		instance = super().save(commit=False)
		password = self.cleaned_data.get("smtp_password")
		if password:
			instance.encrypted_password = encrypt_password(password)
		if commit:
			instance.save()
			self.save_m2m()
		return instance
