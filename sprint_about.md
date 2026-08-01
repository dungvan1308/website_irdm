# Sprint X - About Page (/ve-irdm/)

## Objective
Implement the complete "Về IRDM" page according to the Figma design.
Reference (Source of Truth)
figmapng/about/VeIRDM.png
The implementation must be pixel-perfect while following the existing IRDM architecture.
Do NOT implement quick fixes.
Everything must follow the reusable CMS-driven architecture already used throughout the project.
---
# General Requirements
The entire page MUST be configurable from CMS Admin.
No hardcoded content is allowed.
CMS should control
- Titles
- Subtitles
- Descriptions
- Rich Text
- Images
- Background Images
- Icons
- Statistics
- Cards
- Timeline
- CTA Buttons
- URLs
- Button Labels
- Ordering
- Visibility
- Colors (where applicable)
- SEO
- Open Graph
- Meta Data
Support
- Vietnamese
- English
Use existing
Service Layer
Repository Layer
Component Library
Design Tokens
# Page Sections
Implement every section shown in Figma.
The order must match Figma exactly.
## 1 Hero Banner
CMS Model
AboutHero
Fields
- Title
- Subtitle
- Description
- Background Image
- Foreground Illustration
- CTA Button 1
- CTA Button 2
- Button URLs
- Hero Statistics
Statistics
Each statistic configurable
Number
Suffix
Example
500+
50+
10+
Label
Display Order
Visibility
Animation Enabled
## 2 IRDM Introduction
CMS
AboutIntroduction
Title
Subtitle
Description
Large Image
Highlight Cards
Each Highlight Card
Icon
Order
## 3 Why IRDM Exists
AboutPurpose
Highlight Box
Diagram Image
Everything configurable.
## 4 Vision Mission Philosophy
VisionMission
Three Cards
Vision
Mission
Development Philosophy
Each Card
Background Color
Additional Bottom Panel configurable.
## 5 Core Values
CoreValue
Repeatable
Color Theme
## 6 Legal Foundation
LegalInformation
Left
Image
Right
Timeline
Timeline Item
Year
Document URL
## 7 CTA Banner
AboutCTA
Background Image
Primary Button
Secondary Button
URLs
## 8 Benefits
Section
Đối tác nhận được gì khi làm việc với IRDM
PartnerBenefit
## 9 Organization Network
ProfessionalNetwork
Logo
Name
Button
URL
## 10 Target Audience
IRDM đồng hành cùng những ai
TargetAudience
Button URL
## 11 Capability & Ecosystem
CapabilityEcosystem
Floating Diagram
Partner Groups
Each Partner Group
Items
Color
Bottom Statistics configurable.
## 12 Contact Banner
ContactBanner
Hotline
Email
Social Links
## 13 Footer
Reuse existing shared Footer component.
No duplicate implementation.
# CMS
Create a dedicated CMS module
About Page
Use inline formsets for repeatable data.
Preview Image
Drag & Drop Ordering
Soft Delete
SEO
Publish Schedule
Draft
Version History
Active Flag
# Image Management
Every image
upload via CMS
Preview
Auto resize
WebP generation
Responsive images
Alt text
Caption
Lazy loading
No hardcoded assets.
# Icons
All icons configurable.
Allow
Heroicons
SVG Upload
Image Upload
Choose existing icon library.
# Buttons
Every button configurable.
Open in new tab
Button Style
Tracking Code
# Responsive
Desktop
Tablet
Mobile
Pixel-perfect.
Maintain spacing exactly like Figma.
# Animation
Reuse existing animation system.
Fade Up
Fade Left
Fade Right
Counter Animation
Hover Animation
Do not introduce new animation libraries.
# Performance
Lazy Loading
Image Compression
WebP
Responsive Images
Intersection Observer
Minimize DOM
Reuse shared components.
# Accessibility
ARIA
Keyboard Navigation
Alt Images
Color Contrast
Focus States
Semantic HTML
# SEO
Meta Title
Meta Description
Keywords
Canonical
Open Graph
Twitter Card
Schema.org
Breadcrumb
Everything editable in CMS.
# Technical Requirements
Follow existing architecture
apps/about
services
repositories
selectors
templates
partials
components
Do not bypass Service Layer.
No duplicated code.
Maximum reuse.
# Seed Data
Generate realistic IRDM seed data matching the Figma.
Include
All text
Images
Icons
Core Values
Philosophy
Networks
Partners
CTA
Everything should be editable from CMS.
# Acceptance Criteria
✓ Pixel-perfect compared to Figma.
✓ Every visible content editable from CMS.
✓ No hardcoded text.
✓ No hardcoded images.
✓ No hardcoded URLs.
✓ Reusable architecture.
✓ Responsive.
✓ Optimized.
✓ Production-ready.
✓ Consistent with previous Homepage implementation.