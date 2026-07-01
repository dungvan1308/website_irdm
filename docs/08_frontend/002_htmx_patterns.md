# HTMX Patterns

## Purpose

Define how HTMX is used throughout the IRDM Enterprise Website.

---

## Scope

Applies to

- Public Website
- CMS
- Administration Portal

---

## HTMX Principles

- Progressive Enhancement
- Server-Driven UI
- Partial Rendering
- Minimal JavaScript
- Reusable Templates

---

## Recommended Usage

Use HTMX for

- Search
- Filtering
- Pagination
- Sorting
- Form Submission
- CRUD Operations
- Modal Content
- Inline Editing
- Status Updates
- Partial Refresh

---

## Avoid Using HTMX For

- Full Page Rendering
- Complex Client-side State
- Business Logic
- Authentication
- Authorization

---

## Rendering Pattern

```text
User Action
    │
    ▼
HTMX Request
    │
    ▼
Django View
    │
    ▼
Service
    │
    ▼
Render Partial Template
    │
    ▼
Replace HTML
```

---

## Template Rules

- Return partial templates only.
- Keep templates reusable.
- Keep templates independent.
- Keep HTML semantic.

---

## View Rules

- Return HTML fragments.
- Keep Views lightweight.
- Call Services only.
- Never return business logic.

---

## Interaction Patterns

Support

- Live Search
- Filter
- Pagination
- Infinite Scroll
- Modal Dialog
- Inline Update
- Delete Confirmation
- Form Validation

---

## Performance Guidelines

- Update only required content.
- Avoid full-page refresh.
- Minimize server requests.
- Reuse partial templates.

---

## HTMX Rules

Always

- Use server-side rendering.
- Reuse partial templates.
- Keep interactions simple.
- Keep JavaScript minimal.

Never

- Replace entire pages.
- Duplicate templates.
- Put business logic in JavaScript.
- Mix HTMX with unnecessary custom JavaScript.

---

## AI Notes

Always

- Prefer HTMX over custom JavaScript.
- Return reusable partial templates.
- Keep HTML semantic.
- Keep interactions lightweight.

Never

- Generate SPA behavior.
- Create unnecessary API calls.
- Duplicate frontend logic.

---

## Definition of Done

- HTMX usage approved.
- Rendering pattern approved.
- Interaction patterns approved.
- HTMX rules approved.