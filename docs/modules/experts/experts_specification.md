# Experts Module — Tài liệu Đặc tả Chính thức

**Phiên bản:** 1.0  
**Ngày:** 2026-07-27  
**Nguồn thiết kế:** `figmapng/experts/DoiNguChuyenGia.png`  
**Phạm vi:** Module Experts toàn bộ — Listing Page, Search, CMS, Routing, SEO

> **Lưu ý:** Đây là tài liệu DUY NHẤT để implement module Experts. Copilot đọc file này và xây dựng toàn bộ module mà không cần đọc thêm tài liệu khác.

---

# 1. Business Overview

## 1.1 Mục tiêu module

Module Experts là **thư mục chuyên gia liên ngành** của Viện IRDM. Mục tiêu:

- Xây dựng uy tín học thuật của Viện thông qua đội ngũ chuyên gia chất lượng cao
- Kết nối nhà khoa học, chuyên gia với các tổ chức, doanh nghiệp cần tư vấn
- Cung cấp công cụ tìm kiếm và lọc chuyên gia theo lĩnh vực, chuyên môn
- Hiển thị bản đồ chuyên môn liên ngành của Viện
- Tạo nguồn dữ liệu động để các module khác (Solution, Capability, Insight) tham chiếu

## 1.2 Vai trò trên website

- Là một trong các module trung tâm của hệ thống IRDM
- Được hiển thị nổi bật trên Homepage (Featured Experts section)
- Liên kết từ Solution, Capability, Insight để "gặp chuyên gia liên quan"
- Cung cấp Schema.org Person structured data cho SEO tổng thể website

## 1.3 Đối tượng người dùng

| Đối tượng | Nhu cầu |
|-----------|---------|
| Doanh nghiệp tìm tư vấn | Tìm chuyên gia phù hợp theo lĩnh vực |
| Nhà nghiên cứu học thuật | Tìm cộng tác viên liên ngành |
| Sinh viên/Học viên | Tìm người hướng dẫn, mentor |
| Cơ quan nhà nước | Tìm chuyên gia tư vấn chính sách |
| Báo chí/Truyền thông | Tìm người phát ngôn chuyên môn |
| Đối tác quốc tế | Tìm đối tác nghiên cứu Việt Nam |

## 1.4 User Journey

```
Trang chủ → Experts Listing Page
    │
    ├── Xem Hero Banner → Hiểu sứ mệnh kết nối chuyên gia
    │
    ├── Đọc "Viện IRDM kết nối như thế nào?" → Hiểu quy trình
    │
    ├── Xem Chuyên gia cao cấp → Nhận diện chuyên gia nổi bật
    │
    ├── Xem Bản đồ chuyên môn → Hiểu năng lực liên ngành
    │
    ├── Tìm kiếm / Lọc chuyên gia → Tìm người phù hợp
    │
    ├── Nhấn vào Expert Card → Expert Detail Page (sprint sau)
    │
    ├── Đọc "Các chủ đề thông tin chuyên môn" → Khám phá theo topic
    │
    └── CTA Section → "Đăng ký chuyên gia" / "Liên hệ"
```

---

# 2. UI Layout Analysis

Phân tích theo thứ tự từ trên xuống dưới theo Figma `figmapng/experts/DoiNguChuyenGia.png`.

---

## Section 1: Global Header / Navigation

- **Tên:** Global Header
- **Mục đích:** Điều hướng toàn trang web, nhất quán với tất cả các trang khác
- **Nội dung:** Logo IRDM, menu navigation chính, nút CTA "Liên hệ", language switcher (VI/EN)
- **Thành phần:** `templates/includes/header.html`
- **Dữ liệu:** Tĩnh (menu items có thể CMS)
- **CMS:** Có (menu, CTA label, CTA URL)
- **Tái sử dụng:** ✓ `includes/header.html` — dùng chung toàn site

---

## Section 2: Hero Banner

- **Tên:** Expert Hero Banner
- **Mục đích:** Giới thiệu mạng lưới chuyên gia, tạo ấn tượng đầu tiên, kêu gọi hành động
- **Nội dung:**
  - Eyebrow label: nhỏ, uppercase (VD: "MẠNG LƯỚI CHUYÊN GIA IRDM")
  - Heading chính: lớn, 2 dòng — "MANG LƯỚI NHÀ KHOA HỌC & CHUYÊN GIA LIÊN NGÀNH"
  - Description: 1–2 câu mô tả sứ mệnh
  - Button Primary: "TÌM HIỂU THÊM"
  - Button Secondary: "ĐĂNG KÝ CHUYÊN GIA"
  - Background: ảnh thực tế (hội nghị, meeting) phủ màu overlay xanh đậm bán trong suốt
- **Thành phần bên trong:**
  - Full-width background image với overlay gradient
  - Text container căn trái
  - 2 buttons cạnh nhau (Primary + Secondary)
- **Dữ liệu:** Động — lấy từ CMS (heading, description, image, button labels & URLs)
- **CMS:** Có — CRUD đầy đủ
- **Tái sử dụng:** Reuse pattern từ Capability/Solution Hero; cần `ExpertListingPage` model mới

---

## Section 3: Viện IRDM Kết Nối Chuyên Gia Như Thế Nào?

- **Tên:** Expert Process / How We Connect
- **Mục đích:** Giải thích quy trình IRDM kết nối chuyên gia với đối tác — xây dựng niềm tin
- **Nội dung:**
  - Section heading: "VIỆN IRDM KẾT NỐI CHUYÊN GIA NHƯ THẾ NÀO?"
  - Section subheading/description: 1–2 câu
  - 4 bước quy trình dạng numbered cards hoặc icon + số thứ tự:
    1. Tiếp nhận nhu cầu (icon: form/briefcase)
    2. Phân tích & khớp chuyên gia (icon: search/analytics)
    3. Kết nối & tư vấn ban đầu (icon: handshake/connect)
    4. Theo dõi & đánh giá (icon: chart/review)
  - Mỗi bước: số thứ tự + icon + tên bước + mô tả ngắn
