from django.contrib import admin

from .models import ContactRequest


@admin.register(ContactRequest)
class ContactRequestAdmin(admin.ModelAdmin):
	list_display = (
		"full_name",
		"organization",
		"inquiry_type",
		"email",
		"status",
		"created_at",
	)
	list_filter = ("status", "inquiry_type", "created_at")
	list_editable = ("status",)
	search_fields = ("full_name", "email", "phone", "organization", "message")
	readonly_fields = ("created_at", "updated_at", "source_url")
	date_hierarchy = "created_at"
	ordering = ("-created_at",)
	fieldsets = (
		("Thông tin liên hệ", {"fields": ("full_name", "email", "phone", "organization")}),
		("Nội dung trao đổi", {"fields": ("inquiry_type", "message")}),
		("Xử lý", {"fields": ("status", "source_url", "created_at", "updated_at")}),
	)
