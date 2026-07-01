# Public Component Library

## Purpose

Define all reusable public UI components for the IRDM Enterprise Website.

---

## Scope

Applies to

- Public Website
- Landing Pages
- Content Pages
- Search Pages
- Detail Pages

---

## Component Principles

- Component-Based
- Reusable
- Independent
- Configurable
- Responsive
- Accessible
- HTMX Compatible

---

## Global Components

| Component | Purpose | Reusable | CMS | HTMX |
|-----------|----------|:-------:|:---:|:----:|
| Header | Global Navigation | ✓ | ✓ | ✗ |
| Footer | Global Footer | ✓ | ✓ | ✗ |
| Breadcrumb | Navigation Context | ✓ | ✗ | ✓ |
| Page Header | Page Title & Intro | ✓ | ✓ | ✗ |
| CTA Section | Call To Action | ✓ | ✓ | ✗ |

---

## Homepage Components

| Component | Purpose | Reusable | CMS | HTMX |
|-----------|----------|:-------:|:---:|:----:|
| Hero Banner | Homepage Introduction | ✓ | ✓ | ✗ |
| Statistics | Key Metrics | ✓ | ✓ | ✓ |
| Partner Logos | Partner Showcase | ✓ | ✓ | ✓ |
| Featured Solutions | Highlight Solutions | ✓ | ✓ | ✓ |
| Featured Capabilities | Highlight Capabilities | ✓ | ✓ | ✓ |
| Featured Experts | Highlight Experts | ✓ | ✓ | ✓ |
| Featured Insights | Highlight Knowledge | ✓ | ✓ | ✓ |
| Featured Events | Highlight Events | ✓ | ✓ | ✓ |
| Featured Resources | Highlight Publications | ✓ | ✓ | ✓ |

---

## Content Components

| Component | Purpose | Reusable | CMS | HTMX |
|-----------|----------|:-------:|:---:|:----:|
| Solution Card | Solution Summary | ✓ | ✓ | ✓ |
| Capability Card | Capability Summary | ✓ | ✓ | ✓ |
| Expert Card | Expert Summary | ✓ | ✓ | ✓ |
| Insight Card | Article Summary | ✓ | ✓ | ✓ |
| Event Card | Event Summary | ✓ | ✓ | ✓ |
| Resource Card | Publication Summary | ✓ | ✓ | ✓ |
| Related Content | Internal Linking | ✓ | ✓ | ✓ |

---

## Search Components

| Component | Purpose | Reusable | CMS | HTMX |
|-----------|----------|:-------:|:---:|:----:|
| Search Box | Global Search | ✓ | ✗ | ✓ |
| Search Filter | Filter Results | ✓ | ✗ | ✓ |
| Search Result | Search Result List | ✓ | ✓ | ✓ |
| Pagination | Page Navigation | ✓ | ✗ | ✓ |

---

## Form Components

| Component | Purpose | Reusable | CMS | HTMX |
|-----------|----------|:-------:|:---:|:----:|
| Contact Form | Lead Collection | ✓ | ✓ | ✓ |
| Newsletter Form | Email Subscription | ✓ | ✓ | ✓ |
| Download Form | Resource Request | ✓ | ✓ | ✓ |

---

## Feedback Components

| Component | Purpose | Reusable | HTMX |
|-----------|----------|:-------:|:----:|
| Loading State | Loading Indicator | ✓ | ✓ |
| Empty State | No Data Display | ✓ | ✓ |
| Error State | Error Display | ✓ | ✓ |
| Success Message | Success Feedback | ✓ | ✓ |

---

## Shared UI Components

- Button
- Badge
- Tag
- Label
- Avatar
- Icon
- Modal
- Accordion
- Tabs
- Timeline
- Carousel
- Gallery
- Video Player

---

## Component Rules

Every component must

- Be reusable.
- Be independent.
- Accept dynamic data.
- Support multilingual content.
- Support responsive layouts.
- Follow the Design System.
- Remain presentation only.

Never

- Hardcode business content.
- Duplicate existing components.
- Mix business logic with UI.
- Create page-specific components unless required.

---

## AI Notes

Always

- Reuse existing components.
- Follow Figma exactly.
- Keep components generic.
- Keep HTML semantic.
- Use HTMX where appropriate.
- Use Tailwind CSS utilities.

Never

- Create duplicate UI components.
- Hardcode layout values.
- Generate inconsistent UI patterns.
- Break the Design System.

---

## Definition of Done

- Public components identified.
- Component inventory approved.
- Reuse strategy approved.
- Component rules approved.