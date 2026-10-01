Rà soát và tối ưu **toàn bộ website IRDM** để hiển thị responsive, đẹp và chuyên nghiệp trên **Mobile / Tablet / Desktop**, đặc biệt ưu tiên Mobile.

Yêu cầu:

1. Rà soát toàn bộ Django Templates, Tailwind CSS, HTMX components và các shared components.
2. Kiểm tra các breakpoint: **320, 360, 375, 390, 414, 768, 1024, 1280, 1440, 1920px**.
3. Đảm bảo không có:
   - Horizontal scroll / overflow.
   - Text, image, button bị tràn hoặc cắt.
   - Layout/grid/flex bị vỡ.
   - Header/mobile menu/footer hiển thị sai.
   - Modal, dropdown, form vượt viewport.
4. Tối ưu responsive cho **Header, Navigation, Hero, Section, Card, Image, Typography, Button, Form, Footer**.
5. Nội dung từ **CMS** phải responsive với cả nội dung ngắn và dài; không hard-code height làm cắt nội dung.
6. Giữ nguyên **Desktop design, màu sắc, typography, nội dung, URL, business logic và CMS functionality** hiện tại. Không redesign nếu không cần thiết.
7. Ưu tiên sử dụng **Tailwind responsive utilities**, hạn chế custom CSS và tuyệt đối không dùng `overflow-x: hidden` để che lỗi layout.
8. Không thêm CDN hoặc thư viện mới nếu project hiện tại không yêu cầu.
9. Sau khi sửa, kiểm tra lại toàn bộ các trang và đảm bảo **Mobile / Tablet / Desktop đều hoạt động ổn định**.
10. Không chỉ sửa lỗi CSS; hãy tìm **root cause** và sửa đúng component dùng chung để tránh phát sinh lỗi ở các trang khác.

### Acceptance Criteria

- Mobile: PASS
- Tablet: PASS
- Desktop: PASS
- Horizontal overflow: NONE
- Header/Menu: PASS
- Images: PASS
- Typography: PASS
- Cards/Sections: PASS
- Forms/Buttons: PASS
- CMS dynamic content: PASS
- Không làm thay đổi Desktop design và business logic.

Sau khi hoàn thành, báo cáo ngắn gọn:
**Files đã sửa → vấn đề đã xử lý → breakpoint đã kiểm tra → các issue còn lại (nếu có).**