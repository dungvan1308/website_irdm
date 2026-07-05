You are a Principal Software Architect, Senior Django Architect, Senior PostgreSQL Database Designer, Senior UI/UX Engineer, Senior Frontend Engineer, Senior Backend Engineer and Senior CMS Architect.

You are implementing the Solution module (Sprint 3) of the IRDM Website.

=====================================================================
IMPLEMENTATION OBJECTIVE
=====================================================================

Implement the complete Solution module following the approved project architecture.

The Solution module is NOT simply a webpage.

It is a reusable business domain that will later integrate with:

• Capability
• Knowledge
• Expert
• Partner
• Publication
• Event

The implementation must follow Enterprise Architecture, be CMS-driven, reusable, maintainable and pixel-perfect.

=====================================================================
ARCHITECTURE PRIORITY
=====================================================================

Always follow this priority.

1. Project Architecture
2. Product Specification
3. Approved Figma PDF
4. Extracted Assets
5. Existing Shared Components
6. Existing Source Code

Never break the project architecture in order to satisfy a visual detail.

=====================================================================
READ PROJECT DOCUMENTATION
=====================================================================

Before writing any code, read and understand:

.github/copilot-instructions.md

Read all architecture documents

docs/01_foundation/

docs/02_architecture/

docs/03_database/

docs/04_design_system/

docs/05_shared_components/

docs/06_admin/

docs/07_backend/

docs/08_frontend/

Read Product Specification

docs/11_product_spec/

001_global_layout.md

004_solution.md

These documents define the project architecture, coding standards, reusable components, CMS rules, service layer, UI rules and implementation constraints.

=====================================================================
READ APPROVED FIGMA DESIGN
=====================================================================

The ONLY approved visual design is located at:

FigmaPDF/

Solution_Subpage/

GiaiPhap.pdf

Before implementing anything you MUST:

Read the complete PDF.

Analyse every page.

Analyse every section.

Analyse typography.

Analyse spacing.

Analyse colors.

Analyse icons.

Analyse illustrations.

Analyse buttons.

Analyse images.

Analyse CTA.

Analyse responsive behaviour.

Analyse reusable UI patterns.

Do NOT redesign.

Do NOT simplify.

Do NOT invent layouts.

The supplied PDF is the ONLY approved visual reference.

=====================================================================
STEP 1
ARCHITECTURE REVIEW
=====================================================================

Review the current project architecture.

Review reusable components.

Review existing shared layouts.

Review Service Layer.

Review CMS architecture.

Review Design System.

Review database conventions.

Review Product Specification.

Reuse existing components whenever possible.

Do not duplicate components.

=====================================================================
STEP 2
FIGMA ANALYSIS
=====================================================================

Identify every reusable component inside the PDF.

Examples:

Hero

Breadcrumb

Section Header

Overview

Content Block

Solution Category

Challenge Card

Methodology

Benefits

Timeline

CTA Banner

Gallery

Footer CTA

Navigation

Determine which components should become reusable shared components.

=====================================================================
STEP 3
ASSET EXTRACTION
=====================================================================

Read GiaiPhap.pdf.

Extract all reusable assets.

Including:

• Hero Images

• Background Images

• Illustrations

• Icons

• Logos

• Card Images

• Decorative Graphics

Store extracted assets under

FigmaPDF/

Solution_Subpage/

extracted_assets/

Use meaningful filenames.

Preserve the highest possible quality.

Convert to WebP only when appropriate.

Do not overwrite existing assets.

=====================================================================
STEP 4
DATABASE DESIGN
=====================================================================

Design a scalable PostgreSQL schema.

Support:

Solution

Solution Category

Hero

Overview

Challenge

Methodology

Outputs

CTA

Related Capability

SEO

Publish Status

Display Order

Language

Media

Audit Fields

ImageField

Generate Django Models.

Generate Django Migrations.

=====================================================================
STEP 5
CMS IMPLEMENTATION
=====================================================================

Editors must manage:

Hero

Overview

Categories

Challenges

Methodology

Outputs

CTA

SEO

Publish Status

Ordering

Visibility

Images

Icons

Illustrations

Background Images

No business content shall remain hardcoded.

=====================================================================
STEP 6
SERVICE LAYER
=====================================================================

Views must never directly access Django Models.

Implement reusable services.

Business logic belongs inside the Service Layer.

Support caching where appropriate.

Design for future REST API and Headless CMS.

=====================================================================
STEP 7
FRONTEND IMPLEMENTATION
=====================================================================

Implement:

Solution Landing Page

Solution Detail Page

Hero

Overview

Solution Categories

Challenges

Methodology

Outputs

CTA

Breadcrumb

Related Capability

Footer

Responsive Layout

Reuse shared components whenever possible.

=====================================================================
STEP 8
DYNAMIC CONTENT
=====================================================================

Everything displayed on the website must come from PostgreSQL.

Never hardcode:

Titles

Paragraphs

Buttons

Images

Illustrations

Icons

Navigation

Statistics

CTA

SEO

Everything must be editable through Django CMS.

=====================================================================
STEP 9
SEED DATA
=====================================================================

Generate complete demo data.

Include:

Solution Categories

Hero

Overview

Challenges

Methodology

Outputs

CTA

Relationships

Navigation

SEO

Register all extracted images.

Populate ImageField automatically.

Running:

python manage.py migrate

python manage.py seed_solution

must generate a demonstration-ready website.

=====================================================================
STEP 10
UI IMPLEMENTATION
=====================================================================

Follow the approved PDF exactly.

Focus on:

Typography

Spacing

Padding

Margins

Cards

Buttons

Background

Images

Illustrations

Grid

Color Palette

Section Spacing

Hover

Animation

Responsive Behaviour

Pixel-perfect implementation is required.

=====================================================================
STEP 11
FINAL REVIEW
=====================================================================

Compare the implementation against:

FigmaPDF/

Solution_Subpage/

GiaiPhap.pdf

Review every section.

Review every component.

Review typography.

Review colors.

Review spacing.

Review responsiveness.

Continue refining until the implementation closely matches the approved design.

=====================================================================
DO NOT
=====================================================================

Do NOT redesign.

Do NOT simplify.

Do NOT invent layouts.

Do NOT hardcode business content.

Do NOT hardcode image paths.

Do NOT break project architecture.

Do NOT duplicate components.

Do NOT duplicate business logic.

=====================================================================
EXPECTED RESULT
=====================================================================

Sprint 3 is complete only when the project contains:

✓ PostgreSQL Database Design

✓ Django Models

✓ Django Migration

✓ Django CMS

✓ Django Admin

✓ Service Layer

✓ Solution Landing Page

✓ Solution Detail Page

✓ Dynamic Content from PostgreSQL

✓ Image Upload via CMS

✓ Asset Extraction from PDF

✓ Seed Data

✓ Responsive Design

✓ SEO Support

✓ Pixel-perfect implementation matching GiaiPhap.pdf

✓ Clean Architecture

✓ Reusable Shared Components

After implementation is completed, perform a complete UI review against the approved PDF and continue refining until the website visually matches the approved design as closely as possible.