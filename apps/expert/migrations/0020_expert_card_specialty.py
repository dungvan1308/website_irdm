from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('expert', '0019_association_model'),
    ]

    operations = [
        migrations.AddField(
            model_name='expert',
            name='card_specialty',
            field=models.CharField(
                blank=True,
                max_length=200,
                verbose_name='card specialty label',
                help_text=(
                    "Nhãn chuyên môn nổi bật trên card listing, e.g. 'Giáo dục & phát triển năng lực'. "
                    "Để trống → tự động dùng Research Area đầu tiên."
                ),
            ),
        ),
    ]
