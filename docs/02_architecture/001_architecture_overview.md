# 001. Architecture Overview

## Purpose

Define the enterprise architecture principles for the IRDM Website.

This document applies to the entire platform and is the foundation for every business module.

---

# Scope

The architecture applies to:

- Public Website
- CMS
- Administration Portal
- Shared Components
- Business Modules
- APIs
- Background Services

---

# Architecture Style

The platform follows:

- Business First
- Domain-Driven Design
- Modular Monolith
- Component-Based Architecture
- CMS-Driven
- Service Layer
- API Ready
- Cloud Ready

---

# Core Principles

Every module shall follow these principles.

- Business before Framework
- Single Source of Truth
- Reuse before Create
- Low Coupling
- High Cohesion
- Configuration over Hardcode

---

# System Characteristics

The platform shall be:

- Enterprise CMS
- SEO Ready
- Responsive
- Accessible
- Secure
- Scalable
- Maintainable
- Extensible

---

# High-Level Architecture

```text
Browser
    │
    ▼
Nginx
    │
    ▼
Gunicorn
    │
    ▼
Django
    │
    ├── PostgreSQL
    ├── Redis
    └── Media Storage
```

---

# Domain Architecture

The platform is divided into two independent domains.

## Global Domain

Shared functionality used across the entire website.

Examples:

- Header
- Footer
- Navigation
- Website Settings
- SEO
- Organization Profile
- Contact Information
- Theme

Global components are implemented once and reused by every business module.

---

## Business Domain

Each page belongs to an independent business domain.

Examples:

- Home
- About
- Solution
- Capability
- Knowledge
- Expert
- Partner
- Publication
- Event
- Contact

Each business domain owns only its own business data.

---

# Page Composition

Every page is composed of reusable Content Blocks.

Examples include:

- Hero
- Introduction
- Card Collection
- CTA Banner
- Timeline
- Gallery
- Statistics
- FAQ

Pages compose Content Blocks.

Content Blocks compose business pages.

---

# Collection Pattern

Repeated business content shall follow the Collection Pattern.

Examples include:

- Cards
- Features
- Services
- Team Members
- Partners
- Events
- Publications
- Galleries

Collections support unlimited items.

Frontend renders collections dynamically.

The number of items must never be hardcoded.

---

# CMS First

Business content shall be managed through Django CMS.

CMS manages:

- Text
- Media
- SEO
- Publish Status
- Display Order
- Relationships

Business content must never be hardcoded.

---

# Dynamic Rendering

Business pages render data dynamically from PostgreSQL.

Templates shall never hardcode:

- Business Content
- Collections
- Images
- Navigation
- CTA

Reusable components shall render all dynamic content.

---

# Shared Components

Reusable UI components are implemented only once.

Examples include:

- Header
- Footer
- Hero
- Breadcrumb
- Section Header
- Card
- Button
- CTA Banner
- Pagination

Business modules reuse shared components whenever possible.

---

# Service Layer

Views must never communicate directly with database models.

Business logic belongs inside the Service Layer.

The Service Layer is responsible for:

- Data Retrieval
- Business Rules
- Validation
- Caching
- Future API Support

---

# Media Management

Business media shall be centrally managed.

The architecture defines only the media framework.

Each business module defines its own media assets and presentation rules.

Media shall always be rendered dynamically.

---

# Business Specifications

Every Business Domain shall provide its own Product Specification.

The Product Specification defines:

- Business Structure
- CMS Structure
- Data Model
- Page Composition
- UI Mapping
- Acceptance Criteria

Architecture defines the platform.

Business Specifications define the business modules.

---

# Implementation

Implementation documents describe how a business module is developed.

Implementation documents may include:

- Development Tasks
- Code Generation
- Review Checklist
- Demo Data
- Seed Strategy
- UI Review

Implementation details do not belong to the architecture.

---

# AI Development Rules

Always:

- Preserve architecture consistency.
- Reuse existing components.
- Follow Business Specifications.
- Respect domain boundaries.

Never:

- Couple business domains.
- Duplicate shared components.
- Hardcode business content.
- Bypass the Service Layer.
- Break the project architecture.

---

# Definition of Done

The architecture is considered complete when:

- Domain boundaries are respected.
- Shared components are reused.
- Business modules remain independent.
- Dynamic rendering is preserved.
- CMS remains the single source of business content.
- The platform supports future business expansion without architectural redesign.