- **Thành phần bên trong:**
  - Section header (label + heading + description)
  - Process Steps — 4 cards ngang (desktop), dạng list/accordion (mobile)
  - Connector lines giữa các bước (decorative)
- **Dữ liệu:** Động — CMS quản lý từng bước
- **CMS:** Có — CRUD, Sort Order, is_active
- **Tái sử dụng:** Timeline/Process component mới cho module này

---

## Section 4: Chuyên Gia Cao Cấp Của Viện IRDM

- **Tên:** Senior / Featured Experts
- **Mục đích:** Giới thiệu 3–6 chuyên gia nổi bật nhất, tạo uy tín
- **Nội dung:**
  - Section heading: "CHUYÊN GIA CAO CẤP CỦA VIỆN IRDM"
  - 3 Expert Cards (large format) sắp xếp ngang
  - Mỗi card:
    - Ảnh chân dung (hình tròn hoặc hình chữ nhật có bo góc)
    - Họ tên (heading)
    - Chức danh (GS.TS / PGS.TS / TS)
    - Đơn vị công tác
    - Lĩnh vực chuyên môn (2–3 tags/badges)
    - Mô tả ngắn (2–3 dòng)
    - Nút "Xem hồ sơ" → Expert Detail Page
  - Nút "Xem tất cả" cuối section
- **Thành phần bên trong:**
  - Section Header
  - Senior Expert Card (large) — component mới
  - CTA Button
- **Dữ liệu:** Động — is_featured = True + is_senior = True
- **CMS:** Có — CRUD, Publish/Draft, is_featured, Sort Order
- **Tái sử dụng:** Tái sử dụng Badge component cho tags; Button component

---

## Section 5: Bản Đồ Chuyên Môn Liên Ngành

- **Tên:** Interdisciplinary Expertise Map
- **Mục đích:** Hiển thị toàn cảnh các lĩnh vực nghiên cứu và chuyên môn của Viện — visual map
- **Nội dung:**
  - Section heading: "BẢN ĐỒ CHUYÊN MÔN LIÊN NGÀNH"
  - Description ngắn
  - Lưới (grid) các lĩnh vực nghiên cứu (Research Area tags/cards)
  - Mỗi lĩnh vực: icon + tên lĩnh vực + số lượng chuyên gia
  - Có thể có dạng radial/network diagram hoặc tag cloud hoặc grouped grid
  - Click vào lĩnh vực → lọc danh sách chuyên gia bên dưới hoặc trang category
- **Thành phần bên trong:**
  - Section Header
  - Research Area Card/Tag — danh sách dạng lưới
  - "Số chuyên gia" badge trên mỗi card
- **Dữ liệu:** Động — lấy từ bảng ResearchArea; count từ quan hệ Expert ↔ ResearchArea
- **CMS:** Có — CRUD ResearchArea (tên, icon, màu sắc, sort order)
- **Tái sử dụng:** Badge; Icon component

---

## Section 6: Tìm Nhà Khoa Học / Chuyên Gia

- **Tên:** Expert Search & Directory
- **Mục đích:** Cho phép người dùng tìm kiếm và lọc toàn bộ danh sách chuyên gia
- **Nội dung:**
  - Section heading: "TÌM NHÀ KHOA HỌC/CHUYÊN GIA"
  - Search Box: input text + nút tìm kiếm
  - Filter Tabs/Pills: lọc theo nhóm chuyên gia hoặc lĩnh vực (All, Nhà khoa học, Chuyên gia tư vấn, Giảng viên, v.v.)
  - Danh sách Expert Cards dạng lưới (grid 3–4 cột desktop)
  - Mỗi Expert Card (compact format):
    - Ảnh avatar (hình tròn)
    - Họ tên
    - Chức danh học thuật
    - Đơn vị / Trường đại học
    - 2–3 Research Area tags
    - Link hồ sơ
  - Pagination hoặc Load More (HTMX)
- **Thành phần bên trong:**
  - Search Box component
  - Filter Tabs component
  - Expert Card (compact) — component chính
  - Pagination / Load More (HTMX)
  - Empty State component (khi không có kết quả)
  - Loading State (HTMX)
- **Dữ liệu:** Động — query từ DB, filter + search realtime qua HTMX
- **CMS:** Không trực tiếp (data từ Expert model)
- **Tái sử dụng:** Search Box, Filter Tabs, Pagination từ component library; Expert Card mới

---

## Section 7: Các Chủ Đề Thông Tin Chuyên Môn

- **Tên:** Professional Knowledge Topics
- **Mục đích:** Nhóm chuyên gia theo chủ đề nghiên cứu, giúp người dùng khám phá theo topic
- **Nội dung:**
  - Section heading: "CÁC CHỦ ĐỀ THÔNG TIN CHUYÊN MÔN"
  - Description ngắn
  - Danh sách Accordion Items, mỗi item là 1 chủ đề:
    - Header accordion: tên chủ đề + số lượng chuyên gia
    - Body accordion (khi mở):
      - Danh sách chuyên gia thuộc chủ đề (compact cards ngang)
      - Mỗi expert: avatar + tên + chức danh + link
  - Có thể có 5–10 accordion items
  - Mặc định item đầu tiên mở
- **Thành phần bên trong:**
  - Section Header
  - Accordion component
  - Expert mini-card (ngang, compact)
