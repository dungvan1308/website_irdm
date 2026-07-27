# NHIỆM VỤ

Phân tích file thiết kế Figma sau:

figmapng/experts/DoiNguChuyenGia.png

Đây là thiết kế chính thức của module **Đội ngũ chuyên gia (Experts)** của website IRDM.

Không viết bất kỳ dòng code nào.

Không tạo Model.

Không tạo HTML.

Không tạo CSS.

Không tạo JavaScript.

Chỉ tạo tài liệu đặc tả phục vụ cho bước implement.

---

# OUTPUT

Tạo file:

docs/modules/experts/experts_specification.md

Đây sẽ là tài liệu DUY NHẤT dùng để implement toàn bộ module Experts.

Nội dung phải đầy đủ để Copilot có thể đọc file này và xây dựng toàn bộ module mà không cần đọc thêm tài liệu khác.

---

# Nội dung tài liệu

## 1. Business Overview

- Mục tiêu của module
- Vai trò trên website
- Đối tượng người dùng
- User Journey

---

## 2. UI Layout Analysis

Phân tích toàn bộ Figma theo thứ tự từ trên xuống dưới.

Đối với từng Section cần mô tả:

- Tên Section
- Mục đích
- Nội dung
- Thành phần bên trong
- Dữ liệu động hay tĩnh
- Có cần CMS không
- Có tái sử dụng component nào không

Không được bỏ sót bất kỳ Section nào trong Figma.

---

## 3. Component Analysis

Liệt kê toàn bộ Component.

Ví dụ:

- Hero Banner
- Timeline
- Expert Card
- Advisor Card
- Research Card
- Accordion
- CTA
- Filter
- Search Box
- Badge
- Button
- Pagination
- Breadcrumb

Đánh dấu:

- Reusable Component
- New Component

---

## 4. CMS Mapping

Đối với từng Section mô tả:

- Dữ liệu lấy từ đâu
- Có CRUD không
- Có Publish/Draft không
- Có Sort Order không
- Có Featured không

Không thiết kế Model.

---

## 5. Database Mapping

Chỉ liệt kê các Entity cần có.

Ví dụ:

- Expert
- Expert Group
- Research Area
- Publication
- Award
- Experience
- Education
- Timeline
- FAQ
- Banner
- CTA
- SEO

Không thiết kế Model chi tiết.

---

## 6. Routing

Liệt kê toàn bộ URL cần có.

Ví dụ:

- /experts/
- /experts/<slug>/
- /experts/group/<slug>/
- /experts/category/<slug>/

---

## 7. Responsive

Mô tả cách hiển thị cho:

- Desktop
- Laptop
- Tablet
- Mobile

Không viết CSS.

---

## 8. Animation

Đề xuất animation phù hợp.

Ví dụ:

- Fade In
- Hover
- Accordion
- Card Hover
- Image Zoom

Không viết code.

---

## 9. SEO

Bao gồm:

- Meta Title
- Meta Description
- Open Graph
- Breadcrumb
- Canonical
- Structured Data
- Schema.org Person

---

## 10. Performance

Đề xuất:

- Lazy Loading
- Responsive Image
- HTMX
- Pagination
- Image Optimization
- Cache

---

## 11. Accessibility

Bao gồm:

- Alt Image
- ARIA
- Heading Structure
- Keyboard Navigation
- Focus State
- Contrast

---

## 12. Coding Rules

Module phải tuân thủ kiến trúc hiện tại của dự án.

Không được:

- Hardcode dữ liệu
- Duplicate Component
- Duplicate HTML
- Duplicate CSS

Ưu tiên tái sử dụng component hiện có.

Render dữ liệu hoàn toàn từ Database.

---

## 13. Acceptance Criteria

Liệt kê checklist hoàn thành.

Ví dụ:

✓ Pixel-perfect theo Figma

✓ Responsive

✓ CMS đầy đủ

✓ Dynamic Data

✓ SEO

✓ Accessibility

✓ Performance

✓ Không hardcode

✓ Reuse component

✓ Theo đúng Coding Convention của dự án

---

Sau khi hoàn thành, hãy tự đối chiếu lại với Figma để đảm bảo không bỏ sót bất kỳ Section hoặc Component nào.
## 14. Seed Data Requirement

Module Experts cần chuẩn bị dữ liệu mẫu để sau khi implement có thể hiển thị đầy đủ giao diện theo Figma.

Đối với từng Section, mô tả dữ liệu cần seed:

### Hero Banner
- 01 Banner
- Tiêu đề
- Mô tả
- Background Image

### Expert Categories
- Khoảng 4–6 nhóm chuyên gia

### Featured Experts
- Khoảng 6–8 chuyên gia nổi bật

Mỗi chuyên gia gồm:
- Họ tên
- Chức danh
- Đơn vị
- Ảnh đại diện
- Lĩnh vực nghiên cứu
- Mô tả ngắn
- Liên kết hồ sơ

### Advisory Board
- Khoảng 4–6 thành viên

### Timeline
- 4–8 mốc thời gian

### FAQ (nếu có)
- 5–10 câu hỏi

### CTA
- 01 CTA

Toàn bộ dữ liệu mẫu phải đủ để render giao diện giống Figma.