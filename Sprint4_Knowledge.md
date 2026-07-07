You are a Principal Software Architect, Senior Django Architect, Senior PostgreSQL Architect, Senior CMS Architect, Senior Frontend Engineer and Senior UI/UX Engineer.

Sprint 4 implements the Knowledge & Industry Insights module from scratch.

==================================================
READ PROJECT DOCUMENTATION
==================================================

Read and understand the project documentation in the following order:

1.
.github/copilot-instructions.md

2.
docs/01_foundation/

3.
docs/02_architecture/

4.
docs/03_database/

5.
docs/04_design_system/

6.
docs/05_shared_components/

7.
docs/06_admin/

8.
docs/07_backend/

9.
docs/08_frontend/

10.
docs/11_product_spec/011_knowledge.md

The Architecture documents define platform rules.

The Product Specification defines the Knowledge business domain.

Both must be respected.

==================================================
READ APPROVED DESIGN
==================================================

Read completely:

figmapng/knowledge/TriThuc_GocNhinNganh.png

Treat the PNG as both:
• UI Source of Truth
• Demonstration Content Reference

Analyse completely:

- Global Header
- Hero Section
- Search Bar
- Filter Bar (Topic Tags)
- Featured Article Section
- Category Sections
- Article Cards
- Download Section
- Download Cards
- News Section
- News Cards
- CTA Banner
- Global Footer
- Typography
- Images
- Icons
- Colour palette
- Spacing
- Responsive Layout

==================================================
STEP 1
Architecture Review
==================================================

Review the existing codebase.

Verify:

- apps/knowledge/ exists or needs to be created
- config/urls.py includes knowledge namespace
- config/settings.py includes knowledge app
- apps/common/models.py BaseModel is reused
- apps/website/ shared components exist (Header, Footer)

Identify reusable shared components.

Do not duplicate existing functionality.

==================================================
STEP 2
Global Website Components
==================================================

Verify that global Website components are already implemented:

Header:
- Logo
- Primary Navigation
- Search
- Language Switcher
- Primary CTA

Footer:
- Logo
- Organisation Information
- Contact
- Quick Links
- Social Links
- Copyright

These components are shared by all pages.

They must NOT be implemented inside the Knowledge module.

==================================================
STEP 3
Database Design
==================================================

Design the complete data model for the Knowledge module.

Follow the Data Model Overview in:
docs/11_product_spec/011_knowledge.md

Implement the following models in apps/knowledge/models.py:

KnowledgeListingPage
- section_label
- heading
- description
- hero_image (ImageField)
- search_enabled (BooleanField)
- featured_section_label
- featured_section_heading
- cta_sub
- cta_heading
- cta_background_image (ImageField)
- cta_primary_label
- cta_primary_url
- cta_secondary_label
- cta_secondary_url
- meta_title
- meta_description
- is_active
- display_order

KnowledgeCategory
- label
- slug (unique)
- heading
- description
- icon (CharField)
- cover_image (ImageField)
- is_published
- is_active
- display_order

KnowledgeTopic
- label
- slug (unique)
- description
- icon (CharField)
- is_published
- is_active
- display_order

KnowledgeArticle
- title
- slug (unique)
- category (FK → KnowledgeCategory)
- topics (M2M → KnowledgeTopic)
- summary
- body (TextField)
- thumbnail (ImageField)
- hero_image (ImageField)
- author_name
- published_date (DateField)
- read_time (PositiveIntegerField, minutes)
- is_featured (BooleanField)
- is_published
- is_active
- display_order
- related_capabilities (M2M → Capability, blank=True)
- meta_title
- meta_description
- meta_keywords

KnowledgeFeaturedArticle
- listing_page (FK → KnowledgeListingPage)
- article (FK → KnowledgeArticle)
- display_order

KnowledgeDownload
- title
- slug (unique)
- summary
- cover_image (ImageField)
- file (FileField, upload_to="knowledge/downloads/")
- file_type_label (CharField, e.g. PDF)
- file_size_label (CharField, e.g. 2.3 MB)
- category (FK → KnowledgeCategory, null=True)
- published_date (DateField)
- is_published
- is_active
- display_order

KnowledgeNewsItem
- title
- slug (unique)
- summary
- thumbnail (ImageField)
- published_date (DateField)
- source_url (URLField, blank=True)
- category (FK → KnowledgeCategory, null=True)
- topics (M2M → KnowledgeTopic)
- is_published
- is_active
- display_order

All models inherit from apps/common/models.py BaseModel.

All models respect the architecture defined in docs/02_architecture/.

==================================================
STEP 4
Django Admin CMS
==================================================

Implement full CMS in apps/knowledge/admin.py.

Register:

