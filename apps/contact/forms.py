from django import forms
from django.utils.translation import gettext_lazy as _

from .models import ContactRequest


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
