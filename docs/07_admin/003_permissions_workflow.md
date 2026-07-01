# Permissions & Workflow

## Purpose

Define authentication, authorization, and content publishing workflow for the IRDM Administration Portal.

---

## Scope

Applies to

- CMS
- Administration Portal
- User Management
- Content Publishing
- Access Control

---

## Security Principles

- Authentication Required
- Role-Based Access Control (RBAC)
- Least Privilege
- Module-Level Permission
- Audit Enabled

---

## User Roles

| Role | Responsibility |
|-------|----------------|
| Super Administrator | Full system access |
| Administrator | Manage system configuration |
| Content Manager | Manage website content |
| Editor | Create and edit content |
| Reviewer | Review submitted content |
| Publisher | Publish approved content |
| Viewer | Read-only access |

---

## Permission Types

| Permission | Description |
|------------|-------------|
| View | Read content |
| Create | Create new content |
| Edit | Modify existing content |
| Delete | Remove content |
| Publish | Publish content |
| Approve | Approve content |
| Manage | Configure system settings |

---

## Permission Rules

- Permissions are assigned through Roles.
- Users may have one or more Roles.
- Access is granted at the module level.
- Unauthorized actions must be denied.
- Every action is recorded in the audit log.

---

## Publishing Workflow

```text
Editor
    │
    ▼
Reviewer
    │
    ▼
Publisher
    │
    ▼
Public Website
```

Only published content is visible on the website.

---

## Workflow Rules

- Editors cannot publish content.
- Reviewers cannot modify published content.
- Publishers publish approved content.
- Archived content is hidden from the public website.

---

## Audit Policy

Record

- Login
- Logout
- Create
- Update
- Delete
- Publish
- Approval
- Permission Changes

Audit records are immutable.

---

## Session Policy

- Authentication required.
- Automatic session timeout.
- Secure password storage.
- CSRF protection enabled.

---

## AI Notes

Always

- Follow RBAC principles.
- Validate permissions before every action.
- Record audit information.
- Follow the publishing workflow.

Never

- Bypass permission checks.
- Grant unnecessary privileges.
- Skip audit logging.
- Publish unapproved content.

---

## Definition of Done

- User roles approved.
- Permission model approved.
- Publishing workflow approved.
- Audit policy approved.
- Security principles approved.