- **Dữ liệu:** Động — lấy từ bảng KnowledgeTopic → Expert (M2M)
- **CMS:** Có — CRUD KnowledgeTopic (tên, icon, sort order)
- **Tái sử dụng:** Accordion component (reuse từ common); Expert mini-card mới

---

## Section 8: CTA Section — Bạn Đang Tìm Kiếm Chuyên Gia?

- **Tên:** Expert CTA Banner
- **Mục đích:** Call-to-action cuối trang, chuyển đổi người xem thành lead
- **Nội dung:**
  - Background: màu xanh đậm hoặc ảnh nền với overlay
  - Eyebrow: nhỏ uppercase
  - Heading: "BẠN ĐANG TÌM KIẾM CHUYÊN GIA?" hoặc "ĐĂNG KÝ THAM GIA MẠNG LƯỚI CHUYÊN GIA"
  - Description: 1–2 câu
  - 2 Buttons: Primary "Liên hệ ngay" + Secondary "Đăng ký chuyên gia"
- **Thành phần bên trong:**
  - CTA Section component (reuse pattern từ Capability/Solution)
  - 2 Buttons
- **Dữ liệu:** Động — CMS quản lý heading, description, button labels & URLs, background image
- **CMS:** Có — CRUD, is_active
- **Tái sử dụng:** ✓ CTA Section pattern đã có trong design system

---

## Section 9: Global Footer

- **Tên:** Global Footer
- **Mục đích:** Navigation phụ, thông tin liên hệ, social links — nhất quán toàn site
- **Thành phần:** `templates/includes/footer.html`
- **Dữ liệu:** Tĩnh/CMS
- **Tái sử dụng:** ✓ `includes/footer.html` — dùng chung toàn site

---

# 3. Component Analysis

## 3.1 Reusable Components (Tái sử dụng từ hệ thống hiện có)

| Component | Vị trí hiện tại | Dùng trong Expert |
|-----------|----------------|-------------------|
| Global Header | `templates/includes/header.html` | Section 1 |
| Global Footer | `templates/includes/footer.html` | Section 9 |
| Badge / Tag | Design System | Sections 4, 5, 6 |
| Button (Primary / Secondary) | Design System | Sections 2, 4, 8 |
| Search Box | Component Library | Section 6 |
| Pagination | Component Library | Section 6 |
| Accordion | Component Library | Section 7 |
| Empty State | Component Library | Section 6 |
| Loading State (HTMX) | Component Library | Section 6 |
| Breadcrumb | Component Library | Page header |

## 3.2 New Components (Tạo mới cho module Expert)

| Component | Mục đích | Section |
|-----------|---------|---------|
| `expert_hero_banner` | Hero banner với background image + overlay + 2 buttons | 2 |
| `expert_process_step` | Card bước quy trình kết nối (số + icon + title + desc) | 3 |
| `expert_card_senior` | Expert card format lớn (cho Senior/Featured experts) | 4 |
| `expert_card_compact` | Expert card format nhỏ (cho Search Directory grid) | 6 |
| `expert_card_mini` | Expert card ngang siêu nhỏ (cho Accordion body) | 7 |
| `research_area_card` | Card lĩnh vực nghiên cứu (icon + tên + count) | 5 |
| `filter_tabs` | Tab/pill filter cho Search Directory | 6 |
| `expert_cta_banner` | CTA banner cuối trang | 8 |

---

# 4. CMS Mapping

## 4.1 ExpertListingPage (CMS trang listing)

| Trường | Kiểu | CRUD | Publish/Draft | Sort | Featured |
|--------|------|:----:|:-------------:|:----:|:--------:|
| Hero heading | CharField | ✓ | ✗ | ✗ | ✗ |
| Hero description | TextField | ✓ | ✗ | ✗ | ✗ |
| Hero background image | ImageField | ✓ | ✗ | ✗ | ✗ |
| Hero button 1 label & URL | CharField | ✓ | ✗ | ✗ | ✗ |
| Hero button 2 label & URL | CharField | ✓ | ✗ | ✗ | ✗ |
| Process section heading | CharField | ✓ | ✗ | ✗ | ✗ |
| Process section description | TextField | ✓ | ✗ | ✗ | ✗ |
| CTA heading | CharField | ✓ | ✗ | ✗ | ✗ |
| CTA description | TextField | ✓ | ✗ | ✗ | ✗ |
| CTA background image | ImageField | ✓ | ✗ | ✗ | ✗ |
| CTA button 1 label & URL | CharField | ✓ | ✗ | ✗ | ✗ |
| CTA button 2 label & URL | CharField | ✓ | ✗ | ✗ | ✗ |

## 4.2 Expert (Chuyên gia)

| Trường | Kiểu | CRUD | Publish/Draft | Sort | Featured |
|--------|------|:----:|:-------------:|:----:|:--------:|
| Họ tên | CharField | ✓ | ✓ | ✓ | ✓ |
| Chức danh học thuật | CharField | ✓ | ✓ | ✓ | ✓ |
| Đơn vị công tác | CharField | ✓ | ✓ | ✓ | ✓ |
| Ảnh đại diện | ImageField | ✓ | ✓ | ✓ | ✓ |
| Mô tả ngắn | TextField | ✓ | ✓ | ✓ | ✓ |
| Tiểu sử chi tiết | RichTextField | ✓ | ✓ | ✓ | ✓ |
| Email | EmailField | ✓ | ✓ | ✓ | ✓ |
| is_senior | BooleanField | ✓ | ✓ | ✗ | ✓ |
| slug | SlugField | ✓ | ✓ | ✗ | ✗ |
| Research Areas (M2M) | M2M | ✓ | ✓ | ✗ | ✗ |
| Expert Group | FK | ✓ | ✓ | ✗ | ✗ |
| Knowledge Topics (M2M) | M2M | ✓ | ✓ | ✗ | ✗ |

