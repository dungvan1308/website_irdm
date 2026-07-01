# Admin Component Library

## Purpose

Define all reusable UI components for the IRDM Administration Portal and CMS.

---

## Scope

Applies to

- CMS
- Administration Portal
- Dashboard
- Content Management
- User Management
- System Settings

---

## Component Principles

- Component-Based
- Reusable
- Configurable
- Responsive
- Accessible
- HTMX Compatible

---

## Layout Components

| Component | Purpose | Reusable | HTMX |
|-----------|----------|:-------:|:----:|
| Admin Header | Global Navigation | ✓ | ✗ |
| Sidebar | Module Navigation | ✓ | ✗ |
| Breadcrumb | Navigation Context | ✓ | ✓ |
| Page Header | Page Title | ✓ | ✗ |
| Toolbar | Common Actions | ✓ | ✓ |
| Footer | System Footer | ✓ | ✗ |

---

## Dashboard Components

| Component | Purpose | Reusable | HTMX |
|-----------|----------|:-------:|:----:|
| Statistic Card | KPI Summary | ✓ | ✓ |
| Activity Feed | Recent Activities | ✓ | ✓ |
| Notification Panel | System Notifications | ✓ | ✓ |
| Quick Action | Frequently Used Actions | ✓ | ✓ |
| Dashboard Widget | Modular Dashboard Block | ✓ | ✓ |

---

## Data Components

| Component | Purpose | Reusable | HTMX |
|-----------|----------|:-------:|:----:|
| Data Table | Display Records | ✓ | ✓ |
| Data Grid | Card Layout | ✓ | ✓ |
| Detail Panel | Record Details | ✓ | ✓ |
| Information Card | Summary Information | ✓ | ✓ |
| Status Badge | Status Display | ✓ | ✓ |

---

## Form Components

| Component | Purpose | Reusable | HTMX |
|-----------|----------|:-------:|:----:|
| Form Layout | Standard Form | ✓ | ✓ |
| Input Field | Text Input | ✓ | ✓ |
| Text Editor | Rich Content | ✓ | ✓ |
| Select Box | Single Selection | ✓ | ✓ |
| Multi Select | Multiple Selection | ✓ | ✓ |
| Checkbox | Boolean Value | ✓ | ✓ |
| Radio Group | Option Selection | ✓ | ✓ |
| Date Picker | Date Selection | ✓ | ✓ |
| File Upload | Media Upload | ✓ | ✓ |

---

## Action Components

| Component | Purpose | Reusable | HTMX |
|-----------|----------|:-------:|:----:|
| Create Button | Create Record | ✓ | ✓ |
| Edit Button | Edit Record | ✓ | ✓ |
| Delete Button | Delete Record | ✓ | ✓ |
| Save Button | Save Changes | ✓ | ✓ |
| Cancel Button | Cancel Action | ✓ | ✓ |
| Bulk Action | Batch Processing | ✓ | ✓ |

---

## Search Components

| Component | Purpose | Reusable | HTMX |
|-----------|----------|:-------:|:----:|
| Search Box | Keyword Search | ✓ | ✓ |
| Filter Panel | Advanced Filter | ✓ | ✓ |
| Sort Control | Sort Results | ✓ | ✓ |
| Pagination | Navigate Records | ✓ | ✓ |

---

## Feedback Components

| Component | Purpose | Reusable | HTMX |
|-----------|----------|:-------:|:----:|
| Success Alert | Success Message | ✓ | ✓ |
| Warning Alert | Warning Message | ✓ | ✓ |
| Error Alert | Error Message | ✓ | ✓ |
| Confirmation Dialog | Confirm Action | ✓ | ✓ |
| Loading Overlay | Loading State | ✓ | ✓ |
| Empty State | No Data | ✓ | ✓ |

---

## CMS Components

| Component | Purpose | Reusable | HTMX |
|-----------|----------|:-------:|:----:|
| Media Browser | Select Media | ✓ | ✓ |
| SEO Panel | SEO Configuration | ✓ | ✓ |
| Translation Panel | Multilingual Content | ✓ | ✓ |
| Publish Panel | Publish Settings | ✓ | ✓ |
| Audit Panel | Audit Information | ✓ | ✓ |

---

## Component Rules

Every component must

- Be reusable.
- Accept dynamic data.
- Support responsive layouts.
- Follow the Design System.
- Keep presentation separate from business logic.
- Support keyboard navigation.

Never

- Duplicate components.
- Hardcode business content.
- Mix UI with business logic.
- Create module-specific UI when a shared component exists.

---

## AI Notes

Always

- Reuse existing admin components.
- Follow the Design System.
- Keep layouts consistent.
- Use HTMX for partial updates.
- Generate accessible interfaces.

Never

- Create duplicate admin pages.
- Hardcode labels.
- Hardcode permissions.
- Break component consistency.

---

## Definition of Done

- Admin components identified.
- Dashboard components defined.
- CMS components defined.
- Reuse strategy approved.