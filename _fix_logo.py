"""Fix SiteSettings logo fields to point to existing media files."""
import os
import sys
import django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings")
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
django.setup()

from django.core.files import File
from apps.core.models import SiteSettings

s = SiteSettings.objects.first()

logo_path = "media/core/logo/irdm-logo.png"
logo_white_path = "media/core/logo/irdm-logo-white.png"

if os.path.exists(logo_path) and not s.logo:
    with open(logo_path, "rb") as f:
        s.logo.save("irdm-logo.png", File(f), save=True)
    print("Logo set:", s.logo.name)
elif s.logo:
    print("Logo already set:", s.logo.name)
else:
    print("Logo file not found:", logo_path)

if os.path.exists(logo_white_path) and not s.logo_white:
    with open(logo_white_path, "rb") as f:
        s.logo_white.save("irdm-logo-white.png", File(f), save=True)
    print("Logo white set:", s.logo_white.name)
elif s.logo_white:
    print("Logo white already set:", s.logo_white.name)
else:
    print("Logo white file not found:", logo_white_path)