## 4.3 ExpertGroup (Nhóm chuyên gia)

| Trường | Kiểu | CRUD | Publish/Draft | Sort | Featured |
|--------|------|:----:|:-------------:|:----:|:--------:|
| Tên nhóm | CharField | ✓ | ✓ | ✓ | ✗ |
| Slug | SlugField | ✓ | ✓ | ✗ | ✗ |
| Mô tả | TextField | ✓ | ✓ | ✗ | ✗ |

## 4.4 ResearchArea (Lĩnh vực nghiên cứu)

| Trường | Kiểu | CRUD | Publish/Draft | Sort | Featured |
|--------|------|:----:|:-------------:|:----:|:--------:|
| Tên lĩnh vực | CharField | ✓ | ✓ | ✓ | ✗ |
| Slug | SlugField | ✓ | ✓ | ✗ | ✗ |
| Icon (emoji/svg name) | CharField | ✓ | ✓ | ✓ | ✗ |
| Màu sắc (hex) | CharField | ✓ | ✓ | ✗ | ✗ |

## 4.5 ProcessStep (Bước quy trình kết nối)

| Trường | Kiểu | CRUD | Publish/Draft | Sort | Featured |
|--------|------|:----:|:-------------:|:----:|:--------:|
| Số thứ tự | PositiveIntegerField | ✓ | ✓ | ✓ | ✗ |
| Tiêu đề bước | CharField | ✓ | ✓ | ✓ | ✗ |
| Mô tả | TextField | ✓ | ✓ | ✓ | ✗ |
| Icon | CharField | ✓ | ✓ | ✗ | ✗ |

## 4.6 KnowledgeTopic (Chủ đề chuyên môn)

| Trường | Kiểu | CRUD | Publish/Draft | Sort | Featured |
|--------|------|:----:|:-------------:|:----:|:--------:|
| Tên chủ đề | CharField | ✓ | ✓ | ✓ | ✗ |
| Slug | SlugField | ✓ | ✓ | ✗ | ✗ |
| Mô tả | TextField | ✓ | ✓ | ✗ | ✗ |
| Experts (M2M) | M2M | ✓ | ✓ | ✗ | ✗ |

---

# 5. Database Mapping

## Entity List

Các Entity cần có cho module Expert:

```
Expert
    ├── Họ tên, chức danh, đơn vị, email
    ├── Ảnh đại diện, mô tả, tiểu sử
    ├── is_active, is_featured, is_senior, display_order
    ├── slug
    └── FK: ExpertGroup
        M2M: ResearchArea, KnowledgeTopic

ExpertGroup
    ├── Tên nhóm, slug, mô tả
    └── is_active, display_order

ResearchArea
    ├── Tên lĩnh vực, slug, icon, màu sắc
    └── is_active, display_order

ProcessStep
    ├── step_number, title, description, icon
    └── is_active, display_order
    └── FK: ExpertListingPage

KnowledgeTopic
    ├── Tên chủ đề, slug, mô tả
    ├── is_active, display_order
    └── M2M: Expert

ExpertListingPage (Singleton CMS)
    ├── Hero: heading, description, bg_image, btn1_label, btn1_url, btn2_label, btn2_url
    ├── Process: heading, description
    └── CTA: heading, description, bg_image, btn1_label, btn1_url, btn2_label, btn2_url

ExpertSEO
    ├── meta_title, meta_description
    └── og_image
```

## Ghi chú kế thừa

Tất cả model kế thừa `BaseModel` từ `apps.common.models`:
- `id` = UUIDField (primary key)
- `is_active` = BooleanField
- `display_order` = PositiveIntegerField
- `created_at`, `updated_at` = DateTimeField

---

# 6. Routing

## URL Patterns

```python
# apps/expert/urls.py — app_name = "expert"

urlpatterns = [
    path("", ExpertListingView.as_view(), name="listing"),           # /chuyen-gia/
    path("<slug:slug>/", ExpertDetailView.as_view(), name="detail"), # /chuyen-gia/<slug>/
    path("nhom/<slug:slug>/", ExpertGroupView.as_view(), name="group"),   # /chuyen-gia/nhom/<slug>/
    path("linh-vuc/<slug:slug>/", ResearchAreaView.as_view(), name="area"),# /chuyen-gia/linh-vuc/<slug>/
    path("tim-kiem/", ExpertSearchView.as_view(), name="search"),    # HTMX search endpoint
]
```

## URL trên website

| URL | Trang | Ghi chú |
|-----|-------|---------|
| `/chuyen-gia/` | Expert Listing | Trang chính |
| `/chuyen-gia/<slug>/` | Expert Detail | Sprint sau |
| `/chuyen-gia/nhom/<slug>/` | Nhóm chuyên gia | Category filter |
| `/chuyen-gia/linh-vuc/<slug>/` | Lĩnh vực | Research area filter |
| `/chuyen-gia/tim-kiem/` | HTMX search | Partial template |

## config/urls.py

```python
path("chuyen-gia/", include("apps.expert.urls", namespace="expert")),
```

---

# 7. Responsive

## 7.1 Desktop (≥1280px)

- Hero Banner: full-width, heading font lớn (~48px), 2 buttons cạnh nhau
- Section "Kết nối": 4 bước hiển thị ngang, 1 hàng
- Senior Experts: 3 cards ngang, tỷ lệ đều nhau
- Research Area Map: grid 4–5 cột
- Expert Directory: grid 4 cột, compact cards
- Accordion: full-width, nội dung mở rộng hiển thị các mini-cards ngang

## 7.2 Laptop (1024px–1279px)

