"""Django settings for the IRDM Website project."""

import sys
import environ
from pathlib import Path

# Increase Python recursion limit to handle deeply nested Django template
# rendering (listing page renders 5 full audience sections inline)
sys.setrecursionlimit(10000)

# Base directory of the project
BASE_DIR = Path(__file__).resolve().parent.parent

# Load environment variables
env = environ.Env(
    DEBUG=(bool, False),
    ALLOWED_HOSTS=(list, []),
)
#environ.Env.read_env(BASE_DIR / ".env")
#environ.Env.read_env(BASE_DIR / ".env")
PROJECT_ROOT = BASE_DIR.parent
environ.Env.read_env(PROJECT_ROOT / ".env")

# ─── Security ────────────────────────────────────────────────────────────────

SECRET_KEY = env("SECRET_KEY")
DEBUG = env.bool("DEBUG", default=False)
ALLOWED_HOSTS = env.list("ALLOWED_HOSTS", default=[])
CSRF_TRUSTED_ORIGINS = env.list("CSRF_TRUSTED_ORIGINS", default=[])

# HTTPS is terminated by Nginx before requests are forwarded to Django.
SECURE_PROXY_SSL_HEADER = ("HTTP_X_FORWARDED_PROTO", "https")
CSRF_COOKIE_SECURE = not DEBUG
SESSION_COOKIE_SECURE = not DEBUG

# ─── Application ─────────────────────────────────────────────────────────────

INSTALLED_APPS = [
    # WhiteNoise must precede staticfiles
    "whitenoise.runserver_nostatic",
    # Django built-ins
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "django_ckeditor_5",
    # Shared
    "apps.common.apps.CommonConfig",
    "apps.core.apps.CoreConfig",
    # Website
    "apps.website.apps.WebsiteConfig",
    "apps.home.apps.HomeConfig",
    "apps.about.apps.AboutConfig",
    "apps.solution.apps.SolutionConfig",
    "apps.capability.apps.CapabilityConfig",
    "apps.expert.apps.ExpertConfig",
    "apps.insight.apps.InsightConfig",
    "apps.event.apps.EventConfig",
    "apps.resource.apps.ResourceConfig",
    "apps.contact.apps.ContactConfig",
    # Knowledge
    "apps.knowledge.apps.KnowledgeConfig",
    # CMS
    "apps.cms.apps.CmsConfig",
    # Administration
    "apps.administration.apps.AdministrationConfig",
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "whitenoise.middleware.WhiteNoiseMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.locale.LocaleMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]

ROOT_URLCONF = "config.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [BASE_DIR / "templates"],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
                "apps.core.context_processors.global_context",
            ],
        },
    },
]

WSGI_APPLICATION = "config.wsgi.application"

# ─── Database ─────────────────────────────────────────────────────────────────

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "HOST": env("DATABASE_HOST"),
        "PORT": env.int("DATABASE_PORT"),
        "NAME": env("DATABASE_NAME"),
        "USER": env("DATABASE_USER"),
        "PASSWORD": env("DATABASE_PASSWORD"),
    }
}

# ─── Authentication ───────────────────────────────────────────────────────────

AUTH_PASSWORD_VALIDATORS = [
    {"NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator"},
    {"NAME": "django.contrib.auth.password_validation.MinimumLengthValidator"},
    {"NAME": "django.contrib.auth.password_validation.CommonPasswordValidator"},
    {"NAME": "django.contrib.auth.password_validation.NumericPasswordValidator"},
]

# ─── Internationalization ─────────────────────────────────────────────────────

LANGUAGE_CODE = env("LANGUAGE_CODE", default="en")
TIME_ZONE = env("TIME_ZONE", default="UTC")
USE_I18N = True
USE_TZ = True

# SMTP connection details are managed in CMS. This key encrypts the stored App Password.
EMAIL_CREDENTIAL_KEY = env("EMAIL_CREDENTIAL_KEY", default=SECRET_KEY)
EMAIL_BACKEND = env(
    "EMAIL_BACKEND",
    default="django.core.mail.backends.smtp.EmailBackend",
)

LANGUAGES = [
    ("en", "English"),
    ("vi", "Tiếng Việt"),
]

LOCALE_PATHS = [
    BASE_DIR / "locale",
]

# ─── Static Files ─────────────────────────────────────────────────────────────

STATIC_URL = "/static/"
STATIC_ROOT = BASE_DIR / "staticfiles"
STATICFILES_DIRS = [BASE_DIR / "static"]

STORAGES = {
    "default": {
        "BACKEND": "django.core.files.storage.FileSystemStorage",
    },
    "staticfiles": {
        "BACKEND": "whitenoise.storage.CompressedManifestStaticFilesStorage",
    },
}

# ─── Media Files ──────────────────────────────────────────────────────────────

MEDIA_URL = "/media/"
MEDIA_ROOT = BASE_DIR / "media"

CKEDITOR_5_FILE_UPLOAD_PERMISSION = "staff"
CKEDITOR_5_MAX_FILE_SIZE = 10
CKEDITOR_5_UPLOAD_FILE_TYPES = ["jpeg", "jpg", "png", "gif", "webp"]
CKEDITOR_5_FILE_STORAGE = "apps.knowledge.storage.KnowledgeBodyImageStorage"
CKEDITOR_5_USER_LANGUAGE = True
CKEDITOR_5_CONFIGS = {
    "knowledge": {
        "language": ["en", "vi"],
        "toolbar": {
            "items": [
                "undo", "redo", "|", "heading", "|", "bold", "italic", "underline",
                "link", "|", "bulletedList", "numberedList", "blockQuote", "|",
                "insertImage", "insertTable", "horizontalLine", "removeFormat",
            ],
            "shouldNotGroupWhenFull": True,
        },
        "heading": {
            "options": [
                {"model": "paragraph", "title": "Đoạn văn", "class": "ck-heading_paragraph"},
                {"model": "heading2", "view": "h2", "title": "Tiêu đề 2", "class": "ck-heading_heading2"},
                {"model": "heading3", "view": "h3", "title": "Tiêu đề 3", "class": "ck-heading_heading3"},
                {"model": "heading4", "view": "h4", "title": "Tiêu đề 4", "class": "ck-heading_heading4"},
            ],
        },
        "image": {
            "toolbar": [
                "imageTextAlternative", "toggleImageCaption", "|",
                "imageStyle:alignLeft", "imageStyle:alignCenter", "imageStyle:alignRight",
            ],
        },
        "table": {
            "contentToolbar": ["tableColumn", "tableRow", "mergeTableCells"],
        },
    },
}

# ─── Logging ─────────────────────────────────────────────────────────────────

LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "verbose": {
            "format": "{levelname} {asctime} {module} {message}",
            "style": "{",
        },
    },
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
            "formatter": "verbose",
        },
    },
    "root": {
        "handlers": ["console"],
        "level": "WARNING",
    },
    "loggers": {
        "django": {
            "handlers": ["console"],
            "level": "INFO",
            "propagate": False,
        },
        "django.security": {
            "handlers": ["console"],
            "level": "WARNING",
            "propagate": False,
        },
    },
}

# ─── Primary Key ──────────────────────────────────────────────────────────────

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"
