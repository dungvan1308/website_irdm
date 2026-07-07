"""
Management command: seed_website

Seeds global Website components:
  - SiteSettings  (logo, contact, social links, Google Map)
  - Header navigation (MenuItem)
  - Footer navigation (MenuItem)
  - Footer sections and links (FooterSection / FooterLink)

This command is idempotent — safe to run multiple times.

Usage:
    python manage.py seed_website
"""

import io
import pathlib

from django.core.files.base import ContentFile
from django.core.management.base import BaseCommand

from apps.core.models import FooterLink, FooterSection, MenuItem, SiteSettings


# ─── Site Settings ─────────────────────────────────────────────────────────────

SITE_SETTINGS = {
    "site_name": "IRDM",
    "site_tagline": "Viện Nghiên cứu Phát triển Nguồn lực Việt",
    "site_description": (
        "Viện Nghiên cứu Phát triển Nguồn lực Việt (IRDM) là tổ chức Khoa học, "
        "Công nghệ và Đổi mới sáng tạo, hoạt động nghiên cứu và ứng dụng các "
        "giải pháp phát triển bền vững cho cơ quan quản lý, hệ thống y tế, "
        "trường đại học, doanh nghiệp và tổ chức quốc tế."
    ),
    "email": "vienncptnlv@irdm.edu.vn",
    "phone": "(+84) 33 656 7701",
    "address": "8C Trần Huy Liệu, Phường Phú Nhuận, TP.HCM",
    "operating_hours": "Thứ 2 đến Thứ 6 | 8h00 – 17h00",
    "map_embed_url": (
        "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.3!2d106.6800!3d10.7800"
        "!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2z8C!5e0!3m2!1svi"
        "!2svn!4v1000000000000"
    ),
    "facebook_url": "https://facebook.com/irdm",
    "youtube_url": "https://youtube.com/@irdm",
    "linkedin_url": "https://linkedin.com/company/irdm",
    "twitter_url": "",
    "is_active": True,
    "display_order": 0,
}


# ─── Header Navigation ────────────────────────────────────────────────────────

HEADER_MENU = [
    ("Trang chủ",               "/",                           10),
    ("Giải pháp",               "/giai-phap/",                 20),
    ("Năng lực cốt lõi",        "/capabilities/",              30),
    ("Tri thức & Góc nhìn",     "/tri-thuc-goc-nhin/",         40),
    ("Đội ngũ chuyên gia",      "/chuyen-gia/",                50),
    ("Về IRDM",                 "/ve-irdm/",                   60),
    ("Liên hệ",                 "/lien-he/",                   70),
]


# ─── Footer Navigation ────────────────────────────────────────────────────────

FOOTER_MENU = [
    ("Trang chủ",               "/",                           10),
    ("Giải pháp",               "/giai-phap/",                 20),
    ("Năng lực cốt lõi",        "/capabilities/",              30),
    ("Về IRDM",                 "/ve-irdm/",                   40),
    ("Liên hệ",                 "/lien-he/",                   50),
]


# ─── Footer Sections ──────────────────────────────────────────────────────────

FOOTER_SECTIONS = [
    (
        "Giải pháp",
        10,
        [
            ("Cơ quan quản lý & Chính sách",  "/giai-phap/co-quan-quan-ly-va-chinh-sach/", 10),
            ("Hệ thống y tế",                  "/giai-phap/he-thong-y-te/",                 20),
            ("Trường đại học & Giáo dục",      "/giai-phap/truong-dai-hoc-va-giao-duc/",    30),
            ("Doanh nghiệp",                   "/giai-phap/doanh-nghiep/",                  40),
            ("Tổ chức quốc tế & NGO",          "/giai-phap/to-chuc-quoc-te-va-ngo/",        50),
        ],
    ),
    (
        "Tri thức & Góc nhìn",
        20,
        [
            ("Xuất bản & Tài liệu",   "/tri-thuc-goc-nhin/",   10),
            ("Sự kiện & Diễn đàn",    "/tri-thuc-goc-nhin/",   20),
            ("Góc nhìn từ Đối tác",   "/tri-thuc-goc-nhin/",   30),
            ("Truyền thông",          "/tri-thuc-goc-nhin/",   40),
        ],
    ),
    (
        "Về IRDM",
        30,
        [
            ("Giới thiệu",        "/ve-irdm/",    10),
            ("Đội ngũ chuyên gia", "/chuyen-gia/", 20),
            ("Đối tác",           "/doi-tac/",    30),
            ("Liên hệ",           "/lien-he/",    40),
        ],
    ),
]


# ─── Logo helper ──────────────────────────────────────────────────────────────

