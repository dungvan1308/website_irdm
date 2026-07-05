# 004. Solution Module

## Product Specification

Version: 2.0

Status: Approved

---

# 1. Module Overview

The Solution module presents IRDM solutions for different customer groups through a single dynamic Landing Page.

The module is implemented as a CMS-driven business domain where all business content, images and relationships are managed through Django CMS.

Business users can create, update, publish, reorder and remove content without modifying source code.

The Solution module follows the Enterprise CMS Architecture defined by the project.

---

# 2. Business Objectives

The Solution module shall:

- Present IRDM solutions by customer group.
- Demonstrate business value.
- Connect customer challenges with IRDM capabilities.
- Support unlimited customer groups.
- Support future business expansion.
- Remain fully CMS-driven.
- Closely match the approved design.

---

# 3. Approved Design

Approved design:

```text
figmaPNG/
└── solution/
    └── GiaiPhap.png
```

The PNG is the approved UI Source of Truth.

Before implementing or modifying the Solution module, review the complete PNG to understand:

- Page hierarchy
- Section hierarchy
- Layout
- Typography
- Images
- Icons
- Illustrations
- Responsive behaviour

Every visible block in the approved design shall have a corresponding CMS structure.

Every visible image shall have a corresponding CMS-managed ImageField unless it belongs to the global design system.

---

# 4. Page Composition

The Solution module is implemented as one Landing Page.

Global Header and Global Footer belong to the Website module and are shared by all pages.

The Solution module manages only its business content.

```text
Solution Landing Page
│
├── Hero
│
├── Audience Selector
│      (render from Audience Sections)
│
├── Methodology
│
├── Audience Sections (1..N)
│
└── Global Footer
```

---

# 5. Audience Section Composition

Every Audience Section follows the same reusable structure.

```text
Audience Section
│
├── Navigation Information
│
├── Introduction
│
├── Focus Topics
│
├── IRDM Actions
│
├── Capability Collection
│
├── Output Collection
│
└── CTA Banner
```

The frontend renders every Audience Section using one reusable template.

No audience-specific template is allowed.

---

# 6. CMS Requirements

The CMS shall manage:

## Landing Page

- Hero
- Methodology

## Audience Section

- Navigation Information
- Introduction
- Focus Topics
- IRDM Actions
- Capability Collection
- Output Collection
- CTA Banner

## Media

- Hero Images
- Navigation Images
- Featured Images
- Capability Images
- Output Images
- CTA Images
- Background Images

## General

- SEO
- Publish Status
- Display Order

All business content shall be editable through Django CMS.

---

# 7. Dynamic Collections

The following business content shall support unlimited records.

## Audience Sections

1..N

## Focus Topics

1..N

## IRDM Actions

1..N

## Capability Cards

1..N

Desktop layout displays three cards per row.

## Output Cards

1..N

Desktop layout displays three cards per row.

The frontend shall render all collections dynamically.

No fixed number of records shall be assumed.

---

# 8. Data Model Overview

Logical structure:

```text
SolutionLandingPage
│
├── Hero
├── Methodology
└── AudienceSection (1..N)
        │
        ├── NavigationInformation
        ├── Introduction
        ├── FocusTopic (1..N)
        ├── IRDMAction (1..N)
        ├── CapabilityCard (1..N)
        ├── OutputCard (1..N)
        └── CTABanner
```

Every entity shall support:

- Display Order
- Publish Status
- Audit Fields

Media entities shall support ImageField.

---

# 9. Rendering Principles

The Solution module renders business content dynamically.

The frontend shall never hardcode:

- Audience Groups
- Focus Topics
- IRDM Actions
- Capability Cards
- Output Cards
- Images
- CTA

Every collection shall be rendered using reusable frontend components.

---

# 10. Shared Components

The Solution module shall reuse existing shared components whenever possible.

Examples include:

- Hero
- Section Header
- Button
- Card
- CTA Banner
- Breadcrumb
- Grid
- Pagination

Global Header and Global Footer are shared Website components.

---

# 11. Future Integration

The architecture shall support future integration with:

- Capability
- Knowledge
- Expert
- Partner
- Publication
- Event
- Contact

Audience Sections may reference these modules without requiring architectural redesign.

---

# 12. Acceptance Criteria

The Solution module is complete when:

- The page follows the approved architecture.
- The page structure matches the approved design.
- The Landing Page is CMS-driven.
- Audience Sections are dynamic.
- Audience Selector renders from Audience Sections.
- Focus Topics are dynamic.
- IRDM Actions are dynamic.
- Capability Cards are dynamic.
- Output Cards are dynamic.
- Images are managed through Django CMS.
- Shared components are reused.
- Business content is stored in PostgreSQL.
- The architecture supports future business expansion.