KnowledgeListingPageAdmin
- Fieldsets: Hero, Featured Section, CTA, SEO, Status
- Inline: KnowledgeFeaturedArticleInline
- Image preview for hero_image, cta_background_image

KnowledgeCategoryAdmin
- list_display: label, slug, display_order, is_published, is_active
- list_editable: display_order, is_published, is_active
- Image preview for cover_image

KnowledgeTopicAdmin
- list_display: label, slug, display_order, is_published, is_active
- list_editable: display_order, is_published, is_active

KnowledgeArticleAdmin
- list_display: title, category, is_featured, is_published, display_order
- list_filter: category, topics, is_featured, is_published
- search_fields: title, summary
- filter_horizontal: topics, related_capabilities
- Fieldsets: Identity, Content, Media, Classification, SEO, Status
- Image preview for thumbnail, hero_image
- Inline: none (topics managed via filter_horizontal)

KnowledgeDownloadAdmin
- list_display: title, category, file_type_label, is_published, display_order
- list_editable: display_order, is_published, is_active
- Image preview for cover_image

KnowledgeNewsItemAdmin
- list_display: title, category, published_date, is_published, display_order
- list_editable: display_order, is_published, is_active
- filter_horizontal: topics
- Image preview for thumbnail

Every ImageField shall have an image_preview readonly field in Admin.

==================================================
STEP 5
Service Layer
==================================================

Implement apps/knowledge/services.py.

KnowledgeService shall expose:

get_listing_page() → KnowledgeListingPage
get_categories() → QuerySet[KnowledgeCategory]
get_topics() → QuerySet[KnowledgeTopic]
get_articles_by_category(category) → QuerySet[KnowledgeArticle]
get_featured_articles(listing_page) → QuerySet[KnowledgeArticle]
get_downloads() → QuerySet[KnowledgeDownload]
get_news_items() → QuerySet[KnowledgeNewsItem]
get_article_by_slug(slug) → KnowledgeArticle | None
filter_articles_by_topic(topic_slug) → QuerySet[KnowledgeArticle]
search_articles(query) → QuerySet[KnowledgeArticle]

All queries shall use select_related and prefetch_related to minimise database hits.

No business logic shall exist in views.

==================================================
STEP 6
URL Configuration
==================================================

Implement apps/knowledge/urls.py:

urlpatterns = [
    path("", KnowledgeListingView.as_view(), name="listing"),
    path("<slug:slug>/", KnowledgeArticleDetailView.as_view(), name="detail"),
]

Register in config/urls.py:

path("tri-thuc-goc-nhin/", include("apps.knowledge.urls", namespace="knowledge")),

==================================================
STEP 7
Views
==================================================

Implement apps/knowledge/views.py.

KnowledgeListingView (TemplateView):
- template: knowledge/listing.html
- Context:
  - listing_page
  - categories (with prefetched articles)
  - topics
  - featured_articles
  - downloads
  - news_items
  - active_topic (from ?topic= query param)

KnowledgeArticleDetailView (TemplateView):
- template: knowledge/detail.html
- Context:
  - article
  - related_capabilities
  - related_articles

Both views use KnowledgeService exclusively.

==================================================
STEP 8
Frontend Templates
==================================================

Implement the following templates:

apps/knowledge/templates/knowledge/listing.html
apps/knowledge/templates/knowledge/detail.html

Listing Page Template Sections:

1. Hero
   - Section label pill
   - Heading (large, uppercase)
   - Description
   - Search bar (form GET action to ?search=)
   - Background image with dark overlay

2. Filter Bar
   - Render published KnowledgeTopic records as clickable tags
   - Active topic tag highlighted
   - Click navigates to ?topic=<slug>
   - "All" tag shows full listing

3. Featured Articles Section
   - Section label + heading from listing_page
   - 3-column card grid at lg
   - Each card: thumbnail, category label, title, summary, read time, link

4. Category Sections (loop over categories)
   - Category label + heading
   - 3-column article card grid at lg
   - Article card: thumbnail, topic tags, title, summary, date, link

5. Download Section
   - Section label + heading
   - 3-column download card grid at lg
   - Download card: cover image, title, summary, file type badge, download button

6. News Section
   - Section label + heading
   - 4-column news card grid at xl
   - News card: thumbnail, category, title, date, link

7. CTA Banner
   - Background image with overlay
   - Left: sub label + large uppercase heading
   - Right: primary + secondary button
   - Contained in max-w-7xl with rounded-2xl — same width as page content

Article Detail Template Sections:

1. Breadcrumb
2. Hero: category label, title, summary, author, date, read time, hero image
3. Body: rich text
4. Related Capabilities: card grid
5. Related Articles: card grid
6. CTA Banner (reuse listing CTA banner structure)