- Tương tự desktop nhưng giảm padding/margin
- Expert Directory: grid 3 cột
- Research Area Map: grid 3–4 cột

## 7.3 Tablet (768px–1023px)

- Hero Banner: heading nhỏ hơn (~36px), stack buttons theo hàng ngang
- Section "Kết nối": 2 bước mỗi hàng (2×2 grid)
- Senior Experts: 2 cards mỗi hàng, hoặc carousel với dots
- Research Area Map: grid 2–3 cột
- Expert Directory: grid 2 cột
- Accordion: full-width, mini-cards xếp dọc

## 7.4 Mobile (<768px)

- Hero Banner: heading nhỏ (~28px), stack buttons dọc hoặc ngang vừa screen
- Section "Kết nối": 1 bước mỗi hàng (list dọc)
- Senior Experts: 1 card mỗi hàng (vertical scroll), hoặc horizontal scroll
- Research Area Map: grid 2 cột, tags nhỏ
- Expert Directory: grid 1–2 cột, compact cards giảm padding
- Accordion: full-width, text nhỏ hơn

---

# 8. Animation

## 8.1 Page Load

- **Fade In + Slide Up:** Hero heading và description fade in khi trang load (CSS animation `animate-fade-in-up`)
- **Stagger Fade In:** Các Expert Cards fade in lần lượt theo thứ tự (delay 100ms mỗi card)

## 8.2 Hero Banner

- **Overlay Gradient:** Subtle gradient animation hoặc parallax nhẹ trên background image (optional)
- **CTA Buttons:** Hover state với `transition-all duration-300`

## 8.3 Process Steps

- **Scroll Trigger:** Các bước fade in từ trái/phải khi scroll vào viewport (`IntersectionObserver`)
- **Connector Line:** Animated line draw giữa các bước (optional, decorative)

## 8.4 Expert Cards

- **Card Hover:** `transform: translateY(-4px)` + `box-shadow` tăng → tạo hiệu ứng nổi
- **Image Zoom:** Avatar scale nhẹ `scale-105` khi hover
- **Transition:** `transition-all duration-200 ease-in-out`

## 8.5 Research Area Map

- **Tag Hover:** Background color change + scale nhẹ khi hover
- **Click → Filter:** HTMX swap với fade transition

## 8.6 Expert Search (HTMX)

- **Search Loading:** Spinner hoặc skeleton loader khi HTMX đang fetch
- **Result Swap:** `hx-swap="innerHTML transition:true"` để fade kết quả mới
- **Filter Tab Switch:** Active tab highlight với transition màu

## 8.7 Accordion

- **Open/Close:** `max-height` transition với `overflow-hidden` (CSS transition, không cần JS)
- **Icon Rotation:** Arrow/chevron icon xoay 180° khi mở

## 8.8 CTA Banner

- **Entrance:** Fade in khi scroll vào viewport
- **Button Hover:** Background color change + subtle scale

---

# 9. SEO

## 9.1 Expert Listing Page

```
Meta Title:    "Đội Ngũ Chuyên Gia Liên Ngành | Viện IRDM"
Meta Desc:     "Khám phá mạng lưới hơn [N] nhà khoa học và chuyên gia liên ngành của Viện IRDM. Tìm chuyên gia phù hợp theo lĩnh vực nghiên cứu."
Canonical:     /chuyen-gia/
OG Title:      "Đội Ngũ Chuyên Gia | Viện IRDM"
OG Description: (= Meta Description)
OG Image:      Hero banner image
OG Type:       website
```

## 9.2 Breadcrumb

```
Trang chủ > Chuyên gia
```

Render breadcrumb với `<nav aria-label="breadcrumb">` + JSON-LD BreadcrumbList.

## 9.3 Structured Data (JSON-LD)

### ItemList cho trang Listing

```json
{
  "@context": "https://schema.org",
  "@type": "ItemList",
  "name": "Đội ngũ chuyên gia Viện IRDM",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "item": {
        "@type": "Person",
        "name": "[Tên chuyên gia]",
        "jobTitle": "[Chức danh]",
        "worksFor": { "@type": "Organization", "name": "[Đơn vị]" },
        "url": "/chuyen-gia/[slug]/"
      }
    }
  ]
}
```

### Person Schema (cho mỗi Expert Card)

```json
{
  "@context": "https://schema.org",
  "@type": "Person",
  "name": "[Họ tên]",
  "jobTitle": "[Chức danh]",
  "affiliation": { "@type": "Organization", "name": "[Đơn vị công tác]" },
  "knowsAbout": ["[Lĩnh vực 1]", "[Lĩnh vực 2]"],
  "image": "[URL ảnh]",
  "url": "[URL hồ sơ]"
}
```

## 9.4 Hreflang (đa ngôn ngữ)

```html
<link rel="alternate" hreflang="vi" href="/chuyen-gia/" />
<link rel="alternate" hreflang="en" href="/en/experts/" />
```

---

# 10. Performance

## 10.1 Image Optimization

- Avatar chuyên gia: resize về tối đa `400×400px` trước khi lưu (dùng Pillow)
- Hero background: `1440×600px` max, nén webp/jpeg progressive
- Dùng thuộc tính `loading="lazy"` cho tất cả ảnh dưới fold
- Hero image: `loading="eager"` (above fold)
- Dùng `srcset` và `sizes` cho responsive images

## 10.2 Lazy Loading

- Expert Cards dưới fold: `loading="lazy"` trên thẻ `<img>`
- Research Area icons: lazy load nếu là SVG/image
- Accordion body: render sẵn HTML nhưng ẩn bằng CSS — không cần lazy load JS

## 10.3 HTMX

