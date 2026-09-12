# Hướng dẫn cấu hình nội dung website qua CMS Admin

## 1. Mục đích

Tài liệu này hướng dẫn người quản trị nội dung cấu hình website IRDM bằng Django Admin tại:

```text
https://<ten-mien>/admin/
```

Khi chạy ở máy local:

```text
http://127.0.0.1:8000/admin/
```

Phạm vi tài liệu gồm:

- Cấu hình chung: logo, thông tin liên hệ, menu và footer.
- Trang chủ.
- Trang Về IRDM.
- Trang Giải pháp và trang chi tiết giải pháp.
- Trang Năng lực cốt lõi và trang chi tiết năng lực.
- Trang Tri thức & Góc nhìn, bài viết, tin hoạt động, sự kiện và tài liệu tải xuống.
- Trang Đội ngũ chuyên gia và hồ sơ chuyên gia.
- Quản lý yêu cầu liên hệ và yêu cầu tải tài liệu.
- Quy chuẩn URL, slug, hình ảnh, trạng thái hiển thị và SEO.

> Lưu ý: tên nhóm và tên trường trong Admin có thể hiển thị bằng tiếng Việt hoặc tiếng Anh tùy ngôn ngữ giao diện Admin. Nội dung nhập trong các trường không được tự động dịch khi đổi ngôn ngữ giao diện.

---

## 2. Quy tắc vận hành chung

### 2.1. Đăng nhập và lưu nội dung

1. Mở `/admin/` và đăng nhập bằng tài khoản được cấp.
2. Chọn module nội dung cần chỉnh sửa.
3. Chọn bản ghi hiện có hoặc bấm **Add/Thêm**.
4. Nhập nội dung và kiểm tra các trường trạng thái.
5. Bấm một trong các nút:
   - **Save/Lưu**: lưu và quay về danh sách.
   - **Save and continue editing/Lưu và tiếp tục chỉnh sửa**: lưu nhưng vẫn ở màn hình hiện tại.
   - **Save and add another/Lưu và thêm mới**: lưu và tạo bản ghi tiếp theo.
6. Mở website bằng tab ẩn danh hoặc tải lại mạnh bằng `Ctrl+F5` để kiểm tra.

### 2.2. Ý nghĩa các trường trạng thái

| Trường | Ý nghĩa | Khi nào nội dung hiển thị |
|---|---|---|
| `is_active` | Bật/tắt bản ghi trong hệ thống | Thường phải bật; xem ngoại lệ inline bên dưới |
| `is_published` | Cho phép công khai nội dung | Với bài viết, giải pháp, năng lực, chuyên gia: phải bật cùng `is_active` |
| `is_visible` | Hiển thị một section tùy chọn | Phải bật cùng `is_active` |
| `is_featured` | Đánh dấu nội dung nổi bật | Không thay thế `is_published` |
| `is_senior` | Đưa chuyên gia vào section chuyên gia cao cấp | Chuyên gia vẫn phải active và published |
| `display_order` | Thứ tự hiển thị | Số nhỏ hiển thị trước; nên dùng `10, 20, 30...` để dễ chèn thêm |

Không nên xóa bản ghi đang dùng chỉ để ẩn nội dung. Hãy tắt `is_active` hoặc `is_published` để có thể khôi phục.

> Giới hạn hiện tại: một số inline của Home/About được template đọc trực tiếp mà chưa lọc `is_active`. Việc tắt cờ có thể chưa ẩn Hero Pill, Hero Statistic, highlight, legal item, benefit, audience, ecosystem child, organization bullet hoặc contact-banner stat. Với các item này, hãy kiểm tra ngoài website; nếu vẫn hiển thị, cần đội kỹ thuật cập nhật code hoặc xóa item sau khi đã sao lưu nội dung.

### 2.3. Bản ghi cấu hình section

Các model có tên như `...ListingPage`, `...Section`, `...SectionHeader`, `Hero`, `SEO` thường là cấu hình của một section hoặc một trang. Website hiện lấy **bản ghi active đầu tiên** đối với nhiều loại cấu hình này.

Quy tắc:

- Chỉ nên duy trì **một bản ghi active** cho mỗi cấu hình trang/section.
- Nếu tạo bản mới để thay thế, hãy tắt bản cũ trước khi bật bản mới.
- Không dùng nhiều bản ghi active với hy vọng website tự ghép nội dung.

### 2.4. Inline trong màn hình chỉnh sửa

Một số nội dung con được nhập ngay phía dưới nội dung cha, ví dụ:

- Thẻ pill trong Hero Trang chủ.
- Thống kê trong Hero Về IRDM.
- Tính năng, thách thức, phương pháp và đầu ra của Giải pháp.
- Nhu cầu, quy trình và đầu ra của Năng lực.
- Thành viên, sơ đồ tổ chức và hiệp hội trong Nhóm thông tin chuyên gia.

Sau khi thêm hoặc sửa inline, phải lưu bản ghi cha để dữ liệu được ghi nhận.

### 2.5. Quy trình nội bộ khuyến nghị

Hệ thống Admin hiện tại công khai nội dung dựa trực tiếp vào `is_active` và `is_published`; chưa có màn hình phê duyệt Reviewer/Publisher riêng.

Quy trình vận hành nên áp dụng:

