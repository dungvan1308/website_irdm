# Navigation Architecture

## Purpose

Define the navigation structure and user journey of the IRDM Enterprise Website.

---

## Scope

Applies to

- Header Navigation
- Footer Navigation
- Internal Links
- Breadcrumb
- CTA Navigation
- Search Navigation

---

## Navigation Principles

- User-Centric
- Content First
- Maximum 3 Clicks
- Consistent Navigation
- SEO Friendly
- Responsive
- Accessible

---

## Primary Navigation

```text
Home

├── About
├── Solutions
├── Capabilities
├── Insights
├── Experts
├── Events
├── Resources
└── Contact
```

---

## Content Relationships

```text
Solution
├── Capability
├── Expert
├── Insight
└── Contact

Capability
├── Solution
├── Expert
└── Insight

Insight
├── Expert
├── Solution
└── Capability

Expert
├── Insight
├── Solution
└── Capability

Event
└── Related Resource

Resource
└── Related Insight
```

---

## User Journey

### Visitor

```text
Homepage

↓

Solution

↓

Capability

↓

Expert

↓

Contact
```

---

### Researcher

```text
Homepage

↓

Insight

↓

Expert

↓

Resource
```

---

### Organization

```text
Homepage

↓

Capability

↓

Solution

↓

Contact
```

---

## Navigation Components

- Header
- Mega Menu
- Breadcrumb
- Footer
- CTA
- Search
- Related Content

---

## Navigation Rules

- Every page belongs to one primary menu.
- Every detail page links to related content.
- Every page provides a path back to Home.
- Every page includes at least one CTA.
- Navigation depth should not exceed three levels.

---

## AI Notes

Always

- Keep navigation consistent.
- Reuse navigation components.
- Follow user journey.
- Preserve internal linking.

Never

- Create orphan pages.
- Break navigation hierarchy.
- Duplicate navigation menus.

---

## Definition of Done

- Primary navigation defined.
- User journeys defined.
- Content relationships defined.
- Navigation rules approved.