from django.contrib import admin, messages
from django.utils.translation import gettext_lazy as _

from .forms import EmailSettingsAdminForm
from .models import ContactRequest, EmailSettings
from .services import send_contact_notification, send_test_email, test_smtp_connection


@admin.register(ContactRequest)
class ContactRequestAdmin(admin.ModelAdmin):
	list_display = (
		"full_name",
		"organization",
		"inquiry_type",
		"email",
		"status",
		"notification_status",
		"created_at",
	)
	list_filter = ("status", "notification_status", "inquiry_type", "created_at")
	list_editable = ("status",)
	search_fields = ("full_name", "email", "phone", "organization", "message")
	readonly_fields = (
		"created_at", "updated_at", "source_url", "notification_status",
		"notification_sent_at", "notification_attempts", "notification_error",
	)
	actions = ("resend_email_notifications",)
	date_hierarchy = "created_at"
	ordering = ("-created_at",)
	fieldsets = (
		("Thông tin liên hệ", {"fields": ("full_name", "email", "phone", "organization")}),
		("Nội dung trao đổi", {"fields": ("inquiry_type", "message")}),
		("Xử lý", {"fields": ("status", "source_url", "created_at", "updated_at")}),
		("Thông báo email", {"fields": (
			"notification_status", "notification_sent_at", "notification_attempts", "notification_error",
		)}),
	)

	@admin.action(description=_("Resend email notification for selected requests"))
	def resend_email_notifications(self, request, queryset):
		sent_count = sum(send_contact_notification(item) for item in queryset)
		self.message_user(
			request,
			_("Sent %(sent)s of %(total)s email notifications.") % {
				"sent": sent_count,
				"total": queryset.count(),
			},
			messages.SUCCESS if sent_count == queryset.count() else messages.WARNING,
		)


@admin.register(EmailSettings)
class EmailSettingsAdmin(admin.ModelAdmin):
	form = EmailSettingsAdminForm
	change_form_template = "admin/contact/emailsettings/change_form.html"
	fieldsets = (
		(_("Delivery"), {"fields": ("enabled", "contact_recipient", "from_name", "from_email")}),
		(_("SMTP server"), {"fields": ("host", "port", "security", "username", "smtp_password", "password_saved")}),
		(_("Connection"), {"fields": ("timeout", "last_tested_at", "last_test_succeeded", "last_test_message")}),
	)
	readonly_fields = ("password_saved", "last_tested_at", "last_test_succeeded", "last_test_message")

	@admin.display(boolean=True, description=_("Password saved"))
	def password_saved(self, obj):
		return bool(obj and obj.encrypted_password)

	def has_module_permission(self, request):
		return request.user.is_superuser

	def has_view_permission(self, request, obj=None):
		return request.user.is_superuser

	def has_add_permission(self, request):
		return request.user.is_superuser and not EmailSettings.objects.exists()

	def has_change_permission(self, request, obj=None):
		return request.user.is_superuser

	def has_delete_permission(self, request, obj=None):
		return False

	def response_change(self, request, obj):
		if "_test_connection" in request.POST:
			try:
				test_smtp_connection(obj)
			except Exception as exc:
				self.message_user(request, _("SMTP connection failed: %(error)s") % {"error": exc}, messages.ERROR)
			else:
				self.message_user(request, _("SMTP connection succeeded."), messages.SUCCESS)
		elif "_send_test_email" in request.POST:
			try:
				send_test_email(obj)
			except Exception as exc:
				self.message_user(request, _("Test email failed: %(error)s") % {"error": exc}, messages.ERROR)
			else:
				self.message_user(request, _("Test email sent to %(email)s.") % {"email": obj.contact_recipient}, messages.SUCCESS)
		return super().response_change(request, obj)
