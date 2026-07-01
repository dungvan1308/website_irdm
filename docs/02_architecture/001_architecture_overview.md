# Architecture Overview

## Purpose

Define the overall architecture principles for the IRDM Enterprise Website.

---

## Scope

Applies to the overall system architecture.

Includes

- Website
- CMS
- Administration
- Public Services

---

## Rules

### Architecture Style

- Business First
- Content-Centric
- Modular Monolith
- Domain-Oriented
- Component-Based
- CMS Driven
- API Ready
- Cloud Ready

### Core Principles

- Business before Framework
- Single Source of Truth
- Reuse Before Create
- Low Coupling
- High Cohesion
- Configuration over Hardcode

### System Characteristics

- Knowledge Portal
- Enterprise CMS
- SEO Ready
- Multilingual
- Responsive
- Accessible
- Scalable
- Maintainable

### High-Level Architecture

Browser

↓

Nginx

↓

Gunicorn

↓

Django

├── PostgreSQL

├── Redis

└── Media Storage

---

## AI Notes

Always

- Preserve architecture consistency.
- Reuse existing modules.
- Follow project specifications.

Never

- Couple business modules.
- Hardcode business content.
- Bypass architecture rules.

---

## Definition of Done

- Architecture style approved.
- Core principles approved.
- High-level architecture approved.