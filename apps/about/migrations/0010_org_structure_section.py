# Generated migration — adds AboutOrgStructureSection, AboutOrgStructureCard,
# and AboutOrgStructureBulletItem for the Org Structure section on the About page.

import uuid
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('about', '0009_partner_benefit_enhancements'),
    ]

    operations = [
        # ── AboutOrgStructureSection ──────────────────────────────────────────
        migrations.CreateModel(
            name='AboutOrgStructureSection',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('is_active', models.BooleanField(db_index=True, default=True, verbose_name='is active')),
                ('display_order', models.PositiveIntegerField(db_index=True, default=0, verbose_name='display order')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('section_label', models.CharField(blank=True, max_length=200, verbose_name='section label',
                                                    help_text='Badge text, e.g. CẤU TRÚC')),
                ('title', models.CharField(max_length=300, verbose_name='title')),
                ('description', models.TextField(blank=True, verbose_name='description')),
                ('primary_cta_label', models.CharField(blank=True, max_length=100, verbose_name='primary CTA label')),
                ('primary_cta_url', models.CharField(blank=True, max_length=500, verbose_name='primary CTA URL')),
                ('secondary_cta_label', models.CharField(blank=True, max_length=100, verbose_name='secondary CTA label')),
                ('secondary_cta_url', models.CharField(blank=True, max_length=500, verbose_name='secondary CTA URL')),
                ('background_image', models.ImageField(blank=True, upload_to='about/org_structure/bg/',
                                                        verbose_name='background decoration')),
            ],
            options={
                'verbose_name': 'org structure section',
                'verbose_name_plural': 'org structure sections',
                'ordering': ['display_order', 'created_at'],
                'abstract': False,
            },
        ),
        # ── AboutOrgStructureCard ─────────────────────────────────────────────
        migrations.CreateModel(
            name='AboutOrgStructureCard',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('is_active', models.BooleanField(db_index=True, default=True, verbose_name='is active')),
                ('display_order', models.PositiveIntegerField(db_index=True, default=0, verbose_name='display order')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('section', models.ForeignKey(
                    on_delete=django.db.models.deletion.CASCADE,
                    related_name='cards',
                    to='about.aboutorgstructuresection',
                    verbose_name='section',
                )),
                ('icon', models.CharField(blank=True, max_length=100, verbose_name='icon (heroicon name)')),
                ('icon_image', models.ImageField(blank=True, upload_to='about/org_structure/icons/',
                                                  verbose_name='icon image')),
                ('color_theme', models.CharField(
                    blank=True, max_length=50, verbose_name='color theme',
                    help_text='Color name: navy | blue | orange | amber | purple | green | teal',
                )),
                ('title', models.CharField(max_length=200, verbose_name='title')),
                ('view_more_label', models.CharField(blank=True, default='Xem thêm', max_length=100,
                                                      verbose_name='view more label')),
                ('view_more_url', models.CharField(blank=True, max_length=500, verbose_name='view more URL')),
            ],
            options={
                'verbose_name': 'org structure card',
                'verbose_name_plural': 'org structure cards',
                'ordering': ['display_order', 'created_at'],
                'abstract': False,
            },
        ),
        # ── AboutOrgStructureBulletItem ───────────────────────────────────────
        migrations.CreateModel(
            name='AboutOrgStructureBulletItem',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('is_active', models.BooleanField(db_index=True, default=True, verbose_name='is active')),
                ('display_order', models.PositiveIntegerField(db_index=True, default=0, verbose_name='display order')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('card', models.ForeignKey(
                    on_delete=django.db.models.deletion.CASCADE,
                    related_name='bullet_items',
                    to='about.aboutorgstructurecard',
                    verbose_name='card',
                )),
                ('text', models.CharField(max_length=300, verbose_name='text')),
            ],
            options={
                'verbose_name': 'org structure bullet item',
                'verbose_name_plural': 'org structure bullet items',
                'ordering': ['display_order', 'created_at'],
                'abstract': False,
            },
        ),
    ]
