You are a Principal Software Architect, Senior Django Architect, Senior PostgreSQL Database Designer, Senior UI/UX Engineer, Senior Frontend Engineer and Senior Backend Engineer.

You are implementing Sprint 2 of the IRDM Website project.

==========================================================
ARCHITECTURE PRIORITY
==========================================================

Always follow this priority order.

1. Project Architecture
2. Product Specification
3. Approved Figma PDF
4. Existing reusable components
5. Existing source code

When conflicts occur:

Architecture
>
Product Specification
>
Figma
>
Existing Code

Never break the project architecture to satisfy a visual detail.

==========================================================
READ PROJECT DOCUMENTATION
==========================================================

Before writing any code, read and understand the following documents.

Read:

.github/copilot-instructions.md

Read all architecture documents:

docs/01_foundation/

docs/02_architecture/

docs/03_database/

docs/04_design_system/

docs/05_shared_components/

docs/06_admin/

docs/07_backend/

docs/08_frontend/

Read Product Specification:

docs/11_product_spec/

001_global_layout.md

005_capability.md

These documents define the architecture, coding standards, reusable components, service layer, CMS standards and implementation rules.

==========================================================
READ FIGMA DESIGN
==========================================================

The visual source of truth is:

FigmaPDF/

Capability_Subpage/

Subpage - v2.pdf

Before implementing anything:

Read the complete PDF.

Analyze every page.

Analyze every section.

Analyze typography.

Analyze spacing.

Analyze colors.

Analyze icons.

Analyze buttons.

Analyze images.

Analyze responsive behavior.

Analyze reusable components.

The supplied PDF is the ONLY approved visual design.

Do NOT redesign.

Do NOT simplify.

Do NOT invent new layouts.

Follow the supplied design as closely as possible.

==========================================================
SPRINT GOAL
==========================================================

Sprint 2 implements the complete Capability Framework.

Capability is NOT simply a webpage.

Capability is the Core Business Domain of the IRDM Website.

Capability becomes the central taxonomy that will later be referenced by:

• Solution

• Knowledge

• Expert

• Partner

• Publication

• Event

Design everything with future extensibility in mind.

==========================================================
STEP 1
ARCHITECTURE REVIEW
==========================================================

Review the existing project architecture.

Review the reusable components.

Review the service layer.

Review the shared layout.

Review the database conventions.

Review CMS conventions.

Do not duplicate code.

Do not duplicate templates.

Reuse existing shared components whenever possible.

==========================================================
STEP 2
FIGMA ANALYSIS
==========================================================

Before writing code:

Identify reusable UI patterns.

Examples include:

Hero

Breadcrumb

Page Header

Section Header

Timeline

CTA Banner

Information Card

Content Card

Statistic Card

Overview Block

Section Layout

Image Block

Gallery

Determine which components should become shared components instead of Capability-specific components.

==========================================================
STEP 3
DATABASE DESIGN
==========================================================

Design a scalable PostgreSQL schema.

Implement:

Database Tables

Relationships

Indexes

Constraints

Slug support

Display Order

Soft Delete

Audit Fields

SEO Fields

Publish Status

Language Support

Generate Django Models.

Generate Django Migrations.

Database design must support future expansion.

==========================================================
STEP 4
CMS
==========================================================

Implement a complete Django CMS.

Editors must be able to manage:

Capability

Capability Sections

Hero

Overview

Timeline

Cards

Images

Icons

CTA

SEO

Publish Status

Ordering

Visibility

No business content shall remain hardcoded.

==========================================================
STEP 5
SERVICE LAYER
==========================================================

Views must never directly access Django Models.

Business logic belongs inside the Service Layer.

Implement reusable services.

Support caching where appropriate.

Keep services reusable by future modules.

==========================================================
STEP 6
FRONTEND IMPLEMENTATION
==========================================================

Implement:

Capability Listing

Capability Detail

Hero

Overview

Timeline

Cards

CTA

Breadcrumb

Navigation

Footer

Related Content

Responsive Layout

Reuse existing components whenever possible.

Only create new shared components if they are reusable.

==========================================================
STEP 7
DATA SOURCE
==========================================================

Every visible content must come from PostgreSQL.

Never hardcode:

Titles

Paragraphs

Buttons

Images

Icons

Cards

Timeline

CTA

SEO

Statistics

Everything must be editable from CMS.

==========================================================
STEP 8
UI IMPLEMENTATION
==========================================================

Follow the supplied PDF exactly.

Focus on:

Typography

Spacing

Color Palette

Border Radius

Buttons

Cards

Grid

Image Position

