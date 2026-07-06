# 011. Knowledge & Industry Insights Module

## Product Specification

Version: 1.0

Status: Approved

---

# 1. Module Overview

The Knowledge & Industry Insights module (Vietnamese: *Tri Thức & Góc Nhìn Ngành*) is the content publishing hub of the IRDM platform.

It aggregates and presents research articles, policy briefs, industry analyses, downloadable publications, news updates and multimedia content produced or curated by IRDM.

The module is implemented as a fully CMS-driven business domain. All content, images, categories, topics, featured items and download resources are managed through Django Admin without modifying source code.

The Knowledge module follows the Enterprise CMS Architecture defined by the project.

---

# 2. Business Objectives

The Knowledge module shall:

- Publish IRDM research, insights and knowledge products.
- Organise content by Category and Topic.
- Surface Featured Articles to highlight priority content.
- Enable visitors to search and filter content.
- Provide downloadable publications and reports.
- Display recent news and updates.
- Support Capability-linked and Solution-linked content.
- Drive professional credibility and thought leadership.
- Remain fully CMS-driven.
- Support unlimited Categories, Topics, Articles, Downloads and News.
- Closely match the approved design.

---

# 3. Approved Design

Approved design:

```text
figmaPNG/
└── knowledge/
    └── TriThuc_GocNhinNganh.png
```

The PNG is the approved UI Source of Truth.

Before implementing or modifying the Knowledge module, review the complete PNG to understand:

- Page hierarchy
- Hero and Search layout
- Filter bar design
- Featured Content layout
- Category Section layout
- Article Card design
- Download Section layout
- News Section layout
- CTA Section layout
- Typography scale
- Image treatment
- Responsive behaviour

Every visible block in the approved design shall have a corresponding CMS structure.

Every visible image shall have a corresponding CMS-managed ImageField unless it belongs to the global design system.

---

# 4. Page Composition

The Knowledge module is implemented as two page types.

Global Header and Global Footer belong to the Website module and are shared by all pages.

The Knowledge module manages only its business content.

## 4.1 Listing Page  `/tri-thuc-goc-nhin/`

```text
Knowledge Listing Page
│
├── Hero
│     ├── Section Label
│     ├── Heading
│     ├── Description
│     └── Search Bar
│
├── Filter Bar
│     └── Topic Filter Tags (1..N)
│
├── Featured Article Section
│     ├── Section Label
│     ├── Heading
│     └── Featured Article Cards (1..N)
│
├── Category Sections (1..N)
│     ├── Category Label
│     ├── Category Heading
│     ├── Category Description
│     └── Article Cards (1..N)
│
├── Download Section
│     ├── Section Label
│     ├── Heading
│     └── Download Cards (1..N)
│
├── News Section
│     ├── Section Label
│     ├── Heading
│     └── News Items (1..N)
│
└── CTA Banner
      ├── Heading
      ├── Sub Heading
      ├── Background Image
      └── CTA Buttons (1..2)
```

## 4.2 Article Detail Page  `/tri-thuc-goc-nhin/<slug>/`

```text
Article Detail Page
│
├── Breadcrumb
├── Hero
│     ├── Category Label
│     ├── Title
│     ├── Summary
│     ├── Author
│     ├── Published Date
│     ├── Read Time
│     └── Hero Image
│
├── Article Body
│     └── Rich Text Content
│
├── Related Capabilities (0..N)
│
├── Related Articles (0..N)
│
└── CTA Banner
```

---

# 5. Content Blocks

## 5.1 Hero Block

Appears at the top of the Listing Page.

| Field | Type | Required |
|---|---|---|
| Section Label | CharField | No |
| Heading | CharField | Yes |
| Description | TextField | No |
| Background Image | ImageField | No |
| Search Enabled | BooleanField | Yes |
| Meta Title | CharField | No |
| Meta Description | CharField | No |

## 5.2 Filter Bar

Derived dynamically from published KnowledgeTopic records.

No separate CMS entity required. Topics serve as filter tags.

Visitor selects a Topic tag to filter Articles.

## 5.3 Featured Article Section

| Field | Type | Required |
|---|---|---|
| Section Label | CharField | No |
| Heading | CharField | No |
| Description | TextField | No |
| Featured Articles | ManyToManyField → KnowledgeArticle | No |

Featured Articles are manually curated by CMS editors.

Display order is controlled by `display_order` on the through model.

## 5.4 Category Section

Each KnowledgeCategory generates one Category Section on the listing page.

| Field | Type | Required |
|---|---|---|
| Label | CharField | Yes |
| Slug | SlugField | Yes |
| Heading | CharField | Yes |
| Description | TextField | No |
| Icon | CharField (icon name) | No |
| Cover Image | ImageField | No |
| Display Order | PositiveIntegerField | Yes |
| Is Published | BooleanField | Yes |

