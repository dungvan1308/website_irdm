# Hướng dẫn cấu hình Django trên Ubuntu

Tài liệu này áp dụng cho website IRDM chạy theo mô hình:

```text
Trình duyệt HTTPS -> Nginx -> Gunicorn/Django
```

Tên miền production hiện tại:

```text
https://qlcv.hosgroup.net
```

## 1. Kiểm tra vị trí source và service

Các lệnh trong tài liệu giả định source nằm tại:

```text
/opt/irdm/website_irdm
```

và systemd service có tên:

```text
irdm
```

Kiểm tra service đang chạy:

```bash
sudo systemctl status irdm
sudo systemctl cat irdm
```

Nếu `WorkingDirectory` hoặc tên service khác, thay lại đường dẫn trong các lệnh bên dưới.

## 2. Cập nhật source

```bash
cd /opt/irdm/website_irdm
git pull
```

Kích hoạt virtual environment nếu ứng dụng sử dụng venv:

```bash
source /opt/irdm/venv/bin/activate
```

Kiểm tra Python và Django:

```bash
python --version
python manage.py check
```

## 3. Cấu hình file `.env`

Source hiện đọc file `.env` tại thư mục cha của `website_irdm`:

```text
/opt/irdm/.env
```

Không đặt nhầm tại `/opt/irdm/website_irdm/.env`.

Mở file:

```bash
sudo nano /opt/irdm/.env
```

Cấu hình tối thiểu:

```dotenv
SECRET_KEY=thay-bang-secret-key-dai-va-ngau-nhien
DEBUG=False
ALLOWED_HOSTS=qlcv.hosgroup.net
CSRF_TRUSTED_ORIGINS=https://qlcv.hosgroup.net

DATABASE_HOST=localhost
DATABASE_PORT=5432
DATABASE_NAME=irdm
DATABASE_USER=irdm_user
DATABASE_PASSWORD=thay-bang-mat-khau-database

LANGUAGE_CODE=vi
TIME_ZONE=Asia/Ho_Chi_Minh
```

Lưu ý:

- `DEBUG` bắt buộc là `False` trên production.
- `CSRF_TRUSTED_ORIGINS` phải có đầy đủ giao thức `https://`.
- Không commit file `.env` hoặc đưa secret thật vào Git.
- Giữ nguyên thông tin database đang hoạt động trên server nếu chúng khác ví dụ trên.

Tạo `SECRET_KEY` mạnh bằng Python:

```bash
cd /opt/irdm/website_irdm
python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
```

Sao chép kết quả vào `SECRET_KEY` trong `/opt/irdm/.env`. Việc đổi `SECRET_KEY` sẽ làm các phiên đăng nhập hiện tại hết hiệu lực.

Nếu có thêm tên miền `www`, cấu hình:

```dotenv
ALLOWED_HOSTS=qlcv.hosgroup.net,www.qlcv.hosgroup.net
CSRF_TRUSTED_ORIGINS=https://qlcv.hosgroup.net,https://www.qlcv.hosgroup.net
```

## 4. Cấu hình Nginx

Tìm file cấu hình đang được sử dụng:

```bash
sudo nginx -T | grep -n "server_name qlcv.hosgroup.net"
```

File thường nằm tại một trong các đường dẫn:

```text
/etc/nginx/sites-available/irdm
/etc/nginx/conf.d/irdm.conf
```

Trong server block HTTPS, bảo đảm `location /` có các header proxy sau:

