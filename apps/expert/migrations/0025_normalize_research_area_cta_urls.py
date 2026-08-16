from django.db import migrations, models


def normalize_cta_urls(apps, schema_editor):
    ResearchArea = apps.get_model("expert", "ResearchArea")
    for area in ResearchArea.objects.filter(card_cta_url__contains="?linh-vuc="):
        url = area.card_cta_url.replace("?linh-vuc=", "?area=", 1)
        if "#" not in url:
            url += "#tim-kiem"
        area.card_cta_url = url
        area.save(update_fields=["card_cta_url"])


def restore_cta_urls(apps, schema_editor):
    ResearchArea = apps.get_model("expert", "ResearchArea")
    for area in ResearchArea.objects.filter(card_cta_url__contains="?area="):
        url = area.card_cta_url.replace("?area=", "?linh-vuc=", 1)
        if url.endswith("#tim-kiem"):
            url = url[:-len("#tim-kiem")]
        area.card_cta_url = url
        area.save(update_fields=["card_cta_url"])


class Migration(migrations.Migration):
    dependencies = [
        ("expert", "0024_expert_profile_tagline"),
    ]

    operations = [
        migrations.AlterField(
            model_name="researcharea",
            name="card_cta_url",
            field=models.CharField(
                blank=True,
                default="/chuyen-gia/",
                help_text="Đường dẫn khi nhấn CTA, e.g. /chuyen-gia/?area=kinh-te#tim-kiem",
                max_length=500,
                verbose_name="CTA URL",
            ),
        ),
        migrations.RunPython(normalize_cta_urls, restore_cta_urls),
    ]