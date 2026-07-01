# Layer Architecture

## Purpose

Define the application layers and interaction rules for the IRDM Enterprise Website.

---

## Scope

Applies to all backend and frontend modules.

---

## Layer Overview

```text
Browser
    │
    ▼
Template / HTMX
    │
    ▼
View
    │
    ▼
Service
    │
    ▼
Model
    │
    ▼
PostgreSQL
```

---

## Layer Responsibilities

| Layer | Responsibility |
|---------|----------------|
| Template | Render UI |
| HTMX | Partial page update |
| View | Handle HTTP requests and responses |
| Service | Business logic |
| Model | Data model and database access |
| PostgreSQL | Data persistence |

---

## Layer Rules

### Template

- Presentation only
- No business logic
- Reusable components
- HTMX compatible

---

### View

- Handle requests
- Validate input
- Call Services
- Return responses

---

### Service

- Business logic
- Workflow processing
- Data transformation
- Reusable operations

---

### Model

- Data structure
- ORM queries
- Relationships
- Constraints

---

## Dependency Rules

Allowed

```text
Template
    ↓
View
    ↓
Service
    ↓
Model
```

Not Allowed

```text
Template → Model

Template → Database

View → Model (Business Logic)

Service → Template

Model → Template
```

---

## Design Principles

- Thin Views
- Fat Services
- Lean Models
- Reusable Components
- Separation of Concerns

---

## AI Notes

Always

- Keep Views lightweight.
- Keep business logic inside Services.
- Keep Templates presentation only.
- Keep Models focused on data.

Never

- Write business logic inside Views.
- Write business logic inside Templates.
- Query the database from Templates.
- Duplicate business logic.

---

## Definition of Done

- Layer responsibilities defined.
- Layer dependencies defined.
- Design principles approved.