The listing page renders all published Categories ordered by `display_order`.

Each Category Section renders its Articles ordered by `display_order`.

## 5.5 Article Card

Represents one knowledge item within a Category Section.

| Field | Type | Required |
|---|---|---|
| Title | CharField | Yes |
| Slug | SlugField | Yes (unique) |
| Category | ForeignKey → KnowledgeCategory | Yes |
| Topics | ManyToManyField → KnowledgeTopic | No |
| Summary | TextField | No |
| Body | RichTextField | No |
| Thumbnail | ImageField | No |
| Hero Image | ImageField | No |
| Author Name | CharField | No |
| Published Date | DateField | No |
| Read Time (minutes) | PositiveIntegerField | No |
| Is Featured | BooleanField | No |
| Is Published | BooleanField | Yes |
| Display Order | PositiveIntegerField | Yes |
| Related Capabilities | ManyToManyField → Capability | No |
| Meta Title | CharField | No |
| Meta Description | CharField | No |
| Meta Keywords | CharField | No |

## 5.6 Topic Tag

Used as Filter Bar items and as Article classification labels.

| Field | Type | Required |
|---|---|---|
| Label | CharField | Yes |
| Slug | SlugField | Yes (unique) |
| Description | TextField | No |
| Icon | CharField | No |
| Display Order | PositiveIntegerField | Yes |
| Is Published | BooleanField | Yes |

## 5.7 Download Card

Represents one downloadable publication or report.

| Field | Type | Required |
|---|---|---|
| Title | CharField | Yes |
| Slug | SlugField | Yes |
| Summary | TextField | No |
| Cover Image | ImageField | No |
| File | FileField | Yes |
| File Type Label | CharField | No (e.g. PDF, XLSX) |
| File Size Label | CharField | No (e.g. 2.3 MB) |
| Category | ForeignKey → KnowledgeCategory | No |
| Published Date | DateField | No |
| Is Published | BooleanField | Yes |
| Display Order | PositiveIntegerField | Yes |

## 5.8 News Item

Represents one recent update or announcement.

| Field | Type | Required |
|---|---|---|
| Title | CharField | Yes |
| Slug | SlugField | Yes |
| Summary | TextField | No |
| Thumbnail | ImageField | No |
| Published Date | DateField | No |
| Source URL | URLField | No |
| Category | ForeignKey → KnowledgeCategory | No |
| Topics | ManyToManyField → KnowledgeTopic | No |
| Is Published | BooleanField | Yes |
| Display Order | PositiveIntegerField | Yes |

## 5.9 CTA Banner

Reusable CTA section at the bottom of the Listing Page.

| Field | Type | Required |
|---|---|---|
| Sub Heading | CharField | No |
| Heading | CharField | Yes |
| Background Image | ImageField | No |
| Primary CTA Label | CharField | No |
| Primary CTA URL | CharField | No |
| Secondary CTA Label | CharField | No |
| Secondary CTA URL | CharField | No |
| Is Published | BooleanField | Yes |

---

# 6. CMS Requirements

The CMS shall manage:

## Listing Page

- Hero (section label, heading, description, background image, search toggle)
- Featured Article Section (heading, curated articles)
- CTA Banner

## Article Management

- Create, update, publish, unpublish, reorder Articles
- Assign Articles to Category
- Assign Articles to Topics
- Mark Articles as Featured
- Upload Thumbnail and Hero Image
- Manage Author, Date, Read Time
- Manage SEO fields
- Relate Articles to Capabilities

## Category Management

- Create, update, publish, unpublish, reorder Categories
- Upload Category Cover Image
- Manage Category Icon

## Topic Management

- Create, update, publish, unpublish, reorder Topics

## Download Management

- Create, update, publish, unpublish, reorder Downloads
- Upload Download Cover Image
- Upload Download File (PDF, XLSX, DOCX, etc.)
- Manage File Type and Size labels

## News Management

- Create, update, publish, unpublish, reorder News Items
- Upload News Thumbnail
- Assign News to Category and Topics

## Media

- Listing Page Hero Background Image
- Article Thumbnails
- Article Hero Images
- Category Cover Images
- Download Cover Images
- News Thumbnails
- CTA Background Image

## General

- SEO (meta title, meta description, meta keywords) per Article
- Publish Status per entity
- Display Order per entity
- Audit Fields (created, modified) per entity

All business content shall be editable through Django Admin.

---

# 7. Dynamic Collections

The following business content shall support unlimited records.

## Categories

1..N

Desktop layout displays Articles grouped under their Category.

## Topics

1..N

Displayed as Filter Bar tags on the Listing Page.

## Articles per Category

1..N

Desktop layout displays up to 3 Article Cards per row within a Category Section.

## Featured Articles

1..N

