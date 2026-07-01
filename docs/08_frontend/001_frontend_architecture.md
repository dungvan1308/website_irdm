# Frontend Architecture

## Purpose

Define the frontend architecture, rendering strategy, and interaction principles for the IRDM Enterprise Website.

---

## Scope

Applies to

- Public Website
- CMS
- Administration Portal
- Django Templates
- HTMX
- Alpine.js
- Tailwind CSS

---

## Frontend Principles

- Server-Side Rendering First
- Progressive Enhancement
- Component-Based UI
- Reusable Templates
- Responsive Design
- Accessibility First
- Performance First

---

## Technology Responsibilities

| Technology | Responsibility |
|------------|----------------|
| Django Templates | Server-side HTML rendering |
| HTMX | Partial page updates |
| Alpine.js | Lightweight UI state |
| Tailwind CSS | Styling |
| Flowbite | UI components |
| Heroicons | Icons |

---

## Rendering Flow

```text
Browser
    │
    ▼
Django Template
    │
    ▼
Layout
    │
    ▼
Components
    │
    ▼
HTMX Partial Update
```

---

## Rendering Rules

- Render HTML on the server.
- Use reusable layouts.
- Use reusable components.
- Use HTMX for partial updates.
- Keep HTML semantic.

---

## HTMX Rules

Use HTMX for

- Search
- Filter
- Pagination
- CRUD Forms
- Partial Page Updates

Do not use HTMX for full-page rendering.

---

## Alpine.js Rules

Use Alpine.js for

- Dropdown
- Modal
- Tabs
- Accordion
- Mobile Menu
- Simple UI State

Do not implement business logic in Alpine.js.

---

## Tailwind Rules

- Utility First
- Mobile Responsive
- Follow Design System
- Reuse existing utility classes
- Avoid inline styles

---

## Performance Guidelines

- Lazy Loading
- Image Optimization
- Partial Rendering
- Browser Caching
- Asset Compression

---

## Accessibility

- Semantic HTML
- Keyboard Navigation
- Visible Focus States
- ARIA where required

---

## Frontend Rules

Always

- Follow the Design System.
- Reuse existing templates.
- Reuse existing components.
- Keep business logic on the server.
- Prefer HTMX over custom JavaScript.

Never

- Build a Single Page Application.
- Duplicate templates.
- Hardcode business content.
- Put business logic in JavaScript.
- Create unnecessary JavaScript.

---

## AI Notes

Always

- Generate semantic HTML.
- Generate reusable templates.
- Use HTMX for interactive features.
- Use Alpine.js only for UI state.
- Keep JavaScript minimal.

Never

- Duplicate UI.
- Ignore responsive design.
- Ignore accessibility.
- Break the Design System.

---

## Definition of Done

- Frontend architecture approved.
- Rendering strategy approved.
- Technology responsibilities approved.
- Frontend rules approved.