# 005. Capability Product Specification

---

# 1. Overview

## 1.1 Purpose

Capability represents the core competencies of IRDM.

It is not merely a website page.

Capability is the central business domain of the IRDM platform and serves as the taxonomy that connects multiple business modules.

Future modules including Solution, Knowledge, Expert, Partner, Publication, Event and Media may reference one or multiple Capabilities.

---

## 1.2 Business Objectives

The Capability module enables IRDM to:

- Present organizational competencies
- Explain methodologies
- Showcase successful implementations
- Connect related content
- Provide reusable taxonomy for future modules

---

## 1.3 Scope

Sprint 2 only covers:

- Capability Listing
- Capability Detail
- Capability CMS
- Capability Service Layer
- Capability Database
- Capability UI

Future relationship implementation will be completed in later sprints.

---

# 2. Information Architecture

Capability

├── Hero

├── Overview

├── Sections

├── Timeline / Methodology

├── Featured Cards

├── Case Studies

├── CTA

└── Related Content

---

# 3. Navigation

Header

↓

Homepage

↓

Hero CTA

↓

Capability Listing

↓

Capability Detail

↓

Related Capability

---

# 4. URL Structure

/capabilities/

/capabilities/<slug>/

Slug must be unique.

---

# 5. Database Design

Capability

CapabilitySection

CapabilityFeature

CapabilityTimelineStep

CapabilityCaseStudy

CapabilityCTA

CapabilityAttachment

All entities inherit BaseModel.

Support:

- UUID
- Audit Fields
- Soft Delete
- Display Order
- Publish Status
- SEO
- Language

---

# 6. Relationships

Current Sprint

Capability

↓

CapabilitySection

↓

CapabilityFeature

↓

Timeline

↓

CTA

Future Sprints

Capability

↓

Solution

Capability

↓

Knowledge

Capability

↓

Expert

Capability

↓

Partner

Capability

↓

Publication

Capability

↓

Event

Relationships should be designed for future Many-to-Many support.

---

# 7. CMS Specification

Editors must manage:

General Information

SEO

Hero

Overview

Content Sections

Timeline

Feature Cards

Case Studies

CTA Banner

Images

Icons

Display Order

Visibility

Publish Status

No business content shall be hardcoded.

---

# 8. Service Layer

Views must never directly access Django Models.

Business logic must be encapsulated inside Service Layer.

Typical services include:

CapabilityService

CapabilityQueryService

CapabilityNavigationService

CapabilitySEOService

Support reusable query methods.

---

# 9. Frontend Specification

Capability Listing

Hero

Overview Cards

Search (future)

Category Filter (future)

Capability Detail

Hero

Overview

Timeline

Feature Sections

Case Studies

CTA

Related Content

Breadcrumb

Footer

Responsive Design

---

# 10. Design Rules

Visual implementation must follow:

FigmaPDF/

Capability_Subpage/

Subpage - v2.pdf

The PDF is the only visual source of truth.

Do not redesign.

Do not simplify.

Do not change spacing.

Do not change typography.

Do not change color palette.

Reuse existing shared components.

---

# 11. Responsive Rules

Desktop

Tablet

Mobile

Follow the Figma proportions.

Do not invent alternative layouts.

---

# 12. Performance

Use lazy loading where appropriate.

Optimize images.

Reuse shared components.

Avoid duplicated HTML.

Avoid duplicated CSS.

Avoid duplicated JavaScript.

---

# 13. Security

CMS requires authenticated staff users.

Permission-based editing.

Public pages are read-only.

---

# 14. SEO

Support:

Meta Title

Meta Description

Keywords

OpenGraph

Canonical URL

Structured Data (future)

---

# 15. Accessibility

Semantic HTML

ARIA labels

Keyboard navigation

Accessible color contrast

Alt text for all images

---

# 16. Acceptance Criteria

Sprint 2 is considered complete when:

✓ Database created

✓ Migration completed

✓ CMS completed

✓ Admin completed

✓ Service Layer completed

✓ Capability Listing completed

✓ Capability Detail completed

✓ Data loaded from PostgreSQL

✓ No hardcoded business content

✓ Responsive

✓ Pixel-perfect implementation matching

FigmaPDF/

Capability_Subpage/

Subpage - v2.pdf

---

# 17. Future Roadmap

Capability becomes the central business taxonomy.

Future modules will reference Capability:

- Solution
- Knowledge
- Expert
- Partner
- Publication
- Event
- Media

No architecture redesign should be required in future sprints.