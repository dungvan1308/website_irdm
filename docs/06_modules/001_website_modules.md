# Website Modules

## Purpose

Define the business responsibilities of each website module.

---

## Scope

Applies to all public website modules.

---

## Module Principles

- Business-oriented
- Content-driven
- CMS-managed
- SEO-ready
- Multilingual
- Reusable
- Independent

---

## Module Inventory

| Module | Purpose | CMS | SEO | Search |
|----------|----------|:---:|:---:|:------:|
| Homepage | Website entry point | ✓ | ✓ | ✗ |
| About | Organization introduction | ✓ | ✓ | ✗ |
| Solutions | Present IRDM solutions | ✓ | ✓ | ✓ |
| Capabilities | Present organizational capabilities | ✓ | ✓ | ✓ |
| Insights | Knowledge sharing | ✓ | ✓ | ✓ |
| Experts | Expert directory | ✓ | ✓ | ✓ |
| Events | Event publishing | ✓ | ✓ | ✓ |
| Resources | Publications and downloads | ✓ | ✓ | ✓ |
| Contact | Lead collection | ✓ | ✓ | ✗ |
| Search | Global search | ✗ | ✗ | ✓ |

---

## Content Ownership

| Content | Managed By |
|-----------|------------|
| Homepage | CMS |
| About | CMS |
| Solutions | CMS |
| Capabilities | CMS |
| Insights | CMS |
| Experts | CMS |
| Events | CMS |
| Resources | CMS |
| Contact Information | CMS |

---

## Module Relationships

```text
Homepage
├── Solutions
├── Capabilities
├── Insights
├── Experts
├── Events
└── Resources

Solutions
├── Capabilities
├── Experts
└── Insights

Capabilities
├── Solutions
├── Experts
└── Insights

Insights
├── Experts
├── Solutions
└── Resources

Experts
├── Insights
└── Solutions

Events
└── Resources
```

---

## Shared Features

Every module supports

- SEO
- CMS
- Translation
- Breadcrumb
- Related Content
- Responsive Layout

---

## Module Rules

Every module must

- Display CMS content.
- Support multilingual content.
- Support SEO metadata.
- Use reusable components.
- Follow the Design System.

Never

- Hardcode business content.
- Duplicate business logic.
- Duplicate UI components.
- Bypass CMS.

---

## AI Notes

Always

- Follow business responsibilities.
- Reuse existing components.
- Reuse existing services.
- Keep modules independent.

Never

- Mix module responsibilities.
- Create duplicate modules.
- Ignore CMS content.

---

## Definition of Done

- Website modules identified.
- Business responsibilities approved.
- Module relationships approved.
- Shared features approved.