# Generated migration — adds background_color and background_image to AboutTargetAudienceSection.

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('about', '0010_org_structure_section'),
    ]

    operations = [
        migrations.AddField(
            model_name='abouttargetaudiencesection',
            name='background_color',
            field=models.CharField(
                blank=True, max_length=100,
                verbose_name='background color',
                help_text='CSS hex color for section background, e.g. #0b3d6b for dark navy. Leave blank for white.',
            ),
        ),
        migrations.AddField(
            model_name='abouttargetaudiencesection',
            name='background_image',
            field=models.ImageField(
                blank=True, upload_to='about/audience/bg/',
                verbose_name='background image',
            ),
        ),
    ]