1. Người biên tập tạo nội dung với `is_published = False`.
2. Người kiểm duyệt kiểm tra câu chữ, hình ảnh, URL và SEO.
3. Người có quyền xuất bản bật `is_published` và `is_active`.
4. Kiểm tra ngoài website trên desktop và mobile.
5. Khi cần rút bài, tắt `is_published`; không xóa ngay.

---

## 3. Quy chuẩn nhập liệu

### 3.1. Slug

`slug` là phần định danh trong URL chi tiết, ví dụ:

```text
/giai-phap/tu-van-chien-luoc/
/capabilities/nghien-cuu-ung-dung/
/chuyen-gia/nguyen-van-a/
/tri-thuc-goc-nhin/ten-bai-viet/
```

Quy tắc:

- Dùng chữ thường không dấu.
- Dùng dấu gạch ngang `-` giữa các từ.
- Không dùng khoảng trắng, dấu gạch dưới, ký tự đặc biệt.
- Không đổi slug của nội dung đã chia sẻ URL nếu không có kế hoạch redirect.
- Kiểm tra slug không trùng với bản ghi khác trong cùng module.

Admin tự gợi ý slug từ tiêu đề ở các model có cấu hình `prepopulated_fields`, nhưng người dùng vẫn phải kiểm tra lại tiếng Việt không dấu.

### 3.2. URL CTA

| Mục đích | Cách nhập | Ví dụ |
|---|---|---|
| Trang nội bộ | Đường dẫn bắt đầu bằng `/` | `/lien-he/` |
| Section cùng trang | Fragment bắt đầu bằng `#` | `#tim-kiem` |
| Trang khác và cuộn tới section | Path + fragment | `/chuyen-gia/#tim-kiem` |
| Website bên ngoài | URL đầy đủ | `https://example.org/report` |
| Email | Giao thức email | `mailto:contact@irdm.edu.vn` |
| Điện thoại | Giao thức điện thoại | `tel:+842812345678` |

Không nhập URL Admin như `/admin/...` vào CTA công khai.

Các URL public chính:

| Trang | URL |
|---|---|
| Trang chủ | `/` |
| Về IRDM | `/ve-irdm/` |
| Giải pháp | `/giai-phap/` |
| Năng lực cốt lõi | `/capabilities/` |
| Tri thức & Góc nhìn | `/tri-thuc-goc-nhin/` |
| Đội ngũ chuyên gia | `/chuyen-gia/` |
| Liên hệ | `/lien-he/` |

### 3.3. URL lọc chuyên gia

CTA tại card **Bản đồ chuyên môn** phải dùng đúng định dạng:

```text
/chuyen-gia/?area=<slug-linh-vuc>#tim-kiem
```

Ví dụ:

```text
/chuyen-gia/?area=y-te-quan-tri-y-te#tim-kiem
```

Trong đó:

- Giá trị `area` phải trùng chính xác với slug của **Research Area/Lĩnh vực chuyên môn**.
- `#tim-kiem` đưa người dùng tới section **TÌM NHÀ KHOA HỌC/CHUYÊN GIA**.
- URL cũ dùng `linh-vuc` vẫn được hệ thống hỗ trợ, nhưng không dùng cho cấu hình mới.

### 3.4. Hình ảnh và tệp

- Dùng JPG/WebP cho ảnh chụp; PNG/SVG cho logo và icon nền trong suốt.
- Không tải ảnh có dung lượng quá lớn nếu không cần thiết; nên tối ưu trước khi upload.
- Hero nên dùng ảnh ngang, đủ rộng để không vỡ trên desktop.
- Avatar chuyên gia nên là ảnh chân dung, khuôn mặt rõ, nền sạch.
- Thumbnail/card nên thống nhất tỷ lệ trong cùng một section.
- Điền trường `image_alt`, `diagram_alt`, `icon_alt` nếu Admin cung cấp.
- Với tài liệu tải xuống, kiểm tra đúng file, nhãn loại file và dung lượng hiển thị.
- Không đổi/xóa file media đang được nội dung công khai sử dụng nếu chưa thay thế.

### 3.5. Màu sắc và icon

- Trường màu dùng mã HEX, ví dụ `#1B3F6E`.
- Không nhập tên màu tự do nếu trường yêu cầu HEX.
- Trường `icon` thường nhận tên icon đã được code hỗ trợ; ưu tiên chọn giá trị có sẵn trong danh sách.
- Nếu có cả `icon_image` và `icon`, ảnh upload thường được ưu tiên; `icon` là phương án dự phòng.

### 3.6. SEO

Đối với trang hoặc nội dung có nhóm SEO:

- `meta_title`: khoảng 50-60 ký tự, chứa tên chủ đề chính.
- `meta_description`: khoảng 140-160 ký tự, mô tả đúng nội dung.
- `meta_keywords`: chỉ nhập khi module có trường này; phân tách nhất quán.
- `og_image`: ảnh chia sẻ mạng xã hội, ưu tiên tỷ lệ khoảng 1.91:1.
- Không nhồi lặp từ khóa.

---

## 4. Cấu hình chung toàn website

### 4.1. Site Settings

Admin: **Core > Site settings**

Chỉ nên có một bản ghi active.

| Nhóm | Trường chính | Vị trí sử dụng |
|---|---|---|
| Site Identity | Site name, tagline, description, logo, logo white, favicon | Header, footer, tab trình duyệt và nhận diện chung |
| Contact | Email, phone, address, operating hours, map embed URL | Footer và các vùng liên hệ dùng dữ liệu chung |
| Social Media | LinkedIn, Twitter/X, Facebook, YouTube | Footer hoặc liên kết mạng xã hội |
| Status | Active, display order | Chọn cấu hình được sử dụng |

