# Generated manually 2026-07-12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('capability', '0003_add_image_fields_phase2'),
    ]

    operations = [
        migrations.AddField(
            model_name='capability',
            name='icon_name',
            field=models.CharField(
                blank=True,
                max_length=50,
                verbose_name='card icon name',
                help_text=(
                    'Heroicon name for the listing card icon (used when no card_icon image is uploaded). '
                    'Options: magnifying-glass, chart-bar, light-bulb, document-text, arrow-trending-up, '
                    'academic-cap, heart, users, globe-alt, sparkles.'
                ),
            ),
        ),
    ]
