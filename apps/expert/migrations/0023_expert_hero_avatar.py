from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("expert", "0022_expert_hero_cta_label"),
    ]

    operations = [
        migrations.AddField(
            model_name="expert",
            name="hero_avatar",
            field=models.ImageField(
                blank=True,
                upload_to="expert/hero_avatars/",
                verbose_name="hero avatar",
                help_text=(
                    "Ảnh chân dung riêng cho Hero Section trang hồ sơ chuyên gia. "
                    "Để trống → tự động dùng Avatar chung ở trên. "
                    "Khuyến nghị: portrait dọc, tỉ lệ 3:4, tối thiểu 600×800 px."
                ),
            ),
        ),
    ]