- Search Box: `hx-get="/chuyen-gia/tim-kiem/"` trigger `keyup changed delay:300ms`
- Filter Tabs: `hx-get="/chuyen-gia/tim-kiem/?group=..."` trigger `click`
- Load More / Pagination: `hx-get` với page param, `hx-swap="beforeend"` để append cards
- Target: `#expert-grid` container
- Hiển thị loading indicator: `hx-indicator="#search-spinner"`

## 10.4 Pagination

- Mặc định: 12 experts per page (3×4 grid desktop)
- HTMX append mode: nút "Tải thêm" thay vì pagination số
- URL param: `?page=2&group=...&q=...`

## 10.5 Database Query Optimization

- `select_related("group")` khi query Expert list
- `prefetch_related("research_areas", "knowledge_topics")` khi cần M2M
- Index trên: `is_active`, `is_featured`, `is_senior`, `display_order`
- Cache view Expert Listing (không search) 5 phút với Django cache framework

## 10.6 Template Rendering

- Senior Experts section: max 6 experts, không cần pagination
- Research Area Map: tất cả, annotate count(`experts`) từ DB
- Knowledge Topics accordion: limit 10 topics, mỗi topic limit 8 experts

---

# 11. Accessibility

## 11.1 Hình ảnh

- Tất cả `<img>` phải có `alt` text có nghĩa
- Avatar chuyên gia: `alt="Ảnh chân dung [Họ tên]"`
- Background image decorative: `aria-hidden="true"` hoặc dùng CSS `background-image`
- Icon decorative: `aria-hidden="true"`

## 11.2 ARIA

- Search Box: `role="search"`, `aria-label="Tìm kiếm chuyên gia"`
- Filter Tabs: `role="tablist"`, `role="tab"`, `aria-selected`, `aria-controls`
- Accordion: `aria-expanded`, `aria-controls`, `aria-labelledby` trên button/panel
- Live region cho HTMX results: `aria-live="polite"` trên `#expert-grid`
- Pagination: `aria-label="Tải thêm chuyên gia"` trên nút

## 11.3 Heading Structure

```
<h1> — Heading trang (Hero): "Mang lưới nhà khoa học & chuyên gia liên ngành"
  <h2> — Mỗi section heading (Kết nối, Senior, Bản đồ, Tìm kiếm, Chủ đề, CTA)
    <h3> — Tên từng Expert trong cards
    <h3> — Tên từng bước trong Process
    <h3> — Tên lĩnh vực nghiên cứu
    <h3> — Tên chủ đề trong Accordion
```

## 11.4 Keyboard Navigation

- Expert Cards: `tabindex="0"`, Enter/Space để activate link
- Filter Tabs: Arrow keys để chuyển tab theo ARIA tab pattern
- Accordion: Enter/Space để toggle, Arrow keys để di chuyển giữa items
- Search Box: Tab đến kết quả sau khi search (focus management)

## 11.5 Focus State

- Tất cả interactive elements có `focus-visible` ring rõ ràng
- Dùng Tailwind `focus:ring-2 focus:ring-primary-500 focus:outline-none`
- Không dùng `outline: none` mà không cung cấp alternative focus indicator

## 11.6 Color Contrast

- Text trên background trắng: tối thiểu 4.5:1 (WCAG AA)
- Text trên Hero overlay: đảm bảo overlay đủ đậm để text trắng đạt contrast ratio
- Badge/tag text: kiểm tra contrast với màu background của badge
- Filter tab active state: đủ contrast giữa active và inactive

---

# 12. Coding Rules

## 12.1 Kiến trúc

Module Expert phải tuân thủ kiến trúc layer của dự án:

```
apps/expert/
    ├── models.py        — Domain models, kế thừa BaseModel
    ├── admin.py         — Django Admin với search, filter, list_display
    ├── views.py         — Class-Based Views (ListView, DetailView)
    ├── services.py      — Business logic, DB queries
    ├── urls.py          — URL patterns
    ├── forms.py         — Django forms (search/filter)
    ├── migrations/      — Django migrations
    └── templates/
        └── expert/
            ├── listing.html           — Trang chính
            ├── detail.html            — Chi tiết (sprint sau)
            ├── _expert_card_senior.html   — Senior card partial
            ├── _expert_card_compact.html  — Compact card partial
            ├── _expert_card_mini.html     — Mini card partial
            ├── _research_area_card.html   — Research area card
            ├── _process_step.html         — Process step card
            ├── _expert_grid.html          — HTMX target: search results
            └── _accordion_topic.html      — Knowledge topic accordion
```

## 12.2 Naming Convention

- Files: `snake_case`
- Python classes: `PascalCase`
- Python functions/variables: `snake_case`
- Template partials: prefix `_` (underscore)
- URL names: `expert:listing`, `expert:detail`, `expert:search`
- CSS: Tailwind classes only, không viết custom CSS trừ khi cần thiết
- JavaScript: vanilla JS tối thiểu, ưu tiên HTMX và CSS

## 12.3 Data Rendering

- **Tuyệt đối không hardcode** dữ liệu (tên, ảnh, text) trong template
- Mọi dữ liệu phải render từ context variables lấy từ DB
- Seed data dùng Django management command hoặc fixtures

## 12.4 Component Reuse

- **Không duplicate** HTML/CSS giữa `_expert_card_senior.html` và các card khác
- Senior card extend/include compact card nếu có thể
- Badge component: dùng chung `{% include "components/badge.html" with label=area.name %}`

## 12.5 Services Layer

- Tất cả DB query đặt trong `services.py`, không query trực tiếp trong view
- Views chỉ gọi service functions và truyền data vào context

## 12.6 Security

- User input (search query): sanitize với Django ORM parameterized queries
- Không dùng raw SQL trừ khi thật sự cần
- Validate form input với Django forms