def _make_logo_png(
    text: str,
    width: int = 300,
    height: int = 80,
    bg_rgb: tuple = (10, 30, 80),
    text_rgb: tuple = (255, 255, 255),
) -> bytes:
    """Generate a simple text logo PNG using Pillow."""
    try:
        from PIL import Image, ImageDraw, ImageFont

        img = Image.new("RGBA", (width, height), (0, 0, 0, 0))
        draw = ImageDraw.Draw(img)

        # Background pill
        draw.rounded_rectangle([0, 0, width - 1, height - 1], radius=12, fill=bg_rgb)

        # Text centred
        try:
            font = ImageFont.truetype("arial.ttf", 28)
        except OSError:
            font = ImageFont.load_default()

        bbox = draw.textbbox((0, 0), text, font=font)
        tw, th = bbox[2] - bbox[0], bbox[3] - bbox[1]
        draw.text(((width - tw) // 2, (height - th) // 2), text, fill=text_rgb, font=font)

        buf = io.BytesIO()
        img.save(buf, format="PNG")
        return buf.getvalue()
    except Exception:
        # Fallback: 1x1 transparent PNG
        return (
            b"\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR\x00\x00\x00\x01\x00\x00\x00\x01"
            b"\x08\x02\x00\x00\x00\x90wS\xde\x00\x00\x00\x0cIDATx\x9cc\xf8\x0f\x00"
            b"\x00\x01\x01\x00\x05\x18\xd8N\x00\x00\x00\x00IEND\xaeB`\x82"
        )


class Command(BaseCommand):
    help = "Seed global Website components: SiteSettings, Header, Footer."

    def handle(self, *args, **options) -> None:
        self.stdout.write(self.style.MIGRATE_HEADING("Seeding Website components..."))

        self._seed_site_settings()
        self._seed_logos()
        self._seed_header_menu()
        self._seed_footer_menu()
        self._seed_footer_sections()

        self.stdout.write(self.style.SUCCESS("\nWebsite seeding complete."))

    # ─── Site Settings ────────────────────────────────────────────────────────

    def _seed_site_settings(self) -> None:
        defaults = {k: v for k, v in SITE_SETTINGS.items() if k != "site_name"}
        site, created = SiteSettings.objects.update_or_create(
            site_name=SITE_SETTINGS["site_name"],
            defaults=defaults,
        )
        self.stdout.write(f"  {'Created' if created else 'Updated'} SiteSettings: {site.site_name}")

    # ─── Logos ────────────────────────────────────────────────────────────────

    def _seed_logos(self) -> None:
        site = SiteSettings.objects.filter(is_active=True).first()
        if site is None:
            return

        # Check for pre-extracted logo files first
        from django.conf import settings as django_settings
        media = pathlib.Path(django_settings.MEDIA_ROOT)

        logo_src = media / "core" / "logo" / "irdm-logo.png"
        logo_white_src = media / "core" / "logo" / "irdm-logo-white.png"

        if not site.logo:
            if logo_src.exists():
                content = ContentFile(logo_src.read_bytes(), name="irdm-logo.png")
                site.logo.save("irdm-logo.png", content, save=True)
                self.stdout.write("  Logo: loaded from media/core/logo/irdm-logo.png")
            else:
                png = _make_logo_png("IRDM", bg_rgb=(10, 30, 80), text_rgb=(255, 255, 255))
                site.logo.save("irdm-logo.png", ContentFile(png, name="irdm-logo.png"), save=True)
                self.stdout.write("  Logo: generated demo logo")
        else:
            self.stdout.write("  Logo: already set, skipping")

        if not site.logo_white:
            if logo_white_src.exists():
                content = ContentFile(logo_white_src.read_bytes(), name="irdm-logo-white.png")
                site.logo_white.save("irdm-logo-white.png", content, save=True)
                self.stdout.write("  Logo (white): loaded from media/core/logo/irdm-logo-white.png")
            else:
                png = _make_logo_png("IRDM", bg_rgb=(255, 255, 255, 0), text_rgb=(255, 255, 255))
                site.logo_white.save(
                    "irdm-logo-white.png",
                    ContentFile(png, name="irdm-logo-white.png"),
                    save=True,
                )
                self.stdout.write("  Logo (white): generated demo logo")
        else:
            self.stdout.write("  Logo (white): already set, skipping")

    # ─── Header Menu ─────────────────────────────────────────────────────────

    def _seed_header_menu(self) -> None:
        for label, url, order in HEADER_MENU:
            obj, created = MenuItem.objects.get_or_create(
                menu=MenuItem.MENU_HEADER,
                label=label,
                parent=None,
                defaults={"url": url, "display_order": order, "is_active": True},
            )
            if not created:
                # Update URL and order if changed
                updated = False
                if obj.url != url:
                    obj.url = url
                    updated = True
                if obj.display_order != order:
                    obj.display_order = order
                    updated = True
                if updated:
                    obj.save(update_fields=["url", "display_order"])
            self.stdout.write(f"  Header menu: {'Created' if created else 'OK'} — {label}")

    # ─── Footer Menu ─────────────────────────────────────────────────────────

    def _seed_footer_menu(self) -> None:
        for label, url, order in FOOTER_MENU:
            obj, created = MenuItem.objects.get_or_create(
                menu=MenuItem.MENU_FOOTER,
                label=label,
                parent=None,
                defaults={"url": url, "display_order": order, "is_active": True},
            )
            if not created:
                updated = False
                if obj.url != url:
                    obj.url = url
                    updated = True
                if updated:
                    obj.save(update_fields=["url"])
            self.stdout.write(f"  Footer menu: {'Created' if created else 'OK'} — {label}")

    # ─── Footer Sections ─────────────────────────────────────────────────────

    def _seed_footer_sections(self) -> None:
        for title, order, links in FOOTER_SECTIONS:
            section, created = FooterSection.objects.get_or_create(
                title=title,
                defaults={"display_order": order, "is_active": True},
            )
            self.stdout.write(f"  Footer section: {'Created' if created else 'OK'} — {title}")

            for link_label, link_url, link_order in links:
                link, link_created = FooterLink.objects.get_or_create(
                    section=section,
                    label=link_label,
                    defaults={"url": link_url, "display_order": link_order, "is_active": True},
                )
                if not link_created and link.url != link_url:
                    link.url = link_url
                    link.save(update_fields=["url"])
