from django.db import migrations, models
from django.utils.text import slugify


def populate_activity_news_slugs(apps, schema_editor):
    activity_news_model = apps.get_model("knowledge", "KnowledgeActivityNews")
    used_slugs = set()

    for item in activity_news_model.objects.order_by("created_at", "pk"):
        base_slug = slugify(item.title) or f"tin-hoat-dong-{item.pk}"
        slug = base_slug[:300]
        suffix = 2

        while slug in used_slugs:
            suffix_text = f"-{suffix}"
            slug = f"{base_slug[:300 - len(suffix_text)]}{suffix_text}"
            suffix += 1

        item.slug = slug
        item.save(update_fields=["slug"])
        used_slugs.add(slug)


class Migration(migrations.Migration):

    dependencies = [
        ("knowledge", "0011_add_ready_section_and_cta_button"),
    ]

    operations = [
        migrations.AddField(
            model_name="knowledgeactivitynews",
            name="slug",
            field=models.CharField(blank=True, max_length=300, null=True),
        ),
        migrations.AddField(
            model_name="knowledgeactivitynews",
            name="hero_image",
            field=models.ImageField(
                blank=True,
                help_text="Ảnh lớn trên trang chi tiết; nếu trống sẽ dùng ảnh thu nhỏ.",
                upload_to="knowledge/activity_news/hero/",
                verbose_name="hero image",
            ),
        ),
        migrations.AddField(
            model_name="knowledgeactivitynews",
            name="body",
            field=models.TextField(blank=True, verbose_name="content"),
        ),
        migrations.AddField(
            model_name="knowledgeactivitynews",
            name="author_name",
            field=models.CharField(blank=True, max_length=200, verbose_name="author name"),
        ),
        migrations.AddField(
            model_name="knowledgeactivitynews",
            name="read_time",
            field=models.PositiveIntegerField(
                default=3,
                help_text="Thời gian đọc ước tính theo phút.",
                verbose_name="read time (minutes)",
            ),
        ),
        migrations.AddField(
            model_name="knowledgeactivitynews",
            name="meta_title",
            field=models.CharField(blank=True, max_length=200, verbose_name="meta title"),
        ),
        migrations.AddField(
            model_name="knowledgeactivitynews",
            name="meta_description",
            field=models.CharField(blank=True, max_length=300, verbose_name="meta description"),
        ),
        migrations.RunPython(populate_activity_news_slugs, migrations.RunPython.noop),
        migrations.AlterField(
            model_name="knowledgeactivitynews",
            name="slug",
            field=models.SlugField(max_length=300, unique=True, verbose_name="slug"),
        ),
    ]