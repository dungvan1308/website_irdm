from django.apps import apps
from django.contrib.auth import get_user_model
from django.test import TestCase, override_settings
from django.urls import reverse
from django.utils import translation

from apps.expert.models import Expert


@override_settings(
	STORAGES={
		"default": {
			"BACKEND": "django.core.files.storage.FileSystemStorage",
		},
		"staticfiles": {
			"BACKEND": "django.contrib.staticfiles.storage.StaticFilesStorage",
		},
	}
)
class AdminInternationalizationTests(TestCase):
	@classmethod
	def setUpTestData(cls):
		cls.admin_user = get_user_model().objects.create_superuser(
			username="i18n-admin",
			email="i18n-admin@example.com",
			password="test-password",
		)

	def test_app_and_model_names_translate_between_english_and_vietnamese(self):
		expert_app = apps.get_app_config("expert")

		with translation.override("en"):
			self.assertEqual(str(expert_app.verbose_name), "Experts")
			self.assertEqual(str(Expert._meta.verbose_name_plural), "experts")

		with translation.override("vi"):
			self.assertEqual(str(expert_app.verbose_name), "Chuyên gia")
			self.assertEqual(str(Expert._meta.verbose_name_plural), "Các chuyên gia")

	def test_admin_language_switcher_changes_admin_language(self):
		self.client.force_login(self.admin_user)
		admin_url = reverse("admin:index")
		language_url = reverse("set_language")

		self.client.post(language_url, {"language": "vi", "next": admin_url})
		vietnamese_response = self.client.get(admin_url)

		self.assertContains(vietnamese_response, "Quản trị Website IRDM")
		self.assertContains(vietnamese_response, "Chuyên gia")
		self.assertContains(vietnamese_response, 'name="language" value="en"')
		self.assertContains(vietnamese_response, 'name="language" value="vi"')

		self.client.post(language_url, {"language": "en", "next": admin_url})
		english_response = self.client.get(admin_url)

		self.assertContains(english_response, "IRDM Website administration")
		self.assertContains(english_response, "Experts")