Kiểm tra logo thường và logo trắng trên cả nền sáng và nền tối.

### 4.2. Menu điều hướng

Admin: **Core > Menu items**

Trường quan trọng:

- `label`: nhãn hiển thị.
- `menu`: vị trí menu.
- `url`: URL đích.
- `parent`: mục cha nếu là menu con.
- `display_order`: thứ tự.
- `is_active`: bật/tắt.

Quy trình thêm menu con:

1. Tạo và lưu mục cha trước.
2. Tạo mục con, chọn `parent` là mục cha.
3. Đặt các số thứ tự khác nhau.
4. Kiểm tra menu desktop và mobile.

### 4.3. Footer

Admin: **Core > Footer sections**

- `Footer Section` là nhóm liên kết, nhưng không ánh xạ thành một cột độc lập trong mọi trường hợp.
- Thêm `Footer Link` ngay trong inline của section.
- `open_in_new_tab` chỉ nên bật cho website hoặc tài liệu bên ngoài.
- Thứ tự section và link đều do `display_order` quyết định.

Hành vi template hiện tại:

- Nếu đã có Footer Menu, Footer Section đầu tiên không được render vì cột điều hướng dùng Footer Menu.
- Các Footer Section còn lại được xếp chung trong cột cuối, không tự tạo thêm cột.
- Sau khi chỉnh footer, phải kiểm tra trực tiếp để tránh cấu hình một section không xuất hiện.

---

## 5. Trang chủ

Public URL: `/`

Admin module: **Home**

### 5.1. Hero

Admin: **Hero sections**

Cấu hình:

- Eyebrow, heading, heading accent, subheading và description.
- Background image và hero image.
- Primary CTA và Secondary CTA.
- Quote strip và quote icon.
- Các `Hero Pill Tag` nhập trong inline.

Chỉ nên có một Hero active. Nếu muốn xuống dòng trong heading, kiểm tra hiển thị sau khi lưu vì template quyết định cách xử lý dòng.

### 5.2. Nhóm đối tượng phục vụ

Admin:

- **Audience section headers**: tiêu đề/mô tả section.
- **Audience segments**: từng card đối tượng.

Trong mỗi Audience Segment:

- Nhập title, description, card image.
- Upload `icon_image` nếu có; `icon` là dự phòng.
- Nhập CTA label và URL.
- Thêm các Audience Tag trong inline.

### 5.3. Phương pháp tiếp cận

Admin:

- **Methodology section headers**: tiêu đề section.
- **Methodology steps**: từng bước, số bước, tiêu đề, mô tả, icon và thứ tự.

Nên đánh số bước và `display_order` đồng nhất để tránh thứ tự nội dung và thứ tự hiển thị mâu thuẫn.

### 5.4. Năng lực cốt lõi trên Trang chủ

Admin:

- **Capabilities section headers**.
- **Core capabilities**.

Mỗi Core Capability gồm nội dung, icon, ảnh nền và `link_url`. URL nên trỏ tới một trang chi tiết đang published trong `/capabilities/<slug>/`.

### 5.5. Triết lý hoạt động

Admin:

- **Philosophy section headers**.
- **Philosophy principles**.

Dùng `number`, title, description và thứ tự để tạo các nguyên tắc theo đúng trình tự nội dung.

### 5.6. Số liệu và đối tác

Admin:

- **Statistic items**: giá trị và nhãn thống kê.
- **Evidence section headers**: tiêu đề section bằng chứng/đối tác.
- **Partner logos**: tên, logo, URL website và thứ tự.

Không nhập ký hiệu hai lần. Ví dụ nếu `value` đã là `40+`, không thêm dấu `+` ở label.

### 5.7. Tri thức nổi bật trên Trang chủ

Admin:

- **Knowledge section headers**.
- **Knowledge categories** trong app Home.

Đây là card điều hướng trên Trang chủ, khác với `Knowledge Category` của module Tri thức. Mỗi card có icon, category label, title, image và CTA.

### 5.8. CTA cuối trang

Admin: **CTA banners** trong app Home.

Nhập section label, heading, description, background image, CTA label và CTA URL. Chỉ nên có một banner active.

### 5.9. Featured Section Config

Admin: **Featured section configs**

Model này đã có trong Admin nhưng Home Page hiện chưa lấy dữ liệu Featured Section Config để render. Endpoint partial tương ứng cũng đang trả danh sách rỗng.

- Không dùng màn hình này để vận hành nội dung production ở thời điểm hiện tại.
- Không tự tạo `section_key` mới.
- Muốn kích hoạt chức năng này cần đội kỹ thuật hoàn thiện view/template trước.

---

## 6. Trang Về IRDM

Public URL: `/ve-irdm/`

Admin module: **About**

Trang được ghép từ nhiều section độc lập. Với mỗi model section, chỉ nên có một bản ghi active.

### 6.1. SEO trang

Admin: **About page SEO**

Cấu hình meta title, meta description, meta keywords và Open Graph. Chỉ để một bản ghi active.

Giới hạn hiện tại: `og_title` và `og_description` được template sử dụng, nhưng `og_image` chưa được xuất thành thẻ `og:image`. Có thể upload để chuẩn bị dữ liệu, nhưng muốn ảnh xuất hiện khi chia sẻ cần đội kỹ thuật bổ sung template.

