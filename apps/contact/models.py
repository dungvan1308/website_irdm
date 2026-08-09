"""Models for public contact enquiries."""

from django.db import models
from django.utils.translation import gettext_lazy as _


class ContactRequest(models.Model):
	class InquiryType(models.TextChoices):
		CONSULTING = "consulting", _("Tư vấn và thiết kế giải pháp")
		RESEARCH = "research", _("Nghiên cứu và hợp tác chuyên môn")
		TRAINING = "training", _("Đào tạo và phát triển năng lực")
		EXPERT = "expert", _("Kết nối chuyên gia")
		OTHER = "other", _("Nhu cầu khác")

	class Status(models.TextChoices):
		NEW = "new", _("Mới tiếp nhận")
		IN_PROGRESS = "in_progress", _("Đang xử lý")
		COMPLETED = "completed", _("Đã hoàn tất")

	full_name = models.CharField(_("full name"), max_length=200)
	email = models.EmailField(_("email"))
	phone = models.CharField(_("phone"), max_length=50, blank=True)
	organization = models.CharField(_("organization"), max_length=300, blank=True)
	inquiry_type = models.CharField(
		_("inquiry type"),
		max_length=30,
		choices=InquiryType.choices,
	)
	message = models.TextField(_("message"))
	status = models.CharField(
		_("status"),
		max_length=20,
		choices=Status.choices,
		default=Status.NEW,
		db_index=True,
	)
	source_url = models.CharField(_("source URL"), max_length=500, blank=True)
	created_at = models.DateTimeField(_("created at"), auto_now_add=True, db_index=True)
	updated_at = models.DateTimeField(_("updated at"), auto_now=True)

	class Meta:
		ordering = ["-created_at"]
		verbose_name = _("contact request")
		verbose_name_plural = _("contact requests")

	def __str__(self) -> str:
		return f"{self.full_name} - {self.get_inquiry_type_display()}"