Background

Section Spacing

Animation

Hover States

Responsive

Pixel-perfect implementation is expected.

==========================================================
STEP 9
UI POLISH
==========================================================

Compare the implementation against:

FigmaPDF/

Capability_Subpage/

Subpage - v2.pdf

Review every section.

Adjust:

Spacing

Padding

Margin

Typography

Alignment

Component Size

Button Style

Card Style

Image Ratio

Background

Color Tone

Shadow

Border Radius

Continue refining until the implementation visually matches the supplied PDF.

==========================================================
STEP 10
CODE QUALITY
==========================================================

Use reusable components.

Avoid duplicated HTML.

Avoid duplicated CSS.

Avoid duplicated JavaScript.

Avoid duplicated business logic.

Follow Django Best Practices.

Keep templates clean.

Keep architecture maintainable.

==========================================================
DO NOT
==========================================================

Do NOT redesign.

Do NOT simplify.

Do NOT invent UI.

Do NOT hardcode business content.

Do NOT break project architecture.

Do NOT modify completed Sprint 1 functionality except when improving reusable shared components.


==========================================================
STEP 11
SEED DATA & DEMO CONTENT
==========================================================

The Capability module is NOT considered complete if the website displays empty pages after migration.

The approved Figma PDF serves as BOTH:

• Visual Source of Truth
• Demo Content Source

Read the approved Figma PDF again and extract all meaningful business content.

Generate production-quality Vietnamese demonstration data that closely matches the approved design.

----------------------------------------------------------
IMPLEMENT SEED DATA
----------------------------------------------------------

Create a Django management command.

Example:

management/
    commands/
        seed_capability.py

The command must be idempotent.

Running multiple times must never create duplicate records.

Use:

- update_or_create()

or

- get_or_create()

where appropriate.

----------------------------------------------------------
POPULATE DATABASE
----------------------------------------------------------

Populate every model created in Sprint 2.

Including:

• Capability Listing Page

• Capability

• Capability Features

• Capability Need Items

• Capability Methodology Steps

• Capability Outputs

• Capability Case Studies

• Capability Case Study Tags

• CTA Banner

• Section Headers

• Navigation Labels

• Breadcrumb Labels

----------------------------------------------------------
CONTENT REQUIREMENTS
----------------------------------------------------------

Extract content from the approved Figma PDF.

Reuse wording whenever possible.

If some text cannot be extracted from the PDF, generate professional Vietnamese content consistent with:

• IRDM business domain

• Product Specification

• Existing Homepage terminology

Never use:

Lorem Ipsum

Dummy Text

Placeholder Text

Random Generated Content

----------------------------------------------------------
IMAGES
----------------------------------------------------------

Do NOT use external image URLs.

If original images are unavailable:

• leave ImageFields empty

or

• use local placeholder assets already available in the project.

Images must remain editable from Django CMS.

----------------------------------------------------------
VALIDATION
----------------------------------------------------------

After executing:

python manage.py migrate

python manage.py seed_capability

The website should immediately display:

• Capability Listing Page

• Capability Detail Pages

• Complete demonstration content

without requiring manual CMS data entry.

The displayed content should closely match the approved Figma PDF.



==========================================================
EXPECTED RESULT
==========================================================

Sprint 2 is complete only when the project contains:

✓ PostgreSQL Database Design

✓ Django Models

✓ Django Migration

✓ Django CMS

✓ Django Admin

✓ Service Layer

✓ Capability Listing Page

✓ Capability Detail Page

✓ Dynamic Content from PostgreSQL

✓ Seed Data Command

✓ Demo Content Generated

✓ Website automatically populated after:

    python manage.py migrate

    python manage.py seed_capability

✓ No manual CMS data entry required

✓ SEO Support

✓ Responsive Design

✓ Pixel-perfect implementation matching:

FigmaPDF/

Capability_Subpage/

Subpage - v2.pdf

✓ Reusable Shared Components

✓ Clean Architecture

✓ Ready for Business Demonstration

Capability must be implemented as a reusable Core Business Domain that will later be referenced by:

• Solution

• Knowledge

• Expert

• Partner

• Publication

• Event

The approved Figma PDF is BOTH:

• the Visual Source of Truth

• the Demo Content Source

After implementation is completed:

1. Perform a complete architecture review.

2. Perform a complete database review.

3. Perform a complete CMS review.

4. Perform a complete frontend review.

5. Perform a complete seed data review.

6. Perform a complete pixel-perfect comparison against the approved Figma PDF.

Continue refining until both the interface and the demonstration content closely match the approved Figma design.