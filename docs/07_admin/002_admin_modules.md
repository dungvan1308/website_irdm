# Admin Modules

## Purpose

Define the functional modules of the IRDM Administration Portal.

---

## Scope

Applies to

- CMS
- Administration Portal
- Internal Management
- System Configuration

---

## Module Principles

- Business-Oriented
- Modular
- Role-Based
- Reusable
- Workflow Driven
- Configuration First

---

## Content Management Modules

| Module | Purpose | CRUD | Workflow |
|----------|----------|:---:|:--------:|
| Pages | Manage static pages | ✓ | ✓ |
| Solutions | Manage business solutions | ✓ | ✓ |
| Capabilities | Manage capabilities | ✓ | ✓ |
| Experts | Manage expert profiles | ✓ | ✓ |
| Insights | Manage articles and research | ✓ | ✓ |
| Events | Manage events | ✓ | ✓ |
| Resources | Manage publications | ✓ | ✓ |

---

## Website Management Modules

| Module | Purpose | CRUD |
|----------|----------|:---:|
| Menus | Website navigation | ✓ |
| Homepage | Homepage content | ✓ |
| Contact Information | Organization information | ✓ |
| Media Library | Images, Documents, Videos | ✓ |
| SEO | SEO metadata | ✓ |
| Translation | Multilingual content | ✓ |

---

## Administration Modules

| Module | Purpose |
|----------|----------|
| Dashboard | System overview |
| Users | User management |
| Roles | Role management |
| Permissions | Access control |
| Settings | System configuration |
| Audit Logs | Activity history |

---

## Business Support Modules

| Module | Purpose |
|----------|----------|
| Leads | Contact requests |
| Newsletter | Subscriber management |
| Search Index | Search management |
| Notifications | System notifications |

---

## Shared Features

Every admin module supports

- Authentication
- Authorization
- Audit Logging
- Search
- Filtering
- Pagination
- Responsive UI

---

## Module Rules

Every module must

- Follow the CMS workflow.
- Use shared components.
- Support role-based access.
- Record audit information.
- Keep business logic inside Services.

Never

- Duplicate business logic.
- Duplicate admin pages.
- Hardcode configuration.
- Bypass permissions.

---

## AI Notes

Always

- Reuse existing admin components.
- Follow project architecture.
- Keep modules independent.
- Keep responsibilities clear.

Never

- Mix unrelated business domains.
- Duplicate modules.
- Ignore permission rules.

---

## Definition of Done

- Admin modules identified.
- Module responsibilities approved.
- Shared features approved.
- Module rules approved.