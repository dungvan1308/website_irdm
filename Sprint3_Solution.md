You are a Principal Software Architect, Senior Django Architect, Senior PostgreSQL Architect, Senior CMS Architect, Senior Frontend Engineer and Senior UI/UX Engineer.

Sprint 3 has already been implemented.

Your task is NOT to rebuild the Solution module.

Your task is to review, refine, complete and improve the existing implementation until it fully complies with the approved project architecture and closely matches the approved Figma design.

Reuse existing code whenever possible.

Do not duplicate functionality.

==================================================
READ PROJECT DOCUMENTATION
==================================================

Read and understand the project documentation in the following order.

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
docs/11_product_spec/004_solution.md

The Architecture documents define platform rules.

The Product Specification defines the Solution business domain.

Both must be respected.
==================================================
READ APPROVED DESIGN
==================================================
Read completely:
figmapng/solution/giaiphap.png

Treat the PNG as both:
• UI Source of Truth
• Demonstration Content Reference
Analyse completely:
- Header
- Footer
- Hero
- Audience Selector
- Methodology
- Audience Sections
- Focus Topics
- IRDM Actions
- Capability Cards
- Output Cards
- CTA
- Typography
- Images
- Icons
- Illustrations
- Background Images
- Decorative Graphics
- Responsive Layout

==================================================
STEP 1
Architecture Review
==================================================

Review the existing implementation.

Verify compliance with:

- Architecture
- Product Specification
- CMS First
- Shared Components
- Service Layer
- Dynamic Rendering

Reuse existing implementation whenever possible.

==================================================
STEP 2
Global Website Components
==================================================

Review whether reusable Website components already exist.

If missing, implement a reusable Website Settings module.

The Website module shall manage:

Header

- Logo
- Primary Navigation
- Search
- Language
- Primary CTA

Footer

- Logo
- Organization Information
- Contact
- Quick Links
- Search
- Google Map
- Social Links
- Copyright

These components are shared by the entire website.

They must NOT belong to the Solution module.

==================================================
STEP 3
Solution Review
==================================================

Review the Solution module against:

docs/11_product_spec/004_solution.md

Verify:

- Hero
- Audience Selector
- Methodology
- Audience Sections
- Focus Topics
- IRDM Actions
- Capability Collection
- Output Collection
- CTA Banner

Verify that every business block is CMS-driven.

==================================================
STEP 4
Visual & Content Mapping
==================================================

Compare the implementation against:

figmapng/solution/giaiphap.png

Treat the PNG as both:

• Visual Source of Truth

• Demonstration Content Reference

Review every visible element.

For every section identify:

- Layout
- Heading
- Paragraph
- Button
- Card
- Image
- Icon
- Illustration
- Background
- Decorative Graphics

If a visible element exists in the PNG but not in the implementation:

- Extend the CMS
- Extend the Data Model if required
- Extend the Frontend
- Extend the Seed Commands

Every visible business element shall have a CMS representation.

==================================================
STEP 5
Asset & Content Extraction
==================================================

Analyse the approved PNG.

Extract reusable assets whenever possible.

Including:

- Logo
- Hero Images
- Navigation Images
- Card Images
- Icons
- Illustrations
- Background Images
- Decorative Graphics

Store reusable assets under:

figmapng/solution/extracted_assets/

Use meaningful filenames.

Review all visible business text.

If curated business content already exists:

Reuse it.

Otherwise:

Generate equivalent demonstration content matching the approved design.

==================================================
STEP 6
CMS & Media Review
==================================================

Verify that every visible business element has a CMS representation.

Every text block shall map to editable CMS fields.

Every visible image shall map to an ImageField.

Every visible card shall map to a CMS entity.

Review media support.

Implement if missing:

- MEDIA_ROOT
- MEDIA_URL
- ImageField
- Image Upload
- Image Preview
- Dynamic Image Rendering

No business content shall remain hardcoded.

==================================================
STEP 7
Seed Review
==================================================

Review:

apps/website/management/commands/seed_website.py

apps/solution/management/commands/seed_solution.py

If missing, create them.

Populate complete demonstration data.

Populate complete demonstration media.

Populate complete relationships.

Seed Website:

- Header
- Footer
- Logo
- Navigation
- Contact
- Search
- Google Map
- Social Links

Seed Solution:

- Hero
- Methodology
- Audience Sections
- Navigation Information
- Focus Topics
- IRDM Actions
- Capability Cards
- Output Cards
- CTA Banner
- Relationships
- SEO
- Images

Every ImageField shall reference a corresponding extracted asset.

The generated website shall contain:

- Complete business text
- Complete images
- Complete relationships
- No empty titles
- No empty descriptions
- No missing images
- No placeholder cards
- No broken media

Seed commands must be idempotent.

Running:

python manage.py migrate

python manage.py seed_website

python manage.py seed_solution

shall generate a complete demonstration website.

==================================================
STEP 8
Gap Analysis
==================================================

Identify every remaining gap.

Examples:

- Missing CMS
- Missing Images
- Missing Text
- Missing Relationships
- Missing Layout
- Missing Components
- Missing Responsive Behaviour
- Missing Demo Data

Fix only missing functionality.

Reuse existing implementation whenever possible.

==================================================
STEP 9
Final Review
==================================================

Compare the final website against:

figmapng/solution/giaiphap.png

Review:

- Every section
- Every card
- Every heading
- Every paragraph
- Every image
- Every icon
- Every illustration
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

✓ Website Settings implemented

✓ Global Header completed

✓ Global Footer completed

✓ Solution module completed

✓ CMS completed

✓ Dynamic rendering completed

✓ Complete business text populated

✓ Complete images populated

✓ Every ImageField mapped

✓ Every visible text block mapped

✓ Every visible image mapped

✓ Every visible card mapped

✓ Responsive layout completed

✓ Seed commands completed

✓ Website visually close to the approved Figma

✓ Website ready for stakeholder demonstration immediately after:

python manage.py migrate

python manage.py seed_website

python manage.py seed_solution

The objective is not only to make the application functional.

The objective is to generate a complete demonstration website.

Every visible business text, image, icon, illustration and card shown in the approved PNG shall have a corresponding CMS representation and shall be automatically populated by the seed commands.

The generated website must be ready for stakeholder demonstration without requiring manual CMS editing or manual image upload.