"""Safe rich-text normalization and image importing for Knowledge content."""

from __future__ import annotations

import base64
import binascii
import ipaddress
import socket
from html import escape
from io import BytesIO
from pathlib import Path
from urllib.parse import urljoin, urlparse
from uuid import uuid4

import nh3
import requests
from bs4 import BeautifulSoup
from django.core.files.base import ContentFile
from django.core.files.storage import default_storage
from PIL import Image, UnidentifiedImageError

MAX_IMAGE_BYTES = 10 * 1024 * 1024
MAX_REDIRECTS = 3
IMAGE_TIMEOUT_SECONDS = 10
ALLOWED_IMAGE_FORMATS = {
    "JPEG": ("jpg", "image/jpeg"),
    "PNG": ("png", "image/png"),
    "WEBP": ("webp", "image/webp"),
    "GIF": ("gif", "image/gif"),
}
ALLOWED_TAGS = {
    "a", "blockquote", "br", "caption", "code", "em", "figcaption", "figure",
    "h2", "h3", "h4", "hr", "img", "li", "ol", "p", "pre", "s", "strong",
    "sub", "sup", "table", "tbody", "td", "th", "thead", "tr", "u", "ul",
}
ALLOWED_ATTRIBUTES = {
    "a": {"href", "target", "title"},
    "img": {"alt", "height", "src", "title", "width"},
    "ol": {"reversed", "start"},
    "td": {"colspan", "rowspan"},
    "th": {"colspan", "rowspan", "scope"},
}
ALLOWED_CLASSES = {
    "figure": {"image", "image-style-align-center", "image-style-align-left", "image-style-align-right", "image-style-side"},
}


class RichTextImageError(ValueError):
    """Raised when a pasted image cannot be imported safely."""


def _is_plain_text(value: str) -> bool:
    return not BeautifulSoup(value, "html.parser").find()


def _plain_text_to_html(value: str) -> str:
    paragraphs = []
    for block in value.replace("\r\n", "\n").replace("\r", "\n").split("\n\n"):
        if block.strip():
            paragraphs.append(f"<p>{'<br>'.join(escape(line) for line in block.splitlines())}</p>")
    return "".join(paragraphs)


def _validate_public_host(hostname: str) -> None:
    try:
        addresses = {item[4][0] for item in socket.getaddrinfo(hostname, None)}
    except socket.gaierror as exc:
        raise RichTextImageError("Không thể phân giải máy chủ chứa ảnh.") from exc

    if not addresses or any(not ipaddress.ip_address(address).is_global for address in addresses):
        raise RichTextImageError("Không cho phép tải ảnh từ địa chỉ mạng nội bộ.")


def _download_remote_image(url: str) -> bytes:
    current_url = url
    for _ in range(MAX_REDIRECTS + 1):
        parsed = urlparse(current_url)
        if parsed.scheme not in {"http", "https"} or not parsed.hostname:
            raise RichTextImageError("URL ảnh phải sử dụng HTTP hoặc HTTPS.")
        _validate_public_host(parsed.hostname)

        try:
            response = requests.get(
                current_url,
                allow_redirects=False,
                stream=True,
                timeout=IMAGE_TIMEOUT_SECONDS,
                headers={"User-Agent": "IRDM content image importer/1.0"},
            )
        except requests.RequestException as exc:
            raise RichTextImageError("Không thể tải ảnh từ trang nguồn.") from exc

        if response.is_redirect or response.is_permanent_redirect:
            location = response.headers.get("Location")
            response.close()
            if not location:
                raise RichTextImageError("Trang nguồn trả về chuyển hướng ảnh không hợp lệ.")
            current_url = urljoin(current_url, location)
            continue

        try:
            response.raise_for_status()
            content_length = response.headers.get("Content-Length")
            if content_length and int(content_length) > MAX_IMAGE_BYTES:
                raise RichTextImageError("Ảnh vượt quá giới hạn 10 MB.")

            chunks = []
            size = 0
            for chunk in response.iter_content(64 * 1024):
                size += len(chunk)
                if size > MAX_IMAGE_BYTES:
                    raise RichTextImageError("Ảnh vượt quá giới hạn 10 MB.")
                chunks.append(chunk)
            return b"".join(chunks)
        except requests.RequestException as exc:
            raise RichTextImageError("Không thể tải ảnh từ trang nguồn.") from exc
        finally:
            response.close()

    raise RichTextImageError("Ảnh chuyển hướng quá nhiều lần.")


def _decode_data_image(source: str) -> bytes:
    try:
        header, payload = source.split(",", 1)
        if ";base64" not in header:
            raise RichTextImageError("Ảnh clipboard không đúng định dạng base64.")
        data = base64.b64decode(payload, validate=True)
    except (ValueError, binascii.Error) as exc:
        raise RichTextImageError("Ảnh clipboard không hợp lệ.") from exc
    if len(data) > MAX_IMAGE_BYTES:
        raise RichTextImageError("Ảnh vượt quá giới hạn 10 MB.")
    return data


def _save_image(data: bytes) -> str:
    try:
        with Image.open(BytesIO(data)) as image:
            image.verify()
            image_format = image.format
    except (UnidentifiedImageError, OSError) as exc:
        raise RichTextImageError("Nội dung được dán có tệp không phải hình ảnh hợp lệ.") from exc

    if image_format not in ALLOWED_IMAGE_FORMATS:
        raise RichTextImageError("Chỉ hỗ trợ ảnh JPEG, PNG, WebP hoặc GIF.")

    extension, _ = ALLOWED_IMAGE_FORMATS[image_format]
    path = Path("knowledge/articles/body") / f"{uuid4().hex}.{extension}"
    stored_name = default_storage.save(path.as_posix(), ContentFile(data))
    return default_storage.url(stored_name)


def _localize_images(soup: BeautifulSoup) -> None:
    for image in soup.find_all("img"):
        source = (image.get("src") or "").strip()
        if not source:
            image.decompose()
            continue
        if source.startswith("data:image/"):
            image["src"] = _save_image(_decode_data_image(source))
        elif source.startswith(("http://", "https://")):
            image["src"] = _save_image(_download_remote_image(source))
        elif not source.startswith("/media/"):
            image.decompose()


def normalize_rich_text(value: str) -> str:
    """Import pasted images and return sanitized, storage-safe article HTML."""
    value = (value or "").strip()
    if not value:
        return ""
    if _is_plain_text(value):
        value = _plain_text_to_html(value)

    soup = BeautifulSoup(value, "html.parser")
    _localize_images(soup)
    return sanitize_rich_text(str(soup))


def sanitize_rich_text(value: str) -> str:
    """Sanitize stored rich text again before public rendering."""
    value = value or ""
    if _is_plain_text(value):
        value = _plain_text_to_html(value)
    return nh3.clean(
        value,
        tags=ALLOWED_TAGS,
        attributes=ALLOWED_ATTRIBUTES,
        allowed_classes=ALLOWED_CLASSES,
        url_schemes={"http", "https", "mailto"},
    )
