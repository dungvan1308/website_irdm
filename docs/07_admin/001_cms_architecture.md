# CMS Architecture

## Purpose

Define the architecture, principles, and content management workflow for the IRDM Content Management System.

---

## Scope

Applies to

- CMS
- Administration Portal
- Website Content
- Media Management
- SEO Management
- Translation
- Publishing Workflow

---

## CMS Principles

- Content First
- Everything Editable
- Configuration over Hardcode
- Single Source of Truth
- Modular Content
- Reusable Content
- SEO Ready
- Multilingual
- Workflow Driven
- Audit Enabled

---

## Content Lifecycle

```text
Draft
    │
    ▼
Review
    │
    ▼
Published
    │
    ▼
Archived
```

Only published content is visible on the public website.

---

## Content Ownership

The CMS manages

- Homepage
- About
- Solutions
- Capabilities
- Experts
- Insights
- Events
- Resources
- Menus
- Contact Information
- Media
- SEO
- Translation

Business content must always be managed through the CMS.

---

## Shared Content Structure

Every publishable content supports

- Title
- Slug
- Summary
- Content
- Featured Image
- SEO Metadata
- Language
- Status
- Publish Date

Common fields are inherited from shared models.

---

## Media Management

Support

- Images
- Documents
- Videos

Rules

- Centralized Media Library
- Reusable Assets
- Metadata Support
- Optimized Delivery

---

## SEO Management

Every publishable content supports

- SEO Title
- SEO Description
- Meta Keywords
- Canonical URL
- Open Graph Image

SEO configuration is managed by the CMS.

---

## Translation

Supported Languages

- Vietnamese
- English

Each language version is managed independently.

---

## Audit

Track

- Created By
- Created At
- Updated By
- Updated At
- Published At

Audit information is managed automatically.

---

## CMS Rules

Always

- Keep all business content editable.
- Reuse existing content structures.
- Follow the publishing workflow.
- Separate content from presentation.

Never

- Hardcode website content.
- Duplicate content structures.
- Bypass the publishing workflow.
- Mix presentation logic with content management.

---

## AI Notes

Always

- Treat the CMS as the single source of website content.
- Reuse shared content models.
- Keep workflows consistent.
- Follow project architecture.

Never

- Create content outside the CMS.
- Duplicate content definitions.
- Ignore workflow states.

---

## Definition of Done

- CMS principles approved.
- Content lifecycle approved.
- Content ownership approved.
- Publishing workflow approved.
- SEO strategy approved.
- Translation strategy approved.