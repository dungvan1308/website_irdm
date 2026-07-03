You are a Senior Django Enterprise Solution Architect and Full Stack Developer.

Your task is to implement ONE complete business capability.

This project follows:

- Domain Driven Design (DDD)
- Modular Monolith Architecture
- CMS-First Development
- Service Layer Pattern
- HTMX Architecture
- PostgreSQL
- Django Best Practices

Do NOT generate a static website.

Implement a complete business capability from:

Database
→ CMS
→ Service Layer
→ Public Website

==================================================
CURRENT SPRINT
==================================================

Sprint

Sprint 1

Business Capability

Homepage

Only implement Homepage.

Do NOT implement

- About
- Solutions
- Capabilities
- Experts
- Insights
- Events
- Resources
- Contact

==================================================
STEP 1
READ PROJECT KNOWLEDGE BASE
==================================================

Before writing any code, carefully read and understand the following documentation.

Project Rules

- .github/copilot-instructions.md

Foundation

- docs/01_foundation/

Architecture

- docs/02_architecture/

Database

- docs/03_database/

Design System

- docs/04_design_system/

Shared Components

- docs/05_shared/

Business Modules

- docs/06_modules/

Admin

- docs/07_admin/

Frontend

- docs/08_frontend/

Backend

- docs/09_backend/

Homepage Product Specification

- docs/11_product_spec/001_global_layout.md

- docs/11_product_spec/002_homepage.md

Treat all documentation as mandatory implementation requirements.

==================================================
STEP 2
READ THE FIGMA
==================================================

Before implementing anything,

carefully open and analyze

FigmaPDF/Homepage-v2-header-scroll.pdf

Treat this PDF as the ONLY Visual Source of Truth.

Read the entire document.

Analyze

- Layout
- Sections
- Components
- Navigation
- Header
- Footer
- Cards
- Typography
- Images
- Icons
- Buttons
- Responsive Layout
- Visual Hierarchy
- Spacing

Do NOT start implementation until the Homepage Figma has been completely analyzed.

==================================================
STEP 3
ANALYZE
==================================================

Before generating code,

identify

- Homepage Sections

- Reusable Components

- CMS Editable Areas

- Business Entities

- Database Entities

- Relationships

- Shared Components

Reuse existing project architecture whenever possible.

==================================================
STEP 4
DESIGN
==================================================

Before coding,

design

1.

Database Schema

2.

Business Entities

3.

Django Models

4.

CMS Structure

5.

Service Layer

6.

Public Homepage

Validate your design against

- Knowledge Base

- Product Specification

- Homepage Figma

==================================================
STEP 5
IMPLEMENT
==================================================

Implement in this order.

1.

Database

2.

Django Models

3.

Database Migration

4.

CMS

5.

Django Admin

6.

Service Layer

7.

Public Homepage

==================================================
CMS REQUIREMENTS
==================================================

Every Homepage section shown in the Figma must be editable.

Editors must be able to

- Create

- Edit

- Delete

- Publish

- Unpublish

- Upload Images

- Change Display Order

- Enable / Disable

All Homepage business content must be stored in PostgreSQL.

==================================================
PUBLIC WEBSITE
==================================================

The Homepage must NEVER contain hardcoded business content.

Every Homepage section must retrieve data from PostgreSQL through the Service Layer.

Views must never access Models directly.

Templates are presentation only.

==================================================
DESIGN RULES
==================================================

Follow the Homepage Figma exactly.

Do NOT

- redesign

- simplify

- merge sections

- remove sections

If Product Specification and Figma differ

Use

Figma

for visual implementation.

Use

Product Specification

for business behavior.

==================================================
SELF REVIEW
==================================================

Before finishing,

perform a complete architecture review.

Verify

✓ Database

✓ Django Models

✓ Migration

✓ CMS

✓ Django Admin

✓ Service Layer

✓ PostgreSQL

✓ Public Homepage

✓ Responsive

✓ Design System

✓ HTMX

✓ Architecture Compliance

Run

python manage.py check

python manage.py makemigrations

python manage.py migrate

Fix every issue before finishing.

==================================================
EXPECTED RESULT
==================================================

Sprint 1 is complete only when

✓ Database is designed

✓ Migration succeeds

✓ PostgreSQL stores Homepage data

✓ CMS manages Homepage content

✓ Django Admin is production-ready

✓ Service Layer is implemented

✓ Homepage loads data from PostgreSQL

✓ Homepage matches

FigmaPDF/Homepage-v2-header-scroll.pdf

✓ No Homepage business content is hardcoded

✓ python manage.py check returns 0 issues

==================================================
OUTPUT
==================================================

Return

1. Architecture Summary

2. Database Design

3. Business Entities

4. Django Models

5. Database Migrations

6. CMS Features

7. Django Admin Features

8. Service Layer

9. Homepage Implementation

10. Files Created

11. Files Updated

12. Self Review

13. Readiness Score

==================================================
STOP
==================================================

Stop after Sprint 1 has been fully implemented.

Do NOT implement any other business module.