### 6.2. Hero

Admin: **About heroes**

- Nội dung: eyebrow, title, subtitle, description.
- Ảnh: background và foreground.
- Hai CTA.
- Quote và cờ hiển thị quote.
- Thống kê Hero nhập bằng inline `About Hero Statistic`.

### 6.3. Giới thiệu

Admin: **About introductions**

- Nhập section label, title, subtitle, description.
- Chọn ảnh, alt text và background.
- Các highlight card được nhập trong inline với icon, màu, title và description.

### 6.4. Mục đích hoạt động

Admin: **About purposes**

Cấu hình phần nội dung, highlight/quote, diagram card và background. Với sơ đồ, luôn nhập `diagram_alt` và kiểm tra caption.

### 6.5. Tầm nhìn, sứ mệnh và triết lý

Admin: **About vision missions**

- Nội dung đầu section.
- Các card tầm nhìn/sứ mệnh trong inline.
- Các icon hình ảnh trong inline.
- Bottom panel ở cuối section.

### 6.6. Giá trị cốt lõi

Admin:

- **About core value sections**: tiêu đề, mô tả và nền.
- **About core values**: từng giá trị với icon, title, description, color theme và thứ tự.

### 6.7. Cơ sở pháp lý

Admin: **About legal info**

- Header section và ảnh cột trái.
- Thông tin tổ chức.
- Badge và thuộc tính key/value nhập trong inline.
- Timeline pháp lý nhập trong inline, gồm năm, tiêu đề, mô tả, icon, URL tài liệu và nhãn tài liệu.
- Có thể bật/tắt footer note.

URL tài liệu phải mở được và đúng tài liệu pháp lý tương ứng.

### 6.8. Lợi ích hợp tác

Admin: **About partner benefit sections**

- KPI banner phía trên section có thể ẩn bằng cách để trống toàn bộ trường banner.
- Header và background của section.
- Các benefit card nhập trong inline, gồm icon, nội dung, màu và link.

### 6.9. Mạng lưới chuyên môn

Admin:

- **About network section headers**.
- **About professional networks**.

Mỗi mạng lưới gồm tên, mô tả, logo, URL và nhãn link.

Giới hạn hiện tại: view có đọc hai nhóm dữ liệu này nhưng template `/ve-irdm/` chưa render section Mạng lưới chuyên môn. Nội dung lưu trong Admin chưa xuất hiện ngoài website; cần đội kỹ thuật nối section vào template trước khi vận hành.

### 6.10. Nhóm đối tượng

Admin: **About target audience sections**

- Cấu hình header, CTA và background của section.
- Các đối tượng nhập trong inline, gồm icon, image, title, description và CTA.

### 6.11. Hệ sinh thái năng lực

Admin:

- **About capability ecosystems**: header, CTA, hub diagram, background và số liệu.
- **About ecosystem partner groups**: từng nhóm đối tác và các logo partner trong inline.

Nhóm partner được tạo ở màn hình ecosystem, sau đó mở màn hình group để thêm từng partner item.

### 6.12. Cơ cấu tổ chức

Admin:

- **About org structure sections**: header, CTA và background.
- **About org structure cards**: từng card và các bullet item trong inline.

Có thể tạo card từ inline của section, sau đó bấm mở card để nhập bullet chi tiết.

### 6.13. Các banner CTA/liên hệ

Admin:

- **About CTA banners**: model đã có nhưng template `/ve-irdm/` hiện chưa render banner này.
- **About contact banners**: nội dung liên hệ, tối đa ba CTA, quote và các chỉ số trong inline.

Nhóm Legacy Contact chỉ dùng khi template còn đọc các trường này; ưu tiên thông tin liên hệ chung trong Site Settings nếu thiết kế hiện tại dùng dữ liệu chung.

Chỉ vận hành **About Contact Banner** ở thời điểm hiện tại. Muốn dùng **About CTA Banner**, cần đội kỹ thuật thêm section vào template.

---

## 7. Trang Giải pháp

Public URL:

```text
/giai-phap/
/giai-phap/<slug>/
```

Admin module: **Solution**

### 7.1. Trang danh sách Giải pháp

Admin: **Solution listing pages**

Chỉ để một bản ghi active. Cấu hình:

- Hero: section label, heading, description, hero image.
- CTA chính/phụ.
- Heading của quick navigation.
- Header section phương pháp tiếp cận.
- SEO.

Admin: **Solution approach steps** để quản lý các bước tiếp cận dùng chung trên trang danh sách.

### 7.2. Tạo một Giải pháp

Admin: **Solutions**

1. Nhập title và kiểm tra slug.
2. Nhập section label, summary và description.
3. Upload thumbnail cho card và hero image cho trang chi tiết.
4. Chọn card color nếu có.
5. Nhập nhãn các section.
6. Cấu hình CTA và ảnh CTA.
7. Chọn Related Capabilities.
8. Nhập SEO.
9. Thêm nội dung con trong inline:
   - Features.
   - Challenges.
   - Methodology Steps.
   - Outputs.
10. Bật `is_active` và `is_published` sau khi duyệt.

Chỉ các giải pháp vừa active vừa published mới xuất hiện ở listing và mở được trang chi tiết.

### 7.3. Nội dung con của Giải pháp