```nginx
server {
    listen 443 ssl;
    server_name qlcv.hosgroup.net;

    # Giữ nguyên cấu hình ssl_certificate hiện có.

    location / {
        proxy_pass http://127.0.0.1:8000;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Dòng quan trọng để Django nhận biết request ban đầu dùng HTTPS:

```nginx
proxy_set_header X-Forwarded-Proto $scheme;
```

Nếu Gunicorn dùng Unix socket, giữ nguyên `proxy_pass` hiện tại và chỉ bổ sung các `proxy_set_header` còn thiếu.

Server HTTP nên chuyển hướng sang HTTPS:

```nginx
server {
    listen 80;
    server_name qlcv.hosgroup.net;

    return 301 https://$host$request_uri;
}
```

Kiểm tra trước khi reload:

```bash
sudo nginx -t
```

Chỉ reload nếu kết quả báo thành công:

```bash
sudo systemctl reload nginx
```

## 5. Kiểm tra Django đang nhận đúng cấu hình

```bash
cd /opt/irdm/website_irdm
source /opt/irdm/venv/bin/activate
python manage.py shell -c "from django.conf import settings; print('DEBUG=', settings.DEBUG); print('ALLOWED_HOSTS=', settings.ALLOWED_HOSTS); print('CSRF_TRUSTED_ORIGINS=', settings.CSRF_TRUSTED_ORIGINS); print('SECURE_PROXY_SSL_HEADER=', settings.SECURE_PROXY_SSL_HEADER); print('CSRF_COOKIE_SECURE=', settings.CSRF_COOKIE_SECURE); print('SESSION_COOKIE_SECURE=', settings.SESSION_COOKIE_SECURE)"
```

Kết quả mong đợi:

```text
DEBUG= False
ALLOWED_HOSTS= ['qlcv.hosgroup.net']
CSRF_TRUSTED_ORIGINS= ['https://qlcv.hosgroup.net']
SECURE_PROXY_SSL_HEADER= ('HTTP_X_FORWARDED_PROTO', 'https')
CSRF_COOKIE_SECURE= True
SESSION_COOKIE_SECURE= True
```

Nếu kết quả không đúng, kiểm tra lại:

1. Django có đọc đúng `/opt/irdm/.env` hay không.
2. Systemd service có khai báo biến môi trường ghi đè `.env` hay không.
3. Service có dùng đúng source vừa cập nhật hay không.

Xem cấu hình service:

```bash
sudo systemctl cat irdm
```

## 6. Chạy kiểm tra và restart ứng dụng

```bash
cd /opt/irdm/website_irdm
source /opt/irdm/venv/bin/activate
python manage.py check --deploy
sudo systemctl restart irdm
sudo systemctl status irdm --no-pager
```

Xem log gần nhất nếu service không khởi động:

```bash
sudo journalctl -u irdm -n 100 --no-pager
```

Theo dõi log trong lúc thử đăng nhập:

```bash
sudo journalctl -u irdm -f
```

## 7. Thử lại Django Admin

Mở:

```text
https://qlcv.hosgroup.net/admin/
```

Trước khi đăng nhập lại:

1. Xóa cookie của `qlcv.hosgroup.net`, hoặc mở cửa sổ ẩn danh.
2. Tải lại trang đăng nhập để nhận CSRF cookie mới.
3. Nhập lại tài khoản và mật khẩu.

Không gửi lại form đăng nhập từ tab đã mở trước khi restart service.

## 8. Nếu vẫn báo CSRF 403

Kiểm tra response và redirect:

```bash
curl -I http://qlcv.hosgroup.net/admin/
curl -I https://qlcv.hosgroup.net/admin/
```

HTTP phải redirect sang HTTPS. HTTPS phải trả về `200` hoặc redirect đến trang đăng nhập admin.

Kiểm tra Nginx có gửi header HTTPS:

```bash
sudo nginx -T | grep -n "X-Forwarded-Proto"
```

Kiểm tra log Nginx:

```bash
sudo tail -n 100 /var/log/nginx/error.log
sudo tail -n 100 /var/log/nginx/access.log
```

Các nguyên nhân thường gặp:

- `CSRF_TRUSTED_ORIGINS` thiếu `https://`.
- Sửa nhầm file `.env` trong thư mục source.
- Chưa restart service `irdm` sau khi sửa `.env`.
- Nginx thiếu `X-Forwarded-Proto`.
- Truy cập bằng domain khác chưa có trong `ALLOWED_HOSTS` và `CSRF_TRUSTED_ORIGINS`.
- Cookie CSRF cũ vẫn còn trong trình duyệt.
- Server vẫn chạy `DEBUG=True` do biến môi trường trong systemd ghi đè `.env`.

## 9. Checklist hoàn tất

- [ ] Source mới đã được pull về server.
- [ ] `/opt/irdm/.env` có `DEBUG=False`.
- [ ] `ALLOWED_HOSTS` chứa `qlcv.hosgroup.net`.
- [ ] `CSRF_TRUSTED_ORIGINS` chứa `https://qlcv.hosgroup.net`.
- [ ] `SECRET_KEY` đủ dài và không dùng giá trị mẫu.
- [ ] Nginx gửi `Host` và `X-Forwarded-Proto`.
- [ ] HTTP redirect sang HTTPS.
- [ ] `sudo nginx -t` thành công.
- [ ] Service `irdm` đã restart và đang active.
- [ ] Kết quả Django shell đúng như mục 5.
- [ ] Đã thử đăng nhập bằng cửa sổ ẩn danh.
