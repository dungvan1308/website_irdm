# Generated migration — adds KPI banner fields, background_image, color_theme and link_url
# to AboutPartnerBenefitSection and AboutPartnerBenefit.

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('about', '0008_legal_org_info_badges_attributes'),
    ]

    operations = [
        # ── AboutPartnerBenefitSection new fields ──
        migrations.AddField(
            model_name='aboutpartnerbenefitsection',
            name='banner_badge',
            field=models.CharField(
                blank=True, max_length=100,
                verbose_name='banner badge',
                help_text="Small label inside the blue banner, e.g. 'GIÁ TRỊ ĐỐI TÁC'",
            ),
        ),
        migrations.AddField(
            model_name='aboutpartnerbenefitsection',
            name='banner_quote',
            field=models.TextField(
                blank=True, verbose_name='banner quote',
                help_text='Testimonial / highlight quote shown in the blue banner.',
            ),
        ),
        migrations.AddField(
            model_name='aboutpartnerbenefitsection',
            name='kpi_label',
            field=models.CharField(
                blank=True, max_length=100,
                verbose_name='KPI label',
                help_text="Small label above the KPI value, e.g. 'KPI'",
            ),
        ),
        migrations.AddField(
            model_name='aboutpartnerbenefitsection',
            name='kpi_value',
            field=models.CharField(
                blank=True, max_length=200,
                verbose_name='KPI value',
                help_text="The prominent KPI value, e.g. '6 giá trị cốt lõi'",
            ),
        ),
        migrations.AddField(
            model_name='aboutpartnerbenefitsection',
            name='background_image',
            field=models.ImageField(
                blank=True, upload_to='about/benefits/bg/',
                verbose_name='background decoration',
                help_text='Optional full-section background image (will be very lightly overlaid).',
            ),
        ),
        # ── AboutPartnerBenefit new fields ──
        migrations.AddField(
            model_name='aboutpartnerbenefit',
            name='color_theme',
            field=models.CharField(
                blank=True, max_length=50,
                verbose_name='icon color theme',
                help_text='Color name: teal | blue | orange | amber | green | purple. Controls icon background.',
            ),
        ),
        migrations.AddField(
            model_name='aboutpartnerbenefit',
            name='link_url',
            field=models.CharField(blank=True, max_length=500, verbose_name='link URL'),
        ),
    ]
