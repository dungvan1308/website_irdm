# Backend Architecture

## Purpose

Define the backend organization, application structure, and implementation standards for the IRDM Enterprise Website.

---

## Scope

Applies to

- Django Applications
- Business Services
- Django Admin
- URL Configuration
- Forms
- Background Tasks
- Shared Libraries

---

## Backend Principles

- Modular Architecture
- Business-Oriented
- Service Layer
- Reusable Applications
- Configuration over Hardcode
- Convention over Configuration

---

## Project Organization

```text
apps/
    common/
    core/
    website/
    cms/
    administration/
    solution/
    capability/
    expert/
    insight/
    event/
    resource/
```

Each application owns its own business domain.

---

## Standard Application Structure

```text
module/

├── admin.py
├── apps.py
├── forms.py
├── models.py
├── services.py
├── urls.py
├── views.py
├── templates/
└── migrations/
```

---

## Shared Modules

| Module | Responsibility |
|----------|----------------|
| common | Shared utilities |
| core | Shared business components |
| website | Public website |
| cms | Content Management |
| administration | System administration |

---

## Module Responsibilities

Every application

- Owns its business logic.
- Owns its URLs.
- Owns its templates.
- Owns its services.
- Reuses shared modules when appropriate.

---

## Business Rules

Always

- Keep applications independent.
- Keep business logic inside Services.
- Keep Models focused on data.
- Keep Views responsible for HTTP handling.
- Keep Forms responsible for validation.

Never

- Share business logic between unrelated modules.
- Hardcode configuration.
- Duplicate business services.
- Access another module's internal implementation directly.

---

## Background Processing

Use background tasks for

- Email
- Notifications
- File Processing
- Scheduled Jobs
- Long-running Operations

Do not execute long-running tasks inside HTTP requests.

---

## Error Handling

- Validate all inputs.
- Handle exceptions gracefully.
- Return user-friendly messages.
- Record unexpected errors.

---

## Logging

Record

- Errors
- Warnings
- Business Events
- Security Events

Sensitive information must never be logged.

---

## AI Notes

Always

- Reuse existing applications.
- Reuse existing services.
- Follow project architecture.
- Keep modules independent.

Never

- Create duplicate applications.
- Duplicate business logic.
- Hardcode business configuration.
- Break module boundaries.

---

## Definition of Done

- Backend organization approved.
- Application structure approved.
- Shared modules approved.
- Backend implementation rules approved.