# Sprint 3 - Solution Module

# Implementation Guide

Version: 2.0

---

# Objective

Implement the Solution module according to the project architecture, Product Specification and approved design.

Do not redesign the page.

Do not simplify the design.

Do not hardcode business content.

---

# Read Before Implementation

Read the following documents in order.

## Project Rules

.github/copilot-instructions.md

---

## Project Architecture

docs/01_foundation/

docs/02_architecture/

docs/03_database/

docs/04_design_system/

docs/05_shared_components/

docs/06_admin/

docs/07_backend/

docs/08_frontend/

---

## Product Specification

docs/11_product_spec/001_global_layout.md

docs/11_product_spec/004_solution.md

---

## Approved Design

Read the approved design.

```text
figmapng/
└── solution/
    └── GiaiPhap.png
```

The PNG is the visual source of truth.

---

# Architecture Priority

Always follow this order.

1. Project Architecture

2. Product Specification

3. Approved PNG

4. Existing Shared Components

5. Existing Source Code

Never break the project architecture to match a visual detail.

---

# Review Existing Implementation

Before writing code:

Review:

- Models
- Migrations
- Admin
- CMS
- Service Layer
- Templates
- Shared Components
- Existing Solution module

Reuse existing implementation whenever possible.

Do not duplicate code.

---

# Database

Implement all models defined in:

docs/11_product_spec/004_solution.md

Generate:

- Models
- Migrations
- Relationships
- Constraints
- Display Order
- Publish Status
- SEO Fields
- ImageField

---

# CMS

Implement a complete Django CMS.

Editors must manage:

- Landing Page
- Solution Sections
- Hero
- Overview
- Related Capabilities
- Outputs
- CTA
- Images
- SEO
- Display Order
- Publish Status

No business content may remain hardcoded.

---

# Media

Implement complete media support.

Review and implement if missing:

- MEDIA_ROOT
- MEDIA_URL
- ImageField
- Image Upload
- Image Preview
- Dynamic Image Rendering

Images shall be managed through Django CMS.

Demo images may be extracted from:

```text
figmapng/
└── solution/
    └── GiaiPhap.png
```

---

# Service Layer

Views must never access models directly.

Implement reusable services.

Business logic belongs inside the Service Layer.

Prepare the module for future REST API and Headless CMS support.

---

# Frontend

Implement:

- Landing Page
- Hero
- Solution Navigator
- Value Proposition
- Solution Sections
- Related Capabilities
- Outputs
- CTA
- Footer

Reuse existing shared components.

Do not duplicate templates.

---

# Dynamic Rendering

Render the Landing Page dynamically.

Pseudo flow:

```text
Landing

↓

Load Published Solution Sections

↓

Loop

    Hero

    Overview

    Related Capabilities

    Outputs

    CTA

End Loop

↓

Footer
```

Never hardcode:

Government

Healthcare

Education

Enterprise

NGO

The frontend must support unlimited Solution Sections.

---

# Seed Data

Implement:

management/commands/seed_solution.py

The command shall:

- Create Landing Page
- Create Solution Sections
- Create Related Capabilities
- Create Outputs
- Create CTA
- Register Demo Images
- Populate ImageField

The command must remain idempotent.

Running:

python manage.py migrate

python manage.py seed_solution

must generate a complete demonstration website.

---

# UI Synchronization

Compare the rendered website with:

```text
figmapng/
└── solution/
    └── GiaiPhap.png
```

Review every section.

Adjust:

- Layout
- Typography
- Spacing
- Grid
- Hero
- Images
- Card Layout
- CTA
- Responsive Behaviour

Continue refining until the implementation closely matches the approved design.

---

# Implementation Rules

Always:

- Reuse shared components.
- Reuse existing templates.
- Reuse existing services.
- Preserve project architecture.
- Keep business content inside PostgreSQL.
- Keep images inside Django CMS.

Never:

- Hardcode content.
- Hardcode image paths.
- Duplicate templates.
- Duplicate business logic.
- Redesign the UI.

---

# Expected Result

Sprint 3 is complete when the project contains:

✓ Solution Landing Page

✓ Dynamic Solution Sections

✓ Django Models

✓ PostgreSQL Database

✓ Django CMS

✓ Django Admin

✓ Service Layer

✓ Shared Components

✓ Dynamic Rendering

✓ Image Upload

✓ Image Preview

✓ Demo Seed Data

✓ Responsive Design

✓ SEO Support

✓ UI closely matching:

figmapng/solution/GiaiPhap.png

✓ Clean Enterprise Architecture