| Inline | Nội dung | Quy tắc thứ tự |
|---|---|---|
| Solution Feature | Nhãn/tính năng ngắn | `display_order` |
| Solution Challenge | Số và nội dung thách thức | Theo `number` |
| Solution Methodology Step | Tiêu đề, mô tả, icon | `display_order` |
| Solution Output | Số, nội dung và ảnh | Theo `number` |

Từng inline cũng có `is_active`; tắt item nếu chưa muốn hiển thị.

---

## 8. Trang Năng lực cốt lõi

Public URL:

```text
/capabilities/
/capabilities/<slug>/
```

Admin module: **Capability**

### 8.1. Trang danh sách Năng lực

Admin: **Capability listing pages**

Cấu hình Hero, Overview, CTA cuối trang và trạng thái. CTA có cờ `cta_show`, ảnh nền, overlay color và opacity.

Chỉ để một bản ghi listing active.

### 8.2. Tạo một Năng lực

Admin: **Capabilities**

1. Nhập title, slug và section label.
2. Nhập summary, description.
3. Upload thumbnail, card icon và hero image.
4. Cấu hình section “What is” và ảnh.
5. Nhập nhãn/intro cho các section nhu cầu, phương pháp, đầu ra.
6. Nhập CTA chính/phụ.
7. Nhập SEO.
8. Thêm inline Features, Need Items, How Steps và Outputs.
9. Bật active và published sau khi duyệt.

### 8.3. Case study

Admin: **Capability case studies**

- Chọn đúng capability cha.
- Nhập number, image, category label, title và description.
- Nhập CTA chính/phụ.
- Thêm tag trong inline.
- Bật active.
- Thứ tự ngoài website được sắp theo trường `number`; `display_order` hiện không thay đổi thứ tự case study.

### 8.4. Nội dung con của Năng lực

| Inline | Nội dung |
|---|---|
| Capability Feature | Nhãn năng lực |
| Capability Need Item | Số và nội dung nhu cầu |
| Capability How Step | Tiêu đề, icon image và step image |
| Capability Output | Số và nội dung đầu ra |

---

## 9. Trang Tri thức & Góc nhìn

Public URL:

```text
/tri-thuc-goc-nhin/
/tri-thuc-goc-nhin/<slug>/
/tri-thuc-goc-nhin/tin-hoat-dong/<slug>/
```

URL cũ `/su-kien/` được chuyển về section Tin tức & Sự kiện trên trang Tri thức.

Admin module: **Knowledge**

### 9.1. Cấu hình trang listing

Admin: **Knowledge listing pages**

Chỉ để một bản ghi active. Màn hình này cấu hình:

- Hero và hai CTA.
- Search/filter section.
- Featured section.
- Khám phá theo loại nội dung.
- Khám phá theo chủ đề.
- Ấn phẩm & Báo cáo.
- Form yêu cầu ấn phẩm.
- Khối thông tin liên hệ cạnh form.
- Tin tức & Sự kiện.
- IRDM trên báo chí/diễn đàn.
- Ready section.
- CTA cuối trang.
- SEO.

Các nội dung inline gồm:

- Featured Article.
- Content Type Card.
- Topic Card.
- Ready Section CTA Button.

### 9.2. Category và Topic

Admin:

- **Knowledge categories**: phân loại loại nội dung.
- **Knowledge topics**: phân loại theo chủ đề.

Mỗi bản ghi cần label, slug, mô tả/icon/ảnh phù hợp và trạng thái active + published.

Không nhầm với `Knowledge Category` trong app Home; category của app Knowledge dùng cho bài viết và bộ lọc trang Tri thức.

### 9.3. Bài viết tri thức

Admin: **Knowledge articles**

1. Nhập title và slug.
2. Nhập summary và body.
3. Upload thumbnail và hero image.
4. Chọn category và topics.
5. Nhập tác giả, ngày xuất bản và thời gian đọc.
6. `is_featured` hiện chỉ là dữ liệu đánh dấu trong Admin, không tự đưa bài vào section nổi bật.
7. Chọn related capabilities.
8. Nhập SEO.
9. Bật active và published.

Muốn bài xuất hiện trong section nổi bật, phải tạo `Featured Article` theo mục 9.4. Nếu bài được ghim nhưng bài gốc chưa active/published, bài vẫn không hiển thị.

### 9.4. Ghim bài nổi bật

Trong màn hình **Knowledge Listing Page**, dùng inline Featured Article:

- Chọn article.
- Đặt thứ tự.
- Nhập badge, CTA text/icon/URL nếu cần.
- Bật active.

Bài gốc vẫn phải active và published.

### 9.5. Card loại nội dung và card chủ đề

Có thể quản lý bằng inline trong Listing Page hoặc màn hình riêng:

- **Knowledge content type cards**.
- **Knowledge topic cards**.
- **Knowledge topic card tags**.

Card cần liên kết đúng Listing Page, category/topic, tag, ảnh, CTA và trạng thái active + published.

### 9.6. Bộ lọc

Admin: **Knowledge filter groups**

- `title`: tên nhóm bộ lọc.
- `param_key`: khóa query string mà template/view hỗ trợ.
- Các Filter Item nhập trong inline với label, value, màu và thứ tự.

Không tự đổi `param_key` trên hệ thống đang chạy nếu chưa xác nhận view hỗ trợ. Giá trị filter phải khớp slug category/topic tương ứng.

### 9.7. Ấn phẩm và tài liệu tải xuống

Admin: **Knowledge downloads**

