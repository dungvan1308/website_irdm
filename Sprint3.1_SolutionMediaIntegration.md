You are a Principal Software Architect, Senior Django Architect, Senior CMS Architect, Senior PostgreSQL Architect, Senior UI/UX Engineer, Senior Frontend Engineer and Senior Graphic Asset Engineer.

Sprint 3 (Solution Module) has already been completed.

Database, Models, CMS, Admin, Service Layer, Templates and Dynamic Content are already implemented.

Your task is NOT to rebuild Sprint 3.

Your task is to complete the Media Framework, Image Management and Demo Assets Integration for the Solution module.

=====================================================================
OBJECTIVE
=====================================================================

Review the existing Solution implementation.

Review the existing CMS.

Review the existing database models.

Review Django Admin.

Review media configuration.

Review seed data.

Review frontend image rendering.

If anything required for image management is missing, implement it.

The Solution module must become fully CMS-driven with complete image management.

=====================================================================
READ PROJECT DOCUMENTATION
=====================================================================

Read:

docs/11_product_spec/004_solution.md

Understand the existing architecture before making any modification.

Do NOT modify business logic unless required for image support.

=====================================================================
READ APPROVED DESIGN
=====================================================================

Read the approved design:

figmapng/
└── solution/
    └── giaiphap.png

This PNG is the ONLY approved visual reference.

Analyse:

• Hero Images

• Partner Images

• Card Images

• Background Images

• CTA Images

• Icons

• Illustrations

• Decorative Graphics

• Image Position

• Image Ratio

• Card Layout

• Hero Layout

Do NOT redesign.

Do NOT simplify.

=====================================================================
STEP 1
REVIEW CURRENT IMPLEMENTATION
=====================================================================

Review the existing implementation.

Verify:

✓ Database Models

✓ CMS

✓ Django Admin

✓ Service Layer

✓ Templates

✓ Views

✓ Seed Command

✓ Media Configuration

Determine whether the project already supports complete media management.

Never assume image support already exists.

=====================================================================
STEP 2
MEDIA FRAMEWORK REVIEW
=====================================================================

Review the Django media configuration.

Verify:

MEDIA_ROOT

MEDIA_URL

ImageField

Image upload

Image rendering

Responsive images

Automatic image deletion

Image replacement

WebP support

Development media serving

Verify settings.py contains:

MEDIA_ROOT

MEDIA_URL

Verify urls.py serves media correctly during development.

If anything is missing, implement it.

=====================================================================
STEP 3
MODEL REVIEW
=====================================================================

Review every Solution model.

Verify support for:

Hero Image

Thumbnail

Cover Image

Card Image

Background Image

CTA Background

Illustration

Partner Image

If ImageField does not exist where appropriate:

Add ImageField.

Generate migrations.

Do not break existing data.

=====================================================================
STEP 4
DJANGO ADMIN REVIEW
=====================================================================

Review Django Admin.

Every ImageField should support:

✓ Upload

✓ Preview

✓ Replace

✓ Remove

✓ Help Text

✓ Fieldsets

✓ Thumbnail Preview

Editors must never modify source code to change images.

If image preview is missing, implement it.

=====================================================================
STEP 5
VISUAL ASSET ANALYSIS
=====================================================================

Analyse the approved PNG.

Classify visual assets into:

Category A

Reusable Images

Hero

Cards

Partners

CTA

Category B

Icons

Illustrations

Category C

Backgrounds

Patterns

Decorations

Category D

Text

Never convert text into images.

Text must remain editable through Django CMS.

=====================================================================
STEP 6
ASSET EXTRACTION
=====================================================================

Extract reusable visual assets whenever possible.

Store under:

media/

solution/

demo/

Recommended structure:

hero/

cards/

partners/

backgrounds/

icons/

illustrations/

cta/

Use meaningful filenames.

Examples:

hero-government.webp

hero-healthcare.webp

partner-government.webp

partner-healthcare.webp

solution-card-01.webp

cta-background.webp

Convert to WebP only when image quality is preserved.

Do not overwrite existing user-uploaded images.

If an asset cannot be extracted reliably, keep a placeholder and report it during the final review.

=====================================================================
STEP 7
SEED IMAGE DATA
=====================================================================

Review:

management/commands/seed_solution.py

Update the command if required.

The command MUST:

Register demo images.

Populate every ImageField.

Remain idempotent.

Never duplicate records.

Support a completely fresh database.

Running:

python manage.py migrate

python manage.py seed_solution

must generate:

✓ Demo Content

✓ Demo Images

✓ Hero Images

✓ Partner Images

✓ Card Images

✓ CTA Backgrounds

✓ Relationships

✓ SEO

without any manual CMS editing.

=====================================================================
STEP 8
FRONTEND UPDATE
=====================================================================

Replace every placeholder image.

Render all images dynamically using ImageField.

Never hardcode image paths.

Reuse existing templates.

Reuse existing shared components.

Do not modify business logic.

=====================================================================
STEP 9
UI POLISH
=====================================================================

Compare the implementation against:

figmapng/
└── solution/
    └── giaiphap.png

Adjust only:

Image Size

Image Ratio

Image Position

Spacing

Card Layout

Hero Layout

Section Spacing

Background Position

The implementation should visually match the approved design as closely as possible.

=====================================================================
STEP 10
FINAL REVIEW
=====================================================================

Provide a complete implementation report.

Include:

✓ Database Review

✓ CMS Review

✓ Admin Review

✓ Media Framework Review

✓ MEDIA_ROOT Review

✓ MEDIA_URL Review

✓ ImageField Review

✓ Image Upload Review

✓ Image Preview Review

✓ Seed Review

✓ Responsive Image Review

✓ Template Review

✓ UI Review

List every feature that was added.

List every asset extracted.

List every asset that still requires manual export from Figma.

=====================================================================
EXPECTED RESULT
=====================================================================

Sprint 3 functionality remains unchanged.

The Solution module now supports:

✓ MEDIA_ROOT

✓ MEDIA_URL

✓ Image Upload

✓ Image Preview

✓ Image Replace

✓ ImageField

✓ Dynamic Hero Images

✓ Dynamic Card Images

✓ Dynamic Partner Images

✓ Dynamic Background Images

✓ Dynamic CTA Images

✓ CMS Image Management

✓ Demo Images

✓ Responsive Images

✓ Pixel-perfect appearance matching:

figmapng/
└── solution/
    └── giaiphap.png

After running:

python manage.py migrate

python manage.py seed_solution

the Solution module should be fully functional with demo data, demo images and no manual configuration required.