---

# 13. Acceptance Criteria

## Checklist hoàn thành

### Giao diện

- [ ] ✓ Pixel-perfect theo Figma `DoiNguChuyenGia.png`
- [ ] ✓ Hero Banner render đúng heading, description, ảnh nền, 2 buttons
- [ ] ✓ Section "Kết nối" render đúng 4 bước với icon và description
- [ ] ✓ Senior Experts section render đúng 3–6 cards với ảnh, tên, chức danh, tags
- [ ] ✓ Research Area Map hiển thị tất cả lĩnh vực với count chuyên gia
- [ ] ✓ Expert Directory search và filter hoạt động qua HTMX
- [ ] ✓ Accordion "Chủ đề chuyên môn" toggle đúng với expert lists
- [ ] ✓ CTA Section render đúng heading, description, 2 buttons

### Responsive

- [ ] ✓ Desktop (1280px+): layout đúng như Figma
- [ ] ✓ Laptop (1024px): layout điều chỉnh phù hợp
- [ ] ✓ Tablet (768px): responsive layout
- [ ] ✓ Mobile (<768px): single column, readable

### CMS & Data

- [ ] ✓ Admin Django có CRUD đầy đủ cho Expert, ExpertGroup, ResearchArea, ProcessStep, KnowledgeTopic
- [ ] ✓ ExpertListingPage singleton CMS cho Hero, Process heading, CTA
- [ ] ✓ is_active/Publish/Draft hoạt động — inactive records không hiển thị
- [ ] ✓ is_featured, is_senior filter đúng ở Senior Experts section
- [ ] ✓ Sort Order (display_order) hoạt động đúng

### Dynamic Data

- [ ] ✓ Không có bất kỳ dữ liệu hardcode nào trong template
- [ ] ✓ Tất cả Expert Cards render từ DB
- [ ] ✓ Seed data đủ để giao diện khớp Figma

### Search & Filter

- [ ] ✓ Search Box HTMX filter theo tên, chức danh, đơn vị, lĩnh vực
- [ ] ✓ Filter Tabs HTMX filter theo ExpertGroup
- [ ] ✓ Empty State hiển thị khi không có kết quả
- [ ] ✓ Loading State hiển thị trong khi HTMX đang fetch

### SEO

- [ ] ✓ `<title>` đúng format "Đội Ngũ Chuyên Gia | Viện IRDM"
- [ ] ✓ Meta description có nội dung từ CMS hoặc default
- [ ] ✓ Open Graph tags đầy đủ (title, description, image, type)
- [ ] ✓ Breadcrumb render HTML và JSON-LD BreadcrumbList
- [ ] ✓ JSON-LD ItemList cho Expert Listing
- [ ] ✓ Canonical tag đúng URL
- [ ] ✓ Hreflang cho vi/en

### Accessibility

- [ ] ✓ Tất cả ảnh có alt text có nghĩa
- [ ] ✓ Heading hierarchy đúng (h1 → h2 → h3)
- [ ] ✓ Accordion có ARIA attributes (aria-expanded, aria-controls)
- [ ] ✓ Search có role="search" và aria-label
- [ ] ✓ Filter Tabs có role="tablist" và aria-selected
- [ ] ✓ Focus state visible trên tất cả interactive elements
- [ ] ✓ Keyboard navigable (Tab, Enter, Arrow keys)

### Performance

- [ ] ✓ Ảnh dưới fold có `loading="lazy"`
- [ ] ✓ HTMX search có debounce 300ms
- [ ] ✓ DB queries có select_related / prefetch_related
- [ ] ✓ Expert listing view được cache

### Code Quality

- [ ] ✓ Không duplicate HTML/CSS
- [ ] ✓ Services layer tách biệt khỏi Views
- [ ] ✓ Tuân thủ naming convention của dự án
- [ ] ✓ Migrations đúng và không phá vỡ DB hiện có

---

# 14. Seed Data Requirement

Dữ liệu mẫu để render giao diện đầy đủ sau khi implement.

## 14.1 ExpertListingPage (1 bản ghi singleton)

```
hero_heading:      "MANG LƯỚI NHÀ KHOA HỌC & CHUYÊN GIA LIÊN NGÀNH"
hero_description:  "Viện IRDM quy tụ đội ngũ hơn 200 nhà khoa học và chuyên gia đầu ngành, kết nối tri thức liên ngành để giải quyết những thách thức phức tạp của xã hội và doanh nghiệp."
hero_btn1_label:   "TÌM HIỂU THÊM"
hero_btn1_url:     "#ket-noi-chuyen-gia"
hero_btn2_label:   "ĐĂNG KÝ CHUYÊN GIA"
hero_btn2_url:     "/lien-he/"
process_heading:   "VIỆN IRDM KẾT NỐI CHUYÊN GIA NHƯ THẾ NÀO?"
process_desc:      "Quy trình 4 bước đơn giản, minh bạch để kết nối bạn với chuyên gia phù hợp nhất."
cta_heading:       "BẠN ĐANG TÌM KIẾM CHUYÊN GIA?"
cta_description:   "Liên hệ với Viện IRDM để được tư vấn và kết nối với chuyên gia phù hợp với nhu cầu của bạn."
cta_btn1_label:    "LIÊN HỆ NGAY"
cta_btn1_url:      "/lien-he/"
cta_btn2_label:    "ĐĂNG KÝ CHUYÊN GIA"
cta_btn2_url:      "/lien-he/?type=expert"
```

## 14.2 ExpertGroup (5 nhóm)

