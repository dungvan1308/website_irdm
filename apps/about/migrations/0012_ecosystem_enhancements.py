# Generated migration — adds background_image, hub_label, primary/secondary CTAs to AboutCapabilityEcosystem.

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('about', '0011_target_audience_bg'),
    ]

    operations = [
        migrations.AddField(
            model_name='aboutcapabilityecosystem',
            name='background_image',
            field=models.ImageField(blank=True, upload_to='about/ecosystem/bg/', verbose_name='background image'),
        ),
        migrations.AddField(
            model_name='aboutcapabilityecosystem',
            name='hub_label',
            field=models.CharField(blank=True, default='IRDM\nHub', max_length=100, verbose_name='hub label'),
        ),
        migrations.AddField(
            model_name='aboutcapabilityecosystem',
            name='primary_cta_label',
            field=models.CharField(blank=True, max_length=100, verbose_name='primary CTA label'),
        ),
        migrations.AddField(
            model_name='aboutcapabilityecosystem',
            name='primary_cta_url',
            field=models.CharField(blank=True, max_length=500, verbose_name='primary CTA URL'),
        ),
        migrations.AddField(
            model_name='aboutcapabilityecosystem',
            name='secondary_cta_label',
            field=models.CharField(blank=True, max_length=100, verbose_name='secondary CTA label'),
        ),
        migrations.AddField(
            model_name='aboutcapabilityecosystem',
            name='secondary_cta_url',
            field=models.CharField(blank=True, max_length=500, verbose_name='secondary CTA URL'),
        ),
        migrations.AlterField(
            model_name='aboutcapabilityecosystem',
            name='diagram_image',
            field=models.ImageField(blank=True, upload_to='about/ecosystem/', verbose_name='hub diagram image'),
        ),
    ]