Desktop layout displays up to 3 Featured Cards per row.

## Downloads

1..N

Desktop layout displays up to 3 Download Cards per row.

## News Items

1..N

Desktop layout displays up to 4 News Items per row.

The frontend shall render all collections dynamically.

No fixed number of records shall be assumed.

---

# 8. Data Model Overview

Logical structure:

```text
KnowledgeListingPage
│
├── Hero
├── FeaturedSection
│     └── FeaturedArticle (1..N) ──→ KnowledgeArticle
└── CTABanner

KnowledgeCategory (1..N)
│
├── label, slug, heading, description, icon, cover_image
├── display_order, is_published
│
└── KnowledgeArticle (1..N)
      │
      ├── title, slug, summary, body, thumbnail, hero_image
      ├── author_name, published_date, read_time
      ├── is_featured, is_published, display_order
      ├── meta_title, meta_description, meta_keywords
      │
      ├── KnowledgeTopic (M..N via M2M)
      └── Capability (M..N via M2M)

KnowledgeTopic (1..N)
│
└── label, slug, description, icon, display_order, is_published

KnowledgeDownload (1..N)
│
└── title, slug, summary, cover_image, file
    file_type_label, file_size_label
    category (FK), published_date
    is_published, display_order

KnowledgeNewsItem (1..N)
│
└── title, slug, summary, thumbnail
    published_date, source_url
    category (FK), topics (M2M)
    is_published, display_order
```

Every entity shall support:

- Display Order
- Publish Status
- Audit Fields (created_at, updated_at)

Media entities shall support ImageField.

KnowledgeDownload shall support FileField in addition to ImageField.

---

# 9. Rendering Principles

The Knowledge module renders business content dynamically.

The frontend shall never hardcode:

- Categories
- Topics
- Articles
- Featured Articles
- Download Items
- News Items
- CTA

Every collection shall be rendered using reusable frontend components.

The Filter Bar is rendered from published KnowledgeTopic records.

Category Sections are rendered by iterating over published KnowledgeCategory records ordered by `display_order`.

Articles within each Category are rendered by iterating over published KnowledgeArticle records filtered by Category.

Featured Articles are rendered from the `FeaturedSection.articles` M2M relationship.

Downloads are rendered from published KnowledgeDownload records ordered by `display_order`.

News Items are rendered from published KnowledgeNewsItem records ordered by published_date descending.

---

# 10. Shared Components

The Knowledge module shall reuse existing shared components whenever possible.

Examples include:

- Hero
- Section Header
- Search Bar
- Filter Tag
- Article Card
- Download Card
- News Card
- CTA Banner
- Breadcrumb
- Grid
- Pagination

Global Header and Global Footer are shared Website components.

---

# 11. Search & Filter

## Search

The Hero Search Bar accepts free text.

The search queries Article titles, summaries and body text.

Search is implemented server-side.

Search results are rendered on a search results page or as filtered listing.

## Filter

The Filter Bar renders Topic tags.

Visitor clicks a Topic tag to filter the listing to Articles assigned to that Topic.

Active filter tag is visually highlighted.

Filter state is maintained in the URL query string for shareability.

Filter is applied without full page reload where possible (optional progressive enhancement).

---

# 12. URL Structure

```text
/tri-thuc-goc-nhin/                  → Listing Page
/tri-thuc-goc-nhin/<slug>/           → Article Detail Page
/tri-thuc-goc-nhin/?topic=<slug>     → Filtered Listing by Topic
/tri-thuc-goc-nhin/?search=<query>   → Search Results
```

---

# 13. Future Integration

The architecture shall support future integration with:

- Expert Module (author linking)
- Solution Module (solution-tagged articles)
- Capability Module (capability-tagged articles)
- Event Module (event-related knowledge)
- Resource Module (resource cross-linking)

Articles may reference Capabilities without requiring architectural redesign.

---

# 14. Acceptance Criteria

The Knowledge module is complete when:

- The Listing Page follows the approved architecture.
- The page structure closely matches the approved Figma design.
- The Listing Page is fully CMS-driven.
- Hero content is editable from CMS.
- Filter Bar renders from published KnowledgeTopic records.
- Featured Articles section renders from CMS-managed M2M relationships.
- Category Sections are dynamic — adding a new Category creates a new section.
- Articles within each Category are dynamic.
- Downloads section renders from published KnowledgeDownload records.
- News section renders from published KnowledgeNewsItem records.
- CTA Banner is editable from CMS.
- All images are managed through Django Admin ImageFields.
- Downloadable files are managed through Django Admin FileFields.
- Article Detail Page is fully rendered from CMS data.
- Search is functional.
- Topic Filter is functional.
- Business content is stored in PostgreSQL.
- Seed command populates complete demonstration data including images and files.
- The architecture supports future business expansion without redesign.