- Nhập title, slug, summary.
- Upload cover image và file.
- Nhập nhãn loại file và dung lượng.
- Chọn category và ngày xuất bản.
- Bật active và published.

Admin: **Knowledge download requests** là danh sách yêu cầu người dùng gửi từ form. Đây là dữ liệu chỉ đọc:

- Không thêm hoặc sửa nội dung tại đây.
- Có thể xem họ tên, email, tổ chức, ghi chú và thời gian gửi.
- Tuân thủ quy định bảo vệ dữ liệu cá nhân khi xuất/chia sẻ danh sách.

### 9.8. Tin hoạt động

Admin: **Knowledge activity news**

- Có trang chi tiết nội bộ tại `/tri-thuc-goc-nhin/tin-hoat-dong/<slug>/`.
- Nhập title, slug, summary, body, tác giả, thời gian đọc.
- Upload thumbnail và hero image.
- Chọn category và ngày xuất bản.
- Nếu để trống CTA URL, card mở trang chi tiết nội bộ.
- Nhập SEO và bật active + published.

### 9.9. Tin ngoài và bài báo chí

Admin: **Knowledge news items**

- Nhập title, slug, summary, thumbnail.
- Chọn category, topics, ngày xuất bản và source URL.
- Bật `is_press_article` để đưa vào section IRDM trên báo chí.
- Cấu hình CTA text và target.
- Bật active + published.

### 9.10. Sự kiện

Admin: **Knowledge events**

- Nhập title, description, cover image.
- Chọn category, ngày/giờ, địa điểm và tags.
- Nhập CTA text/icon/URL/target.
- Bật active + published.

Danh sách “Sự kiện sắp diễn ra” hiện không tự loại sự kiện đã qua ngày. Khi sự kiện kết thúc và không còn cần hiển thị tại section này, người quản trị phải tắt `is_published` hoặc `is_active` thủ công.

Tag sự kiện được quản lý tại **Knowledge event tags**.

### 9.11. Accordion sau sự kiện/hợp tác

Admin: **Knowledge accordion items**

Chọn đúng `accordion_type`, nhập title/content, thứ tự và bật active + published. Các item được nhóm và sắp xếp theo loại accordion rồi tới `display_order`.

---

## 10. Trang Đội ngũ chuyên gia

Public URL:

```text
/chuyen-gia/
/chuyen-gia/<slug>/
```

Admin module: **Expert**

### 10.1. Cấu hình trang listing

Admin: **Expert listing pages**

Chỉ để một bản ghi active. Các nhóm cấu hình tương ứng với section ngoài website:

| Nhóm Admin | Section website |
|---|---|
| Hero Badge, Hero Content, Hero Buttons, Hero Bottom Badge | Hero “Mạng lưới nhà khoa học & chuyên gia liên ngành” |
| Process Section | Phương thức tiếp cận |
| Senior Experts Section | Chuyên gia cao cấp |
| Research Area Map Section | Bản đồ chuyên môn liên ngành |
| Expert Directory Section | Tìm nhà khoa học/chuyên gia |
| Knowledge Topics Section | Các chủ đề thông tin chuyên môn |
| Info Groups Section | Các nhóm thông tin chuyên môn |
| CTA Section | Banner CTA cuối trang |
| SEO | Metadata trang |

Fragment CTA thường dùng:

```text
#ban-do-chuyen-mon
#tim-kiem
```

### 10.2. Vai trò, lĩnh vực và hình thức đồng hành

Admin:

- **Expert groups**: bộ lọc “Theo vai trò”.
- **Research areas**: Bản đồ chuyên môn và bộ lọc lĩnh vực.
- **Engagement types**: bộ lọc “Theo hình thức đồng hành”.
- **Knowledge topics**: accordion chủ đề chuyên môn.

Mỗi taxonomy cần name, slug, thứ tự và active.

### 10.3. Card Bản đồ chuyên môn

Admin: **Research areas**

Nhập:

- Name và slug.
- Icon hoặc card icon.
- Màu HEX.
- Description.
- `card_tags`: mỗi tag một dòng.
- CTA label.
- CTA URL theo mẫu `/chuyen-gia/?area=<slug>#tim-kiem`.
- Active và display order.

Sau khi lưu, bấm CTA ngoài website và xác nhận:

1. Trang cuộn tới section TÌM KIẾM.
2. Lĩnh vực tương ứng được highlight.
3. Danh sách chỉ còn chuyên gia thuộc lĩnh vực đó.

### 10.4. Tạo hồ sơ chuyên gia

Admin: **Experts**

#### Thông tin cơ bản

- Name, slug, học hàm/học vị, chức danh, tổ chức.
- Avatar dùng cho card; hero avatar ưu tiên trên trang hồ sơ.
- Short bio, profile tagline và full bio.
- Email và profile URL.

#### Phân loại

- Group: một vai trò chính.
- Research areas: có thể chọn nhiều lĩnh vực.
- Card specialty: nhãn nổi bật trên card; để trống dùng Research Area đầu tiên.
- Engagement types: có thể chọn nhiều hình thức.
- Knowledge topics: có thể chọn nhiều chủ đề.

#### Trang hồ sơ

- Hero tagline.
- Role badges: mỗi badge một dòng.
- Ticker text: dùng ký hiệu phân tách theo hướng dẫn trong Admin.
- Contact CTA URL và label.
- Ba cặp thống kê value/label.
- Experience highlights: mỗi nội dung một dòng.
- Discussion topics: mỗi nội dung một dòng.
- Notable projects: mỗi nội dung một dòng.

