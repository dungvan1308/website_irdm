"""Knowledge & Industry Insights domain models."""

from django.db import models
from django.utils.translation import gettext_lazy as _

from apps.common.models import BaseModel


# ─── Listing Page CMS ─────────────────────────────────────────────────────────

class KnowledgeListingPage(BaseModel):
    """CMS-editable listing page for /tri-thuc-goc-nhin/."""

    section_label = models.CharField(_("section label"), max_length=200, blank=True)
    heading = models.CharField(_("heading"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    hero_image = models.ImageField(
        _("hero image / illustration"), upload_to="knowledge/listing/", blank=True,
        help_text=_("Right-side illustration image in the hero section."),
    )
    hero_cta_primary_label = models.CharField(_("hero CTA primary label"), max_length=100, blank=True)
    hero_cta_primary_url = models.CharField(_("hero CTA primary URL"), max_length=500, blank=True)
    hero_cta_secondary_label = models.CharField(_("hero CTA secondary label"), max_length=100, blank=True)
    hero_cta_secondary_url = models.CharField(_("hero CTA secondary URL"), max_length=500, blank=True)
    search_enabled = models.BooleanField(_("search enabled"), default=True)
    search_placeholder = models.CharField(
        _("search placeholder"),
        max_length=200,
        blank=True,
        help_text=_("Placeholder text inside the search box."),
    )
    filter_section_heading = models.CharField(_("filter section heading"), max_length=300, blank=True)
    filter_section_description = models.TextField(_("filter section description"), blank=True)

    featured_section_label = models.CharField(_("featured section label"), max_length=200, blank=True)
    featured_section_heading = models.CharField(_("featured section heading"), max_length=300, blank=True)
    featured_section_description = models.TextField(
        _("featured section description"), blank=True,
        help_text=_("Mô tả ngắn hiển thị dưới tiêu đề section Nội dung nổi bật."),
    )
    featured_bg_image = models.ImageField(
        _("featured section background image"),
        upload_to="knowledge/featured/bg/", blank=True,
        help_text=_("Ảnh nền phía sau section Nội dung nổi bật."),
    )
    featured_bg_decoration = models.ImageField(
        _("featured section decoration"),
        upload_to="knowledge/featured/deco/", blank=True,
        help_text=_("Họa tiết trang trí (dots, circles) hiển thị phía sau card."),
    )

    cta_sub = models.CharField(_("CTA sub-heading"), max_length=200, blank=True)
    cta_heading = models.CharField(_("CTA heading"), max_length=300, blank=True)
    cta_background_image = models.ImageField(
        _("CTA background image"), upload_to="knowledge/cta/", blank=True,
    )
    cta_primary_label = models.CharField(_("CTA primary label"), max_length=100, blank=True)
    cta_primary_url = models.CharField(_("CTA primary URL"), max_length=500, blank=True)
    cta_secondary_label = models.CharField(_("CTA secondary label"), max_length=100, blank=True)
    cta_secondary_url = models.CharField(_("CTA secondary URL"), max_length=500, blank=True)

    meta_title = models.CharField(_("meta title"), max_length=200, blank=True)
    meta_description = models.CharField(_("meta description"), max_length=300, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("knowledge listing page")
        verbose_name_plural = _("knowledge listing pages")

    def __str__(self) -> str:
        return self.heading


# ─── Category ─────────────────────────────────────────────────────────────────

class KnowledgeCategory(BaseModel):
    """A top-level category for grouping articles, downloads and news."""

    label = models.CharField(_("label"), max_length=200)
    slug = models.SlugField(_("slug"), max_length=200, unique=True, db_index=True)
    heading = models.CharField(_("heading"), max_length=300, blank=True)
    description = models.TextField(_("description"), blank=True)
    icon = models.CharField(_("icon"), max_length=100, blank=True)
    cover_image = models.ImageField(
        _("cover image"), upload_to="knowledge/categories/", blank=True,
    )
    is_published = models.BooleanField(_("published"), default=False, db_index=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("knowledge category")
        verbose_name_plural = _("knowledge categories")

    def __str__(self) -> str:
        return self.label


# ─── Topic ────────────────────────────────────────────────────────────────────

class KnowledgeTopic(BaseModel):
    """A filter tag topic for articles and news."""

    label = models.CharField(_("label"), max_length=200)
    slug = models.SlugField(_("slug"), max_length=200, unique=True, db_index=True)
    description = models.TextField(_("description"), blank=True)
    icon = models.CharField(_("icon"), max_length=100, blank=True)
    cover_image = models.ImageField(
        _("cover image"), upload_to="knowledge/topics/", blank=True,
        help_text=_("Thumbnail shown on topic browse cards."),
    )
    is_published = models.BooleanField(_("published"), default=False, db_index=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("knowledge topic")
        verbose_name_plural = _("knowledge topics")

    def __str__(self) -> str:
        return self.label


# ─── Article ──────────────────────────────────────────────────────────────────

class KnowledgeArticle(BaseModel):
    """A knowledge article or research insight."""

    title = models.CharField(_("title"), max_length=300)
    slug = models.SlugField(_("slug"), max_length=300, unique=True, db_index=True)
    category = models.ForeignKey(
        KnowledgeCategory,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="articles",
        verbose_name=_("category"),
    )
    topics = models.ManyToManyField(
        KnowledgeTopic,
        blank=True,
        related_name="articles",
        verbose_name=_("topics"),
    )
    summary = models.TextField(_("summary"), blank=True)
    body = models.TextField(_("body"), blank=True)
    thumbnail = models.ImageField(
        _("thumbnail"), upload_to="knowledge/articles/thumbnails/", blank=True,
    )
    hero_image = models.ImageField(
        _("hero image"), upload_to="knowledge/articles/hero/", blank=True,
    )
    author_name = models.CharField(_("author name"), max_length=200, blank=True)
    published_date = models.DateField(_("published date"), null=True, blank=True)
    read_time = models.PositiveIntegerField(
        _("read time (minutes)"), default=5,
        help_text=_("Estimated reading time in minutes."),
    )
    is_featured = models.BooleanField(_("featured"), default=False, db_index=True)
    is_published = models.BooleanField(_("published"), default=False, db_index=True)

    related_capabilities = models.ManyToManyField(
        "capability.Capability",
        blank=True,
        related_name="knowledge_articles",
        verbose_name=_("related capabilities"),
    )

    meta_title = models.CharField(_("meta title"), max_length=200, blank=True)
    meta_description = models.CharField(_("meta description"), max_length=300, blank=True)
    meta_keywords = models.CharField(_("meta keywords"), max_length=300, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("knowledge article")
        verbose_name_plural = _("knowledge articles")

    def __str__(self) -> str:
        return self.title

    def get_absolute_url(self) -> str:
        from django.urls import reverse
        return reverse("knowledge:detail", kwargs={"slug": self.slug})


# ─── Featured Article ─────────────────────────────────────────────────────────

class KnowledgeFeaturedArticle(BaseModel):
    """Editorial pin of an article in the featured section of the listing page."""

    listing_page = models.ForeignKey(
        KnowledgeListingPage,
        on_delete=models.CASCADE,
        related_name="featured_articles",
        verbose_name=_("listing page"),
    )
    article = models.ForeignKey(
        KnowledgeArticle,
        on_delete=models.CASCADE,
        related_name="featured_pins",
        verbose_name=_("article"),
    )
    badge_text = models.CharField(
        _("badge text"), max_length=100, blank=True,
        help_text=_("Nhãn badge trên ảnh card. Nếu trống, dùng tên category của bài viết."),
    )
    cta_text = models.CharField(
        _("CTA text"), max_length=200, blank=True,
        help_text=_("Ví dụ: Đọc bài viết, Đăng ký tải tài liệu, Xem sự kiện"),
    )
    cta_icon = models.CharField(
        _("CTA icon"), max_length=50, blank=True,
        choices=[
            ("arrow-right", "Arrow Right →"),
            ("download", "Download ↓"),
            ("external", "External ↗"),
        ],
        default="arrow-right",
    )
    cta_url = models.CharField(
        _("CTA URL override"), max_length=500, blank=True,
        help_text=_("Nếu trống, dùng URL của bài viết."),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("featured article")
        verbose_name_plural = _("featured articles")
        unique_together = [("listing_page", "article")]

    def __str__(self) -> str:
        return f"{self.listing_page} — {self.article}"

    def get_cta_url(self) -> str:
        """Return CTA URL override if set, otherwise fallback to article URL."""
        return self.cta_url or self.article.get_absolute_url()


# ─── Download ─────────────────────────────────────────────────────────────────

class KnowledgeDownload(BaseModel):
    """A downloadable publication or report."""

    title = models.CharField(_("title"), max_length=300)
    slug = models.SlugField(_("slug"), max_length=300, unique=True, db_index=True)
    summary = models.TextField(_("summary"), blank=True)
    cover_image = models.ImageField(
        _("cover image"), upload_to="knowledge/downloads/", blank=True,
    )
    file = models.FileField(
        _("file"), upload_to="knowledge/downloads/files/", blank=True,
        help_text=_("Uploaded PDF or document file."),
    )
    file_type_label = models.CharField(
        _("file type label"), max_length=50, blank=True,
        help_text=_("Display label, e.g. PDF"),
    )
    file_size_label = models.CharField(
        _("file size label"), max_length=50, blank=True,
        help_text=_("Display label, e.g. 2.3 MB"),
    )
    category = models.ForeignKey(
        KnowledgeCategory,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="downloads",
        verbose_name=_("category"),
    )
    published_date = models.DateField(_("published date"), null=True, blank=True)
    is_published = models.BooleanField(_("published"), default=False, db_index=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("knowledge download")
        verbose_name_plural = _("knowledge downloads")

    def __str__(self) -> str:
        return self.title


# ─── News Item ────────────────────────────────────────────────────────────────

class KnowledgeNewsItem(BaseModel):
    """A news headline or industry update."""

    title = models.CharField(_("title"), max_length=300)
    slug = models.SlugField(_("slug"), max_length=300, unique=True, db_index=True)
    summary = models.TextField(_("summary"), blank=True)
    thumbnail = models.ImageField(
        _("thumbnail"), upload_to="knowledge/news/", blank=True,
    )
    published_date = models.DateField(_("published date"), null=True, blank=True)
    source_url = models.URLField(_("source URL"), blank=True)
    category = models.ForeignKey(
        KnowledgeCategory,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="news_items",
        verbose_name=_("category"),
    )
    topics = models.ManyToManyField(
        KnowledgeTopic,
        blank=True,
        related_name="news_items",
        verbose_name=_("topics"),
    )
    is_published = models.BooleanField(_("published"), default=False, db_index=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("knowledge news item")
        verbose_name_plural = _("knowledge news items")

    def __str__(self) -> str:
        return self.title


# ─── Filter Groups ─────────────────────────────────────────────────────────────────

class KnowledgeFilterGroup(BaseModel):
    """A labelled group of filter tags shown in the filter section of the listing page."""

    title = models.CharField(
        _("group title"), max_length=200,
        help_text=_("Nhãn hiển thị phía trên nhóm, e.g. THEO LOẠI NỘI DUNG."),
    )
    param_key = models.SlugField(
        _("URL param key"), max_length=50, unique=True,
        help_text=_("Tên URL query param dùng cho nhóm này, e.g. ctype, topic, partner."),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("filter group")
        verbose_name_plural = _("filter groups")

    def __str__(self) -> str:
        return self.title


class KnowledgeFilterItem(BaseModel):
    """A single selectable tag inside a filter group."""

    group = models.ForeignKey(
        KnowledgeFilterGroup,
        on_delete=models.CASCADE,
        related_name="items",
        verbose_name=_("group"),
    )
    label = models.CharField(_("label"), max_length=200)
    value = models.CharField(
        _("value"), max_length=200,
        help_text=_("Slug value dùng làm URL query param value."),
    )
    color_default = models.CharField(
        _("default color"), max_length=30, default="#6b7280",
        help_text=_("Màu border & text mặc định (hex), e.g. #6b7280."),
    )
    color_active = models.CharField(
        _("active color"), max_length=30, default="#f97316",
        help_text=_("Màu border & text khi active (hex), e.g. #f97316."),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("filter item")
        verbose_name_plural = _("filter items")
        unique_together = [("group", "value")]

    def __str__(self) -> str:
        return f"{self.group.title} — {self.label}"
