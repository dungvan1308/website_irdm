# Database Architecture

## Purpose

Define the database architecture, design principles, and modeling standards for the IRDM Enterprise Website.

---

## Scope

Applies to

- PostgreSQL
- Django ORM
- Business Models
- CMS Models
- System Models

---

## Database Philosophy

- PostgreSQL as the primary database
- Relational database design
- Content-Centric Architecture
- Normalize business data
- Reuse abstract models
- UUID primary keys
- Soft delete support
- Audit tracking
- SEO ready
- Multilingual ready
- Scalable schema

---

## Database Architecture

```text
BaseModel
    │
    ▼
ContentModel
    │
    ├── Solution
    ├── Capability
    ├── Expert
    ├── Insight
    ├── Event
    ├── Resource
    └── Page

BaseModel
    │
    ├── User
    ├── Role
    ├── Menu
    ├── Media
    ├── Contact
    ├── Translation
    └── SEO
```

---

## Model Hierarchy

### BaseModel

Shared fields for all models.

Responsibilities

- UUID identity
- Audit information
- Status management
- Soft delete
- Display order

---

### ContentModel

Shared fields for all website content.

Responsibilities

- Title
- Slug
- Summary
- Content
- Thumbnail
- SEO information
- Publish information
- Language

---

## Business Models

- Solution
- Capability
- Expert
- Insight
- Event
- Resource
- Page

---

## System Models

- User
- Role
- Permission
- Menu
- Media
- Contact
- Translation
- SEO

---

## Relationship Principles

- Use ForeignKey for one-to-many relationships.
- Use ManyToManyField for cross-content relationships.
- Avoid circular dependencies.
- Keep relationships simple.
- Prefer explicit relationship names.

---

## Database Conventions

Primary Key

- UUID

Naming

- snake_case

Tables

- Singular model names
- Django default table naming

Indexes

- Frequently queried fields
- Slug
- Status
- Publish Date

Constraints

- Unique slug
- Required business fields
- Foreign key integrity

---

## Design Principles

- Reuse abstract models.
- Keep models focused on data.
- Move business logic to Services.
- Minimize duplicated fields.
- Design for future expansion.

---

## AI Notes

Always

- Reuse BaseModel.
- Reuse ContentModel.
- Follow naming conventions.
- Keep relationships simple.
- Use Django ORM best practices.

Never

- Duplicate common fields.
- Hardcode identifiers.
- Put business logic inside models.
- Create unnecessary tables.

---

## Definition of Done

- Database philosophy approved.
- Model hierarchy approved.
- Business models identified.
- System models identified.
- Relationship principles approved.
- Database conventions approved.