#### Trạng thái

- `is_published`: cho phép mở trang hồ sơ và xuất hiện trong tìm kiếm.
- `is_active`: bản ghi còn hiệu lực.
- `is_senior`: xuất hiện ở section chuyên gia cao cấp.
- `is_featured`: đánh dấu nổi bật cho các vị trí có sử dụng cờ này.
- `display_order`: thứ tự trước tên chuyên gia.

Chuyên gia chỉ hiển thị công khai khi active và published.

### 10.5. Quy trình kết nối

Admin: **Process steps**

Nhập step number, title, icon, description và trạng thái. Website sắp xếp theo `step_number`; nên giữ số bước duy nhất và liên tục.

### 10.6. Nhóm thông tin chuyên môn

Admin: **Info groups**

Mỗi nhóm là một accordion. Có ba chế độ nội dung chính:

1. **Sơ đồ/khối mô tả**: không bật expert grid; dùng Org Node và Info Group Block inline.
2. **Lưới chuyên gia theo lĩnh vực**: bật `show_expert_grid`, chọn Research Areas.
3. **Lưới chuyên gia phẳng**: bật expert grid + flat grid, chọn trực tiếp Expert members.

Có thể bật `show_association_grid` để hiển thị hiệp hội/mạng lưới.

Inline trong Info Group:

| Inline | Dùng cho |
|---|---|
| Organization chart nodes | Cây/sơ đồ tổ chức, cấp, cha, style, màu và URL |
| Information blocks | Khối chức năng/nhiệm vụ |
| Council members | Thành viên hội đồng độc lập với hồ sơ Expert |
| Associations/Networks | Logo/icon, mô tả và CTA hiệp hội |

Không bật đồng thời các chế độ hiển thị mâu thuẫn nếu thiết kế section không yêu cầu.

---

## 11. Trang Liên hệ và dữ liệu yêu cầu

Public URL: `/lien-he/`

Admin: **Contact > Contact requests**

Màn hình này quản lý yêu cầu do người dùng gửi, không phải màn hình cấu hình nội dung trang Liên hệ.

Thông tin gồm:

- Họ tên, email, điện thoại, tổ chức.
- Loại yêu cầu và nội dung.
- Source URL.
- Trạng thái xử lý.
- Thời gian tạo/cập nhật.

Quy trình xử lý khuyến nghị:

1. Lọc yêu cầu mới theo status/ngày.
2. Mở yêu cầu và kiểm tra thông tin.
3. Liên hệ qua kênh phù hợp.
4. Cập nhật status trực tiếp từ danh sách hoặc màn hình chi tiết.
5. Không sửa `source_url`, `created_at`, `updated_at` vì đây là trường chỉ đọc.
6. Không chia sẻ dữ liệu cá nhân ra ngoài nhóm được phân quyền.

Nội dung tĩnh của trang Liên hệ hiện không có model Admin riêng trong app Contact. Thông tin liên hệ chung cần chỉnh tại **Core > Site Settings**; các đoạn chữ còn lại có thể nằm trong template và cần đội kỹ thuật chỉnh sửa.

---

## 12. Những app không dùng để cấu hình nội dung hiện tại

Các app sau có file Admin nhưng hiện không đăng ký model nội dung:

- Website.
- CMS.
- Resource.
- Insight.
- Event.
- Administration.
- Common.

Không tìm nội dung công khai trong các nhóm này. Nội dung Tri thức, sự kiện, tin tức và tài liệu hiện được quản lý tập trung trong app **Knowledge**.

---

## 13. Đa ngôn ngữ

Admin hỗ trợ đổi ngôn ngữ giao diện Việt/Anh. Việc đổi ngôn ngữ Admin chỉ thay đổi nhãn hệ thống và tên trường đã được dịch.

Lưu ý:

- Không có trường nội dung song ngữ tách riêng trong các model được mô tả ở tài liệu này.
- Nội dung người dùng nhập không tự dịch.
- Không nhập đồng thời hai ngôn ngữ vào cùng trường nếu thiết kế website không quy định.
- Khi đội kỹ thuật sửa file dịch `.po`, cần compile lại catalog trước khi giao diện nhận bản dịch mới.

Lệnh compile thường dùng trên Windows của dự án:

```powershell
.\venv\Scripts\python.exe -c "import polib; po = polib.pofile('locale/vi/LC_MESSAGES/django.po'); po.save_as_mofile('locale/vi/LC_MESSAGES/django.mo')"
```

Thao tác này dành cho đội kỹ thuật, không phải quy trình nhập nội dung thông thường.

---

## 14. Checklist trước khi xuất bản

### Nội dung

- [ ] Tiêu đề, mô tả và CTA không có lỗi chính tả.
- [ ] Nội dung không chứa dữ liệu nháp hoặc placeholder.
- [ ] Các đoạn “mỗi dòng một mục” đã xuống dòng đúng.
- [ ] Ngày, số liệu, tên người và chức danh đã được xác minh.

### Phân loại và trạng thái

- [ ] Slug đúng quy chuẩn và không trùng.
- [ ] Đã chọn đúng category/topic/group/area.
- [ ] `is_active` đã bật.
- [ ] `is_published` đã bật nếu model có trường này.
- [ ] `display_order` không xung đột ngoài ý muốn.
- [ ] Chỉ có một bản ghi active cho cấu hình singleton/section.

