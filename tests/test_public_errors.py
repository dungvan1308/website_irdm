from django.test import TestCase, override_settings
from django.urls import reverse


@override_settings(
    ALLOWED_HOSTS=["testserver"],
    STORAGES={
        "default": {"BACKEND": "django.core.files.storage.FileSystemStorage"},
        "staticfiles": {"BACKEND": "django.contrib.staticfiles.storage.StaticFilesStorage"},
    },
)
class PublicRoutingTests(TestCase):
    def test_legacy_event_url_redirects_to_knowledge_events_section(self):
        response = self.client.get(reverse("legacy_events"))

        self.assertRedirects(
            response,
            "/tri-thuc-goc-nhin/#tin-tuc-su-kien",
            fetch_redirect_response=False,
        )

    @override_settings(DEBUG=False)
    def test_unknown_url_uses_public_404_page(self):
        response = self.client.get("/duong-dan-khong-ton-tai/")

        self.assertEqual(response.status_code, 404)
        self.assertTemplateUsed(response, "errors/404.html")
        self.assertContains(response, "Nội dung hiện chưa khả dụng", status_code=404)
        self.assertNotContains(response, "Using the URLconf", status_code=404)