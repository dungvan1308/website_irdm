from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("expert", "0021_expert_detail_page_fields"),
    ]

    operations = [
        migrations.AddField(
            model_name="expert",
            name="hero_cta_label",
            field=models.CharField(
                blank=True,
                default="",
                help_text="Nhãn nút CTA trên hero. Để trống → dùng mặc định 'Liên hệ hợp tác'.",
                max_length=100,
                verbose_name="hero CTA label",
            ),
        ),
    ]
