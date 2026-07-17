"""
Migration: add CTA section fields to CapabilityListingPage.

Adds 7 fields that power the full-width 'Kết nối với IRDM' CTA section
above the footer on the Capability listing page.
"""

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('capability', '0004_add_icon_image_to_howstep'),
    ]

    operations = [
        migrations.AddField(
            model_name='capabilitylistingpage',
            name='cta_show',
            field=models.BooleanField(
                default=True,
                help_text="Hiển thị hoặc ẩn section 'Kết nối với IRDM' phía trên Footer.",
                verbose_name='show CTA section',
            ),
        ),
        migrations.AddField(
            model_name='capabilitylistingpage',
            name='cta_bg_image',
            field=models.ImageField(
                blank=True,
                help_text='Ảnh nền full-width cho section CTA.',
                upload_to='capability/cta/',
                verbose_name='CTA background image',
            ),
        ),
        migrations.AddField(
            model_name='capabilitylistingpage',
            name='cta_eyebrow',
            field=models.CharField(
                blank=True,
                help_text="Dòng chữ nhỏ phía trên tiêu đề, e.g. 'KẾT NỐI VỚI IRDM'.",
                max_length=200,
                verbose_name='CTA eyebrow text',
            ),
        ),
        migrations.AddField(
            model_name='capabilitylistingpage',
            name='cta_heading',
            field=models.CharField(
                blank=True,
                help_text='Tiêu đề lớn của section CTA.',
                max_length=400,
                verbose_name='CTA heading',
            ),
        ),
        migrations.AddField(
            model_name='capabilitylistingpage',
            name='cta_description',
            field=models.TextField(
                blank=True,
                help_text='Mô tả ngắn bên dưới tiêu đề CTA.',
                verbose_name='CTA description',
            ),
        ),
        migrations.AddField(
            model_name='capabilitylistingpage',
            name='cta_overlay_color',
            field=models.CharField(
                blank=True,
                default='#0a1628',
                help_text='Màu overlay dạng hex, e.g. #0a1628.',
                max_length=30,
                verbose_name='overlay color',
            ),
        ),
        migrations.AddField(
            model_name='capabilitylistingpage',
            name='cta_overlay_opacity',
            field=models.PositiveSmallIntegerField(
                default=75,
                help_text='Độ mờ overlay: 0 = trong suốt, 100 = đục hoàn toàn.',
                verbose_name='overlay opacity (0–100)',
            ),
        ),
    ]