Extend layouts/base.html.

Use Tailwind CSS utility classes only.

No inline styles except for dynamic properties (e.g. min-height).

Reuse existing component patterns from Solution and Capability modules.

==================================================
STEP 9
Media Management
==================================================

Verify MEDIA_ROOT and MEDIA_URL in config/settings.py.

Verify media serving in config/urls.py for DEBUG mode.

All ImageField upload_to paths:

knowledge/listing/         → listing page hero
knowledge/categories/      → category cover images
knowledge/articles/thumbnails/  → article thumbnails
knowledge/articles/hero/   → article hero images
knowledge/downloads/       → download cover images
knowledge/news/            → news item thumbnails
knowledge/cta/             → CTA background images

KnowledgeDownload.file upload_to:

knowledge/downloads/files/

==================================================
STEP 10
Seed Command
==================================================

Implement:

apps/knowledge/management/commands/seed_knowledge.py

Seed:

KnowledgeListingPage (1 record)
KnowledgeCategory (4..6 records)
KnowledgeTopic (6..10 records)
KnowledgeArticle (3..6 per category)
KnowledgeFeaturedArticle (3 records)
KnowledgeDownload (3..6 records)
KnowledgeNewsItem (4..8 records)

For every ImageField:

1. Check figmapng/knowledge/extracted_assets/ for a matching file.
2. If found: load the real Figma asset.
3. If not found: generate a gradient placeholder PNG using Pillow.

Seed data shall match the approved Figma design content:

- Category names matching the Figma
- Topic names matching the Figma
- Article titles matching the Figma
- Download titles matching the Figma
- News titles matching the Figma

Seed command must be idempotent.

Running seed multiple times shall not create duplicate records.

==================================================
STEP 11
Tailwind CSS
==================================================

After implementing templates, add any dynamic or database-driven CSS classes to the safelist in tailwind.config.js.

Run:

npm run build:css

Verify the compiled static/css/tailwind.min.css includes all classes used in templates.

==================================================
STEP 12
Gap Analysis
==================================================

After implementation, compare the live website against:

figmapng/knowledge/TriThuc_GocNhinNganh.png

Identify every remaining gap:

- Missing sections
- Missing images
- Missing text
- Missing responsive behaviour
- Missing interactions
- Missing demo data

Fix all gaps before marking the sprint complete.

==================================================
STEP 13
Final Review
==================================================

Compare the final website against:

figmapng/knowledge/TriThuc_GocNhinNganh.png

Review:

- Every section
- Every card
- Every heading
- Every paragraph
- Every image
- Every icon
- Every CTA
- Every layout
- Every spacing
- Every responsive breakpoint

Continue refining until no significant visual or content gap remains.

==================================================
EXPECTED RESULT
==================================================

✓ Enterprise Architecture preserved

✓ Shared Components reused

✓ Knowledge module implemented from scratch

✓ CMS fully functional for all entities

✓ Listing Page matches approved Figma design

✓ Article Detail Page implemented

✓ Filter Bar functional

✓ Search functional

✓ Featured Articles section dynamic

✓ Category Sections dynamic

✓ Downloads section dynamic

✓ News section dynamic

✓ CTA Banner implemented and CMS-driven

✓ All images managed through ImageFields

✓ Downloadable files managed through FileFields

✓ Seed command populates complete demonstration data

✓ Tailwind CSS rebuilt with all required classes

✓ Website ready for stakeholder demonstration after:

python manage.py migrate
python manage.py seed_knowledge

==================================================
DEMONSTRATION CONTENT
==================================================

The seed command shall generate demonstration content that matches the approved Figma design.

Suggested Categories (align with Figma):

1. Nghiên cứu ứng dụng
2. Chính sách & Điều hành
3. Sức khỏe & Wellbeing
4. Giáo dục & Phát triển năng lực
5. ESG & Phát triển bền vững
6. Công nghệ & Đổi mới sáng tạo

Suggested Topics (align with Figma):

1. Dữ liệu & Phân tích
2. Chính sách
3. Y tế
4. Giáo dục
5. Wellbeing
6. ESG
7. AI & Công nghệ
8. Nghiên cứu

Suggested Downloads:

1. Báo cáo thường niên IRDM 2024
2. Khung năng lực quản lý y tế
3. Hướng dẫn triển khai ESG cho doanh nghiệp
4. Bộ công cụ đánh giá wellbeing

Suggested News:

1. IRDM ra mắt chương trình hợp tác mới với Bộ Y tế
2. Hội thảo quốc tế về dữ liệu y tế 2024
3. Báo cáo mới về xu hướng ESG tại Việt Nam
4. IRDM ký kết biên bản ghi nhớ với 3 trường đại học
