You are a Principal Software Architect, Senior Django Architect, Senior PostgreSQL Architect, Senior CMS Architect, Senior UI/UX Engineer, Senior Frontend Engineer and Senior Graphic Asset Engineer.

=====================================================================
OBJECTIVE
=====================================================================

Sprint 3 (Solution Module) has already been completed.

Database, Models, CMS, Django Admin, Service Layer, Templates, Dynamic Content and Seed Data already exist.

Do NOT re-implement Sprint 3.

Your task is to perform a complete Visual Synchronization and Media Integration for the Solution module.

The goal is to make the current implementation visually match the approved design as closely as possible while keeping the existing architecture unchanged.

=====================================================================
ARCHITECTURE RULE
=====================================================================

Never recreate completed functionality.

Reuse existing:

Models

Database

CMS

Admin

Templates

Views

Services

Components

Only implement missing media-related functionality.

Preserve backward compatibility.

=====================================================================
READ PRODUCT SPECIFICATION
=====================================================================

Read:

docs/11_product_spec/004_solution.md

Use this document as the business specification.

=====================================================================
READ CURRENT IMPLEMENTATION
=====================================================================

Review the existing implementation.

Review:

Database

Models

Admin

CMS

Templates

Views

Services

Tailwind Components

Shared Components

Media Settings

Seed Command

Understand the current implementation before making changes.

=====================================================================
READ APPROVED DESIGN
=====================================================================

Read the approved design.

figmapng/

solution/

giaiphap.png

This PNG is the ONLY approved visual reference.

Do NOT redesign.

Do NOT simplify.

=====================================================================
STEP 1
VISUAL GAP ANALYSIS
=====================================================================

Render the current website.

Compare every section against:

figmapng/

solution/

giaiphap.png

Identify every visual difference.

Including:

Layout

Grid

Hero

Cards

Spacing

Padding

Margins

Typography

Buttons

Backgrounds

Illustrations

Images

Icons

CTA

Section Order

Responsive Behaviour

Shadow

Border Radius

Animation

Document every difference before making changes.

=====================================================================
STEP 2
MEDIA FRAMEWORK REVIEW
=====================================================================

Review the existing media framework.

Verify:

MEDIA_ROOT

MEDIA_URL

ImageField

Image Upload

Image Preview

Image Replace

Automatic Image Deletion

Responsive Image Rendering

Development Media Serving

Image Optimization

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

Partner Image

Illustration

CTA Background

If ImageField is missing:

Add it.

Generate migrations.

Preserve existing data.

=====================================================================
STEP 4
DJANGO ADMIN REVIEW
=====================================================================

Review Django Admin.

Every ImageField must support:

Upload

Preview

Replace

Remove

Help Text

Thumbnail Preview

Editors must be able to replace every image without modifying source code.

=====================================================================
STEP 5
VISUAL ASSET ANALYSIS
=====================================================================

Analyse the approved PNG.

Classify every visual element.

Category A

Reusable Images

Hero

Cards

Partners

CTA

Category B

Illustrations

Icons

Category C

Background

Patterns

Decorations

Category D

Text

Never convert text into images.

All text must remain editable through Django CMS.

=====================================================================
STEP 6
ASSET EXTRACTION
=====================================================================

Extract reusable visual assets whenever possible.

Store assets under:

media/

solution/

demo/

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

background-pattern.webp

cta-background.webp

Convert to WebP only when quality is preserved.

Do not overwrite user-uploaded files.

If an asset cannot be extracted reliably:

Keep the existing placeholder.

Report it in the final review.

=====================================================================
STEP 7
SEED IMAGE DATA
=====================================================================

Review:

management/commands/seed_solution.py

Update if required.

The command must:

Register demo images.

Populate every ImageField.

Remain idempotent.

Support fresh databases.

Never duplicate records.

Running:

python manage.py migrate

python manage.py seed_solution

must generate:

Demo Content

Demo Images

Hero Images

Partner Images

Background Images

CTA Images

Relationships

SEO

without manual CMS editing.

=====================================================================
STEP 8
FRONTEND SYNCHRONIZATION
=====================================================================

Replace every placeholder image.

Render every image dynamically using ImageField.

Never hardcode image paths.

Reuse existing templates.

Reuse shared components.

Do not modify business logic.

=====================================================================
STEP 9
VISUAL SYNCHRONIZATION
=====================================================================

Do NOT stop after importing images.

Continue refining the implementation.

Fix:

Layout

Grid

Spacing

Typography

Buttons

Cards

Image Ratio

Image Position

Background

Illustrations

Section Height

Responsive Behaviour

Continue comparing against:

figmapng/

solution/

giaiphap.png

until the rendered website visually matches the approved design as closely as possible.

=====================================================================
STEP 10
FULL PAGE REVIEW
=====================================================================

Review EVERY section.

Do not stop after Hero.

Review the complete page from top to bottom.

Every section should closely match the approved PNG.

=====================================================================
STEP 11
FINAL SELF REVIEW
=====================================================================

Provide a complete report.

Architecture Review

Database Review

CMS Review

Admin Review

Media Framework Review

MEDIA_ROOT Review

MEDIA_URL Review

ImageField Review

Image Upload Review

Image Preview Review

Seed Review

Responsive Review

Visual Synchronization Review

List:

Images Extracted

Images Imported

Missing Assets

Remaining Technical Debt

=====================================================================
EXPECTED RESULT
=====================================================================

The Solution module must provide:

✓ Existing architecture preserved

✓ Existing business logic preserved

✓ MEDIA_ROOT configured

✓ MEDIA_URL configured

✓ Complete ImageField support

✓ Django Admin image upload

✓ Django Admin image preview

✓ Dynamic image rendering

✓ Demo image registration

✓ Image seed command

✓ Pixel-perfect implementation

✓ Layout synchronized with the approved design

✓ Responsive layout

✓ Complete CMS image management

✓ No placeholder images where reusable assets could be extracted

The implementation is complete only when the rendered website visually matches:

figmapng/
└── solution/
    └── giaiphap.png

as closely as possible without breaking the existing project architecture.