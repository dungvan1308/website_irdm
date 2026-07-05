# 004. Solution Module

# Product Specification

Version: 2.0

Status: Approved

---

# 1. Module Overview

The Solution module presents how IRDM solves business challenges for different customer segments.

Unlike a traditional service page, Solution is implemented as **one dynamic Landing Page** composed of **one or more reusable Solution Sections** managed entirely through Django CMS.

The number of Solution Sections is unlimited.

Business users can create, publish, reorder or remove Solution Sections without modifying source code.

---

# 2. Business Objectives

The Solution module shall:

- Present IRDM business solutions.
- Connect customer challenges with IRDM capabilities.
- Demonstrate business value instead of technical implementation.
- Support unlimited customer segments.
- Encourage customer engagement through contextual CTA.
- Remain fully manageable through Django CMS.
- Support future integration with other business modules.

---

# 3. Architecture Principles

The Solution module follows these principles.

- CMS First
- PostgreSQL as the Single Source of Truth
- Dynamic Rendering
- Reusable Components
- Service Layer
- Enterprise CMS
- Future Extensibility

No business content shall be hardcoded.

---

# 4. Approved Design

Approved visual source:

```text
figmapng/
└── solution/
    └── GiaiPhap.png
```

The approved PNG defines:

- Layout
- Typography
- Colors
- Images
- Icons
- Illustrations
- Spacing
- Responsive Behaviour

The implementation shall closely match the approved design while preserving the project architecture.

---

# 5. Information Architecture

```text
Solution Landing Page
│
├── Hero
├── Solution Navigator
├── Value Proposition
├── Solution Sections (1..N)
├── Global CTA
└── Footer
```

The Landing Page is rendered dynamically.

No Solution Section is hardcoded.

---

# 6. Solution Section

Every Solution Section shares one reusable layout.

```text
Solution Section
│
├── Hero
├── Overview
├── Related Capabilities
├── Expected Outputs
└── Call To Action
```

Each Solution Section represents one business audience.

Examples include:

- Government & Policy
- Healthcare
- Education
- Enterprise
- International Organization

These are demonstration data only.

Future Solution Sections can be added entirely through CMS.

---

# 7. CMS Requirements

Editors shall be able to manage:

- Landing Page
- Solution Sections
- Hero
- Overview
- Related Capabilities
- Expected Outputs
- CTA
- Images
- SEO
- Publish Status
- Display Order

Business users must never modify source code.

---

# 8. Data Model Overview

Core entities:

```text
SolutionLandingPage

SolutionSection

SolutionCapability

SolutionOutput

SolutionCTA
```

Relationships:

```text
Landing Page
    │
    └── Solution Sections (1..N)
             │
             ├── Related Capabilities
             ├── Expected Outputs
             └── CTA
```

The architecture shall support unlimited Solution Sections.

---

# 9. Media Strategy

All media is managed through Django CMS.

Supported media:

- Hero Image
- Background Image
- Card Image
- CTA Image
- Icons
- Illustrations

All images shall use ImageField.

Images are rendered dynamically.

Demo assets may be extracted from:

```text
figmapng/
└── solution/
    └── GiaiPhap.png
```

Production images are uploaded through Django CMS.

---

# 10. Frontend Rendering

The frontend renders Solution Sections dynamically.

Pseudo flow:

```text
Load Landing Page

↓

Load Published Solution Sections

↓

Loop

    Hero

    Overview

    Related Capabilities

    Expected Outputs

    CTA

End Loop

↓

Footer
```

No Solution-specific template shall be duplicated.

One reusable component shall render every Solution Section.

---

# 11. Shared Components

The Solution module shall reuse existing shared components whenever possible.

Recommended shared components include:

- Hero
- Section Header
- Breadcrumb
- Capability Card
- Output Card
- CTA Banner
- Button
- Responsive Grid
- Footer

Only create new components when they are reusable.

---

# 12. Service Layer

Views must never access Django Models directly.

The Service Layer is responsible for:

- Landing Page
- Solution Sections
- Related Capabilities
- Outputs
- CTA
- SEO
- Media

Business logic belongs only inside the Service Layer.

---

# 13. Future Integration

The Solution module is designed for future expansion.

Each Solution Section may later reference:

- Capability
- Expert
- Knowledge
- Partner
- Publication
- Event
- Case Study
- Testimonial

No architectural redesign should be required.

---

# 14. Acceptance Criteria

The Solution module is complete when:

- Solution is implemented as one Landing Page.
- Solution Sections are dynamic.
- Unlimited Solution Sections are supported.
- Landing Page is CMS-driven.
- Images are managed through CMS.
- Related Capabilities are dynamic.
- Expected Outputs are dynamic.
- CTA is configurable.
- All content comes from PostgreSQL.
- Images are rendered from ImageField.
- UI closely matches the approved design.
- New Solution Sections can be added without modifying source code.

---

# 15. Definition of Done

The implementation is complete only when:

- The Landing Page renders entirely from PostgreSQL.
- Every Solution Section is managed through Django CMS.
- The frontend renders Solution Sections using a reusable loop.
- No business content is hardcoded.
- Images are uploaded and managed through CMS.
- The implementation follows the approved design.
- The architecture supports future business expansion.