```
1. Nhà khoa học & Nghiên cứu viên   | slug: nha-khoa-hoc
2. Chuyên gia tư vấn doanh nghiệp   | slug: tu-van-doanh-nghiep
3. Giảng viên & Học giả             | slug: giang-vien
4. Chuyên gia chính sách            | slug: chuyen-gia-chinh-sach
5. Chuyên gia quốc tế               | slug: chuyen-gia-quoc-te
```

## 14.3 ResearchArea (8 lĩnh vực)

```
1. Kinh tế học liên ngành      | icon: chart-bar
2. Quản trị & Lãnh đạo         | icon: briefcase
3. Khoa học dữ liệu & AI       | icon: cpu
4. Chính sách công & Quản lý nhà nước | icon: building-library
5. Phát triển bền vững         | icon: leaf
6. Giáo dục & Đào tạo          | icon: academic-cap
7. Y tế & Sức khỏe cộng đồng   | icon: heart
8. Công nghệ & Đổi mới sáng tạo | icon: light-bulb
```

## 14.4 ProcessStep (4 bước)

```
1. Tiếp nhận nhu cầu
   icon: document-text
   desc: "Bạn gửi yêu cầu tư vấn, mô tả vấn đề cần giải quyết và lĩnh vực cần chuyên gia."

2. Phân tích & Khớp chuyên gia
   icon: magnifying-glass
   desc: "Đội ngũ IRDM phân tích nhu cầu và tìm kiếm chuyên gia phù hợp nhất từ mạng lưới."

3. Kết nối & Tư vấn ban đầu
   icon: user-group
   desc: "Chúng tôi kết nối bạn với chuyên gia, tổ chức buổi tư vấn khám phá ban đầu."

4. Theo dõi & Đánh giá
   icon: chart-bar-square
   desc: "IRDM theo dõi chất lượng hợp tác và thu thập phản hồi để cải thiện liên tục."
```

## 14.5 KnowledgeTopic (6 chủ đề)

```
1. Chuyển đổi số và đổi mới sáng tạo
2. Phát triển kinh tế bền vững
3. Quản trị tổ chức & Lãnh đạo chiến lược
4. Giáo dục & Phát triển nhân lực
5. Chính sách công & Thể chế
6. Sức khỏe cộng đồng & Y tế
```

## 14.6 Expert (20–30 chuyên gia mẫu)

### Senior/Featured Experts (3 chuyên gia is_senior=True, is_featured=True)

```
1. GS.TS. Nguyễn Văn An
   Chức danh: Giáo sư Kinh tế học
   Đơn vị: Đại học Kinh tế Quốc dân
   Group: Nhà khoa học & Nghiên cứu viên
   Research Areas: Kinh tế học liên ngành, Phát triển bền vững
   Desc: Chuyên gia hàng đầu về kinh tế phát triển với hơn 25 năm kinh nghiệm nghiên cứu và tư vấn chính sách.
   is_senior: True | is_featured: True | display_order: 1

2. PGS.TS. Trần Thị Bình
   Chức danh: Phó Giáo sư Quản trị Kinh doanh
   Đơn vị: Đại học Ngoại thương
   Group: Giảng viên & Học giả
   Research Areas: Quản trị & Lãnh đạo, Công nghệ & Đổi mới sáng tạo
   Desc: Chuyên gia về quản trị doanh nghiệp và chuyển đổi số với nhiều công trình nghiên cứu được quốc tế công nhận.
   is_senior: True | is_featured: True | display_order: 2

3. TS. Lê Minh Châu
   Chức danh: Tiến sĩ Khoa học Dữ liệu
   Đơn vị: Đại học Bách khoa Hà Nội
   Group: Nhà khoa học & Nghiên cứu viên
   Research Areas: Khoa học dữ liệu & AI, Công nghệ & Đổi mới sáng tạo
   Desc: Chuyên gia AI và phân tích dữ liệu lớn, từng làm việc tại các tổ chức nghiên cứu quốc tế tại Mỹ và châu Âu.
   is_senior: True | is_featured: True | display_order: 3
```

### Regular Experts (17–27 chuyên gia thêm, đa dạng nhóm và lĩnh vực)

Mỗi chuyên gia cần có:

- Họ tên đầy đủ (có học hàm học vị)
- Chức danh
- Đơn vị công tác (trường đại học hoặc tổ chức uy tín)
- ExpertGroup (phân bổ đều 5 nhóm)
- 1–3 ResearchArea
- 1–3 KnowledgeTopic
- Mô tả ngắn 1–2 câu
- is_active = True
- is_featured = False (trừ 3 senior đã liệt kê)
- Ảnh đại diện placeholder (có thể dùng `media/experts/placeholder_avatar.png`)

---

# 15. Đối chiếu Figma

Sau khi implement, đối chiếu từng section với Figma:

| Section | Figma Location | Checklist |
|---------|---------------|-----------|
| Hero Banner | Top of page | [ ] heading, [ ] description, [ ] image, [ ] 2 buttons |
| Process (How We Connect) | Below Hero | [ ] 4 steps, [ ] icons, [ ] descriptions |
| Senior Experts | Middle | [ ] 3 cards, [ ] photo, [ ] title, [ ] tags |
| Research Area Map | Below Senior | [ ] all areas, [ ] count badges |
| Expert Directory | Large grid | [ ] search, [ ] filter tabs, [ ] cards grid |
| Knowledge Topics | Accordion | [ ] 6+ topics, [ ] expert lists |
| CTA Banner | Near footer | [ ] heading, [ ] 2 buttons |
| Footer | Bottom | [ ] matches global footer |

---

*Tài liệu này được tạo từ phân tích Figma `figmapng/experts/DoiNguChuyenGia.png` ngày 2026-07-27.*  
*Implement theo đúng coding conventions của dự án IRDM tại `docs/02_architecture/` và `docs/04_design_system/`.*
