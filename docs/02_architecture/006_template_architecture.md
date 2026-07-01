# Template Architecture

## Purpose

Define the template organization and rendering architecture for the IRDM Enterprise Website.

---

## Scope

Applies to

- Django Templates
- Layouts
- Pages
- Components
- Partials
- HTMX Templates

---

## Template Structure

```text
templates/

├── layouts/
├── pages/
├── components/
├── partials/
├── includes/
└── errors/
```

---

## Template Hierarchy

```text
base.html
    │
    ▼
layout.html
    │
    ▼
page.html
    │
    ▼
components
```

---

## Folder Responsibilities

| Folder | Responsibility |
|----------|----------------|
| layouts | Base layouts |
| pages | Full page templates |
| components | Reusable UI components |
| partials | Small reusable fragments |
| includes | Shared template includes |
| errors | Error pages |

---

## Rendering Rules

- Every page extends a layout.
- Layouts extend `base.html`.
- Components are reusable.
- Partials contain small UI fragments.
- HTMX renders partial templates only.

---

## Template Principles

- Component-Based
- Reusable
- DRY
- Semantic HTML
- Accessibility
- Responsive
- HTMX Friendly

---

## Template Dependencies

```text
base.html
    │
    ▼
layout
    │
    ▼
page
    │
    ▼
component
    │
    ▼
partial
```

---

## AI Notes

Always

- Extend existing layouts.
- Reuse components.
- Keep templates clean.
- Keep templates presentation only.

Never

- Duplicate HTML.
- Write business logic in templates.
- Hardcode business content.
- Mix layouts with components.

---

## Definition of Done

- Template hierarchy defined.
- Folder responsibilities defined.
- Rendering rules approved.
- Template principles approved.