from django.db import migrations
from django.utils.html import linebreaks, strip_tags


def convert_plain_text_bodies(apps, schema_editor):
    for model_name in ("KnowledgeArticle", "KnowledgeActivityNews"):
        model = apps.get_model("knowledge", model_name)
        for item in model.objects.exclude(body="").iterator():
            if strip_tags(item.body) == item.body:
                item.body = linebreaks(item.body, autoescape=True)
                item.save(update_fields=["body"])


class Migration(migrations.Migration):
    dependencies = [
        ("knowledge", "0013_alter_knowledgeaccordionitem_created_at_and_more"),
    ]

    operations = [
        migrations.RunPython(convert_plain_text_bodies, migrations.RunPython.noop),
    ]