### Hình ảnh và tài liệu

- [ ] Ảnh đúng nội dung, không vỡ và không bị crop mất chủ thể.
- [ ] Logo/icon có nền và màu phù hợp.
- [ ] Alt text đã nhập nếu có trường.
- [ ] Tệp tải xuống mở được và đúng phiên bản.

### URL

- [ ] CTA nội bộ bắt đầu bằng `/` hoặc `#`.
- [ ] CTA ngoài dùng URL đầy đủ và target phù hợp.
- [ ] Không có link dẫn vào `/admin/`.
- [ ] CTA Research Area dùng `?area=<slug>#tim-kiem`.
- [ ] Đã bấm thử toàn bộ CTA vừa thay đổi.

### SEO và hiển thị

- [ ] Meta title và description đã nhập.
- [ ] Kiểm tra desktop.
- [ ] Kiểm tra mobile.
- [ ] Kiểm tra header, menu, footer và breadcrumb.
- [ ] Kiểm tra bằng tab ẩn danh để tránh nhầm do cache/quyền đăng nhập.

---

## 15. Xử lý lỗi thường gặp

### Nội dung đã lưu nhưng không hiển thị

Kiểm tra theo thứ tự:

1. `is_active` đã bật chưa.
2. Model có `is_published` không và đã bật chưa.
3. Listing Page có active không nếu phần thiếu là heading/media/cấu hình section. Tắt Listing Page không tự ẩn route hoặc các card con đã published.
4. Nội dung có gắn đúng quan hệ cha/category/topic/area không.
5. Có nhiều bản ghi cấu hình active làm website lấy nhầm bản ghi đầu tiên không.
6. Tải lại mạnh bằng `Ctrl+F5`.

### Trang chi tiết trả về 404

- Kiểm tra slug trong URL.
- Kiểm tra active + published.
- Kiểm tra URL đang dùng đúng prefix của module.
- Kiểm tra nội dung có bị đổi slug sau khi link được tạo không.

### Thứ tự hiển thị sai

- Kiểm tra `display_order` ở cả nội dung cha và inline.
- Với các item có `number`, website có thể sắp theo `number` thay vì `display_order`.
- Với chuyên gia, thứ tự thường là `display_order` rồi tới tên.

### CTA chuyên gia không lọc đúng

- Dùng `/chuyen-gia/?area=<slug>#tim-kiem`.
- Đối chiếu `<slug>` với slug của Research Area.
- Kiểm tra chuyên gia đã được gán Research Area đó.
- Kiểm tra chuyên gia active + published.

### Ảnh không hiển thị

- Kiểm tra đã lưu bản ghi sau upload.
- Kiểm tra file còn tồn tại trong media storage.
- Kiểm tra định dạng ảnh được trình duyệt hỗ trợ.
- Upload ảnh thay thế nếu file cũ bị lỗi; không chỉ sửa tên file ngoài Admin.

### Form liên hệ hoặc yêu cầu tải xuống không có dữ liệu

- Gửi thử form ngoài website.
- Kiểm tra thông báo thành công.
- Kiểm tra đúng danh sách `Contact Requests` hoặc `Knowledge Download Requests`.
- Nếu vẫn không có bản ghi, chuyển đội kỹ thuật kiểm tra log và database.

---

## 16. Sao lưu và thay đổi lớn

Trước khi thay đổi hàng loạt:

1. Sao lưu database và thư mục media.
2. Ghi lại URL và trạng thái nội dung hiện tại.
3. Thử trên môi trường staging/local nếu có.
4. Không chạy lại seed command trên production nếu chưa biết command có ghi đè dữ liệu Admin hay không.
5. Không chạy migration `--fake` trong quy trình biên tập nội dung.
6. Sau thay đổi, kiểm tra các trang public chính và các form.

Seed và migration là công cụ của đội kỹ thuật. Người quản trị nội dung thông thường chỉ thao tác trong `/admin/`.

---

## 17. Phân công trách nhiệm khuyến nghị

| Vai trò | Trách nhiệm |
|---|---|
| Content Editor | Soạn nội dung, upload ảnh, nhập SEO, để unpublished khi đang làm |
| Content Reviewer | Kiểm tra nội dung, URL, hình ảnh, phân loại và hiển thị |
| Publisher | Bật published/active và xác nhận ngoài website |
| Administrator | Quản lý tài khoản, menu, cấu hình chung và quyền |
| Technical Team | Template, migration, seed, lỗi hệ thống, media storage và deploy |

Django Admin áp dụng quyền theo tài khoản/nhóm. Chỉ cấp quyền Add/Change/Delete/View đúng module người dùng phụ trách; hạn chế quyền xóa và quyền quản trị hệ thống.

---

## 18. Tham chiếu kỹ thuật

Tài liệu này phản ánh các admin registration và luồng hiển thị hiện tại trong:

- `apps/core/admin.py`
- `apps/home/admin.py`
- `apps/about/admin.py`
- `apps/solution/admin.py`
- `apps/capability/admin.py`
- `apps/knowledge/admin.py`
- `apps/expert/admin.py`
- `apps/contact/admin.py`
- Các `services.py`, `views.py`, `urls.py` tương ứng.

Khi đội kỹ thuật thêm model, section hoặc trạng thái mới, cần cập nhật tài liệu này cùng thay đổi code.
