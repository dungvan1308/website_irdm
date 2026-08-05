from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("expert", "0023_expert_hero_avatar"),
    ]

    operations = [
        migrations.AddField(
            model_name="expert",
            name="profile_tagline",
            field=models.TextField(
                blank=True,
                help_text="Mô tả ngắn riêng cho trang Hồ sơ chuyên gia. Để trống → dùng Short bio làm dự phòng.",
                verbose_name="profile tagline",
            ),
        ),
    ]
