"""Knowledge & Industry Insights domain models."""

from django.db import models
from django.urls import reverse
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

    # ─── Content Type Section ─────────────────────────────────────────────────
    content_type_section_label = models.CharField(
        _("content type section label"), max_length=200, blank=True,
    )
    content_type_section_heading = models.CharField(
        _("content type section heading"), max_length=300, blank=True,
    )
    content_type_section_description = models.TextField(
        _("content type section description"), blank=True,
    )
    content_type_section_bg_image = models.ImageField(
        _("content type section background image"),
        upload_to="knowledge/content_type/bg/", blank=True,
    )
    content_type_section_bg_decoration = models.ImageField(
        _("content type section decorative background"),
        upload_to="knowledge/content_type/deco/", blank=True,
    )
    content_type_section_cta_text = models.CharField(
        _("content type section CTA text"), max_length=100, blank=True,
    )
    content_type_section_cta_icon = models.CharField(
        _("content type section CTA icon"), max_length=50, blank=True,
        choices=[
            ("arrow-right", "Arrow Right →"),
            ("external", "External ↗"),
        ],
    )
    content_type_section_cta_url = models.CharField(
        _("content type section CTA URL"), max_length=500, blank=True,
    )

    # ─── Topic Browse Section ──────────────────────────────────────────────
    topic_section_label = models.CharField(
        _("topic section label"), max_length=200, blank=True,
    )
    topic_section_heading = models.CharField(
        _("topic section heading"), max_length=300, blank=True,
    )
    topic_section_description = models.TextField(
        _("topic section description"), blank=True,
    )
    topic_section_bg_image = models.ImageField(
        _("topic section background image"),
        upload_to="knowledge/topic_section/bg/", blank=True,
    )
    topic_section_bg_decoration = models.ImageField(
        _("topic section decorative background"),
        upload_to="knowledge/topic_section/deco/", blank=True,
    )

    # ─── Publication Section (Ấn phẩm & Báo cáo) ────────────────────────────
    pub_section_label = models.CharField(
        _("publication section label"), max_length=200, blank=True,
        help_text=_("Label nhỏ phía trên tiêu đề, e.g. Ấn phẩm & Báo cáo."),
    )
    pub_section_heading = models.CharField(
        _("publication section heading"), max_length=300, blank=True,
        help_text=_("Tiêu đề section, e.g. Tài liệu tải về."),
    )
    pub_section_description = models.TextField(
        _("publication section description"), blank=True,
        help_text=_("Mô tả ngắn hiển thị dưới tiêu đề section."),
    )
    pub_section_bg_image = models.ImageField(
        _("publication section background image"),
        upload_to="knowledge/pub/bg/", blank=True,
        help_text=_("Ảnh nền toàn section (ví dụ: cityscape, globe illustration)."),
    )
    pub_section_bg_decoration = models.ImageField(
        _("publication section decorative background"),
        upload_to="knowledge/pub/deco/", blank=True,
        help_text=_("Họa tiết trang trí (dots, circles) hiển thị phía sau nội dung."),
    )

    # ─── Publication Form ─────────────────────────────────────────────────────
    pub_form_title = models.CharField(_("form title"), max_length=300, blank=True)
    pub_form_description = models.TextField(_("form description"), blank=True)
    pub_form_name_label = models.CharField(
        _("name field label"), max_length=100, blank=True, default="Họ và tên",
    )
    pub_form_name_placeholder = models.CharField(
        _("name field placeholder"), max_length=200, blank=True,
    )
    pub_form_org_label = models.CharField(
        _("org field label"), max_length=100, blank=True, default="Đơn vị công tác",
    )
    pub_form_org_placeholder = models.CharField(
        _("org field placeholder"), max_length=200, blank=True,
    )
    pub_form_email_label = models.CharField(
        _("email field label"), max_length=100, blank=True, default="Email",
    )
    pub_form_email_placeholder = models.CharField(
        _("email field placeholder"), max_length=200, blank=True,
    )
    pub_form_note_label = models.CharField(
        _("note field label"), max_length=100, blank=True, default="Ghi chú",
    )
    pub_form_note_placeholder = models.TextField(_("note field placeholder"), blank=True)
    pub_form_privacy_note = models.TextField(_("form privacy note"), blank=True)
    pub_form_button_text = models.CharField(
        _("form button text"), max_length=100, blank=True, default="Gửi yêu cầu",
    )
    pub_form_button_icon = models.CharField(
        _("form button icon"), max_length=50, blank=True,
        choices=[("send", "Send ✉"), ("arrow-right", "Arrow Right →")],
        default="send",
    )
    pub_form_success_message = models.TextField(_("form success message"), blank=True)

    # ─── Publication Contact Block ────────────────────────────────────────────
    pub_contact_title = models.CharField(_("contact block title"), max_length=300, blank=True)
    pub_contact_description = models.TextField(_("contact block description"), blank=True)
    pub_contact_email = models.CharField(_("contact email"), max_length=200, blank=True)
    pub_contact_phone = models.CharField(_("contact phone"), max_length=100, blank=True)
    pub_contact_address = models.TextField(_("contact address"), blank=True)
    pub_contact_cta_text = models.CharField(_("contact CTA text"), max_length=200, blank=True)
    pub_contact_cta_icon = models.CharField(
        _("contact CTA icon"), max_length=50, blank=True,
        choices=[("arrow-right", "Arrow Right →"), ("external", "External ↗")],
        default="arrow-right",
    )
    pub_contact_cta_url = models.CharField(_("contact CTA URL"), max_length=500, blank=True)
    pub_contact_city_image = models.ImageField(
        _("contact block city image"),
        upload_to="knowledge/pub/city/", blank=True,
        help_text=_("Ảnh skyline thành phố hiển thị phía dưới contact block."),
    )

    # ─── News & Events Section (Tin tức & Sự kiện) ───────────────────────────
    news_section_label = models.CharField(
        _("news section label"), max_length=200, blank=True,
        help_text=_("Label nhỏ phía trên, e.g. IRDM trên báo chí và diễn đàn chuyên môn."),
    )
    news_section_heading = models.CharField(
        _("news section heading"), max_length=300, blank=True,
        help_text=_("Tiêu đề section, e.g. Tin tức & Sự kiện."),
    )
    news_section_description = models.TextField(
        _("news section description"), blank=True,
        help_text=_("Mô tả ngắn hiển thị dưới tiêu đề section."),
    )
    news_section_bg_image = models.ImageField(
        _("news section background image"),
        upload_to="knowledge/news_section/bg/", blank=True,
        help_text=_("Ảnh nền toàn section."),
    )
    news_section_bg_decoration = models.ImageField(
        _("news section decorative background"),
        upload_to="knowledge/news_section/deco/", blank=True,
        help_text=_("Họa tiết trang trí hiển thị phía sau nội dung."),
    )
    news_activity_heading = models.CharField(
        _("activity news heading"), max_length=200, blank=True,
        default="Tin hoạt động IRDM",
        help_text=_("Tiêu đề cột trái — danh sách tin hoạt động."),
    )
    news_events_heading = models.CharField(
        _("upcoming events heading"), max_length=200, blank=True,
        default="Sự kiện sắp diễn ra",
        help_text=_("Tiêu đề cột phải — danh sách sự kiện."),
    )

    # ─── Press Section (IRDM trên báo chí và diễn đàn chuyên môn) ─────────────────
    press_section_label = models.CharField(
        _("press section label"), max_length=200, blank=True,
        help_text=_("Label nhỏ phía trên, e.g. BÁO CHÍ & DIỄN ĐÀN."),
    )
    press_section_heading = models.CharField(
        _("press section heading"), max_length=300, blank=True,
        help_text=_("Tiêu đề section, e.g. IRDM trên báo chí và diễn đàn chuyên môn."),
    )
    press_section_description = models.TextField(
        _("press section description"), blank=True,
    )
    press_section_bg_image = models.ImageField(
        _("press section background image"),
        upload_to="knowledge/press/bg/", blank=True,
        help_text=_("Nhả nền tuỳ chọn cho section báo chí."),
    )

    # ─── Ready Section (Sẵn sàng trao đổi) ─────────────────────────────────
    ready_section_subtitle = models.CharField(
        _("ready section subtitle"), max_length=200, blank=True,
        help_text=_("Subtitle nhỏ phía trên, e.g. Sẵn sàng trao đổi?"),
    )
    ready_section_title = models.CharField(
        _("ready section title"), max_length=500, blank=True,
        help_text=_("Tiêu đề lớn của section CTA."),
    )
    ready_section_description = models.TextField(
        _("ready section description"), blank=True,
    )
    ready_section_bg_image = models.ImageField(
        _("ready section background image"),
        upload_to="knowledge/ready/bg/", blank=True,
        help_text=_("Ảnh nền full-width của section."),
    )
    ready_section_overlay_color = models.CharField(
        _("ready section overlay color"), max_length=30, blank=True, default="#0d1e4a",
        help_text=_("Màu overlay dạng hex, e.g. #0d1e4a."),
    )
    ready_section_overlay_opacity = models.FloatField(
        _("ready section overlay opacity"), default=0.82,
        help_text=_("Độ mờ overlay từ 0.0 đến 1.0."),
    )
    ready_section_text_color = models.CharField(
        _("ready section text color"), max_length=20, blank=True, default="light",
        choices=[("light", "Sáng (white)"), ("dark", "Tối (dark)")],
    )
    ready_section_is_active = models.BooleanField(
        _("ready section is active"), default=True,
        help_text=_("N/hiện toàn bộ section Sẵn sàng trao đổi."),
    )

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
    slug = models.SlugField(_("slug"), max_length=300, unique=True)
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
    is_press_article = models.BooleanField(
        _("is press article"), default=False, db_index=True,
        help_text=_("Hiển thị bài trong section IRDM trên báo chí và diễn đàn chuyên môn."),
    )
    cta_text = models.CharField(
        _("CTA text"), max_length=100, blank=True, default="Xem chi tiết",
    )
    cta_target = models.CharField(
        _("CTA target"), max_length=20, blank=True, default="_blank",
        choices=[("_self", "Cùng tab (_self)"), ("_blank", "Tab mới (_blank)")],
        help_text=_("Mở link CTA trong tab nào."),
    )
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


# ─── Content Type Card ────────────────────────────────────────────────────────

class KnowledgeContentTypeCard(BaseModel):
    """A card in the 'Khám phá theo Loại Nội Dung' section of the listing page."""

    listing_page = models.ForeignKey(
        KnowledgeListingPage,
        on_delete=models.CASCADE,
        related_name="content_type_cards",
        verbose_name=_("listing page"),
    )
    cover_image = models.ImageField(
        _("cover image"), upload_to="knowledge/content_type/cards/", blank=True,
        help_text=_("Ảnh đại diện hiển thị trên đầu card."),
    )
    category = models.ForeignKey(
        KnowledgeCategory,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="content_type_cards",
        verbose_name=_("category"),
        help_text=_("Liên kết tới loại nội dung (dùng làm nhãn category trên card)."),
    )
    title = models.CharField(_("title"), max_length=300)
    summary = models.TextField(_("summary"), blank=True)
    tags = models.ManyToManyField(
        KnowledgeTopic,
        blank=True,
        related_name="content_type_cards",
        verbose_name=_("tags"),
        help_text=_("Các chủ đề hiển thị dưới dạng tag trên card."),
    )
    cta_text = models.CharField(
        _("CTA text"), max_length=200, blank=True,
        help_text=_("Ví dụ: Xem nội dung liên quan"),
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
        _("CTA URL"), max_length=500, blank=True,
        help_text=_("URL khi nhấn CTA. Ví dụ: ?ctype=cong-bo-nghien-cuu"),
    )
    is_published = models.BooleanField(_("published"), default=False, db_index=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("content type card")
        verbose_name_plural = _("content type cards")

    def __str__(self) -> str:
        return self.title


# ─── Topic Card Tag ──────────────────────────────────────────────────────────

class KnowledgeTopicCardTag(BaseModel):
    """A tag label displayed on a Topic Card (audience / partner type labels)."""

    label = models.CharField(_("label"), max_length=200)
    slug = models.SlugField(_("slug"), max_length=200, unique=True, db_index=True)
    color = models.CharField(
        _("color"), max_length=30, default="#6b7280",
        help_text=_("Hex color for tag chip, e.g. #3b82f6."),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("topic card tag")
        verbose_name_plural = _("topic card tags")

    def __str__(self) -> str:
        return self.label


# ─── Topic Card ────────────────────────────────────────────────────────────

class KnowledgeTopicCard(BaseModel):
    """Presentation card for the 'Khám phá theo Chủ Đề' section."""

    listing_page = models.ForeignKey(
        KnowledgeListingPage,
        on_delete=models.CASCADE,
        related_name="topic_cards",
        verbose_name=_("listing page"),
    )
    topic = models.ForeignKey(
        KnowledgeTopic,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="topic_cards",
        verbose_name=_("linked topic"),
        help_text=_("Liên kết taxonomy topic để filter bài viết khi click CTA."),
    )
    cover_image = models.ImageField(
        _("cover image"), upload_to="knowledge/topic_cards/", blank=True,
        help_text=_("Ảnh đại diện hiển thị trên đầu card."),
    )
    icon = models.CharField(
        _("icon"), max_length=100, blank=True,
        help_text=_("Icon key để render SVG, e.g. heart, academic-cap, globe-alt, cpu-chip, users."),
    )
    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    tags = models.ManyToManyField(
        KnowledgeTopicCardTag,
        blank=True,
        related_name="topic_cards",
        verbose_name=_("tags"),
        help_text=_("Các tag hiển thị dưới dạng chip trên card."),
    )
    cta_text = models.CharField(
        _("CTA text"), max_length=200, blank=True,
        help_text=_("Ví dụ: Xem nội dung liên quan"),
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
        _("CTA URL"), max_length=500, blank=True,
        help_text=_("URL khi nhấn CTA. Ví dụ: ?topic=y-te"),
    )
    is_published = models.BooleanField(_("published"), default=False, db_index=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("topic card")
        verbose_name_plural = _("topic cards")

    def __str__(self) -> str:
        return self.title


# ─── Download Request ─────────────────────────────────────────────────────────

class KnowledgeDownloadRequest(models.Model):
    """Form submission: user requests a downloadable document from IRDM."""

    full_name = models.CharField(_("full name"), max_length=200)
    organization = models.CharField(_("organization"), max_length=300)
    email = models.EmailField(_("email"))
    note = models.TextField(_("note"), blank=True)
    submitted_at = models.DateTimeField(_("submitted at"), auto_now_add=True)

    class Meta:
        verbose_name = _("download request")
        verbose_name_plural = _("download requests")
        ordering = ["-submitted_at"]

    def __str__(self) -> str:
        return f"{self.full_name} <{self.email}>"


# ─── Activity News (Tin hoạt động IRDM) ──────────────────────────────────────

class KnowledgeActivityNews(BaseModel):
    """A news/activity item shown in the left column of the News & Events section."""

    CTA_ICON_CHOICES = [
        ("arrow-right", "Arrow Right →"),
        ("external", "External ↗"),
    ]

    thumbnail = models.ImageField(
        _("thumbnail"), upload_to="knowledge/activity_news/", blank=True,
        help_text=_("Ảnh đại diện cho tin hoạt động."),
    )
    hero_image = models.ImageField(
        _("hero image"), upload_to="knowledge/activity_news/hero/", blank=True,
        help_text=_("Ảnh lớn trên trang chi tiết; nếu trống sẽ dùng ảnh thu nhỏ."),
    )
    category = models.ForeignKey(
        KnowledgeCategory,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="activity_news",
        verbose_name=_("category"),
    )
    title = models.CharField(_("title"), max_length=300)
    slug = models.SlugField(_("slug"), max_length=300, unique=True, db_index=True)
    summary = models.TextField(_("summary"), blank=True)
    body = models.TextField(_("content"), blank=True)
    author_name = models.CharField(_("author name"), max_length=200, blank=True)
    read_time = models.PositiveIntegerField(
        _("read time (minutes)"), default=3,
        help_text=_("Thời gian đọc ước tính theo phút."),
    )
    published_date = models.DateField(_("published date"), null=True, blank=True)
    cta_text = models.CharField(
        _("CTA text"), max_length=100, blank=True, default="Xem chi tiết",
    )
    cta_icon = models.CharField(
        _("CTA icon"), max_length=50, blank=True,
        choices=CTA_ICON_CHOICES, default="arrow-right",
    )
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)
    cta_target = models.CharField(
        _("CTA target"), max_length=20, blank=True, default="_self",
        choices=[("_self", "Cùng tab (_self)"), ("_blank", "Tab mới (_blank)")],
        help_text=_("Mở link CTA trong tab nào, e.g. _self hoặc _blank."),
    )
    meta_title = models.CharField(_("meta title"), max_length=200, blank=True)
    meta_description = models.CharField(_("meta description"), max_length=300, blank=True)
    is_published = models.BooleanField(_("published"), default=False, db_index=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("activity news item")
        verbose_name_plural = _("activity news items")

    def __str__(self) -> str:
        return self.title

    def get_absolute_url(self) -> str:
        return reverse("knowledge:activity_detail", kwargs={"slug": self.slug})

    def get_cta_url(self) -> str:
        return self.cta_url or self.get_absolute_url()

    def get_cta_target(self) -> str:
        return self.cta_target if self.cta_url else "_self"


# ─── Event Tag ────────────────────────────────────────────────────────────────

class KnowledgeEventTag(BaseModel):
    """A reusable tag for labelling events (audience, format, topic)."""

    label = models.CharField(_("label"), max_length=100)
    slug = models.SlugField(_("slug"), max_length=100, unique=True, db_index=True)
    color = models.CharField(
        _("color (hex)"), max_length=30, default="#3b82f6",
        help_text=_("Màu nền badge tag, e.g. #3b82f6."),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("event tag")
        verbose_name_plural = _("event tags")

    def __str__(self) -> str:
        return self.label


# ─── Event (Sự kiện sắp diễn ra) ─────────────────────────────────────────────

class KnowledgeEvent(BaseModel):
    """An upcoming event shown in the right column of the News & Events section."""

    CTA_ICON_CHOICES = [
        ("arrow-right", "Arrow Right →"),
        ("external", "External ↗"),
        ("calendar", "Calendar 📅"),
    ]

    cover_image = models.ImageField(
        _("cover image"), upload_to="knowledge/events/", blank=True,
        help_text=_("Ảnh bìa sự kiện."),
    )
    category = models.ForeignKey(
        KnowledgeCategory,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="events",
        verbose_name=_("category"),
    )
    event_date = models.CharField(
        _("event date (display text)"), max_length=200, blank=True,
        help_text=_("Chuỗi hiển thị ngày giờ sự kiện, e.g. 08/07/2026 - 11/07/2026."),
    )
    title = models.CharField(_("title"), max_length=300)
    description = models.TextField(_("description"), blank=True)
    tags = models.ManyToManyField(
        KnowledgeEventTag,
        blank=True,
        related_name="events",
        verbose_name=_("tags"),
    )
    location = models.CharField(
        _("location"), max_length=300, blank=True,
        help_text=_("Địa điểm tổ chức, e.g. Viện IRDM (Thực tế)."),
    )
    cta_text = models.CharField(
        _("CTA text"), max_length=100, blank=True, default="Xem sự kiện",
    )
    cta_icon = models.CharField(
        _("CTA icon"), max_length=50, blank=True,
        choices=CTA_ICON_CHOICES, default="arrow-right",
    )
    cta_url = models.CharField(_("CTA URL"), max_length=500, blank=True)
    cta_target = models.CharField(
        _("CTA target"), max_length=20, blank=True, default="_self",
        choices=[("_self", "Cùng tab (_self)"), ("_blank", "Tab mới (_blank)")],
        help_text=_("Mở link CTA trong tab nào, e.g. _self hoặc _blank."),
    )
    is_published = models.BooleanField(_("published"), default=False, db_index=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("knowledge event")
        verbose_name_plural = _("knowledge events")

    def __str__(self) -> str:
        return self.title


# ─── Accordion Item ───────────────────────────────────────────────────────────

class KnowledgeAccordionItem(BaseModel):
    """An accordion item under the Events column (post-event summaries or cooperation announcements)."""

    ACCORDION_TYPE_CHOICES = [
        ("post_event", "Tổng hợp sau sự kiện"),
        ("cooperation", "Công bố hợp tác"),
    ]

    accordion_type = models.CharField(
        _("accordion type"), max_length=20,
        choices=ACCORDION_TYPE_CHOICES, default="post_event",
        db_index=True,
    )
    title = models.CharField(_("title"), max_length=300)
    content = models.TextField(
        _("content"),
        help_text=_("Nội dung accordion. Hỗ trợ văn bản thông thường, mỗi dòng là một đoạn."),
    )
    is_published = models.BooleanField(_("published"), default=False, db_index=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("accordion item")
        verbose_name_plural = _("accordion items")

    def __str__(self) -> str:
        return f"[{self.get_accordion_type_display()}] {self.title}"


# ─── CTA Button (Sẵn sàng trao đổi) ───────────────────────────────────────────────────

class KnowledgeCTAButton(BaseModel):
    """A CTA button in the 'Sẵn sàng trao đổi' section on the Knowledge listing page."""

    STYLE_CHOICES = [
        ("primary",   "Primary (cam)"),
        ("secondary", "Secondary (trắng/mờ)"),
        ("outline",   "Outline (viền trắng)"),
    ]
    TARGET_CHOICES = [
        ("_self",  "Cùng tab (_self)"),
        ("_blank", "Tab mới (_blank)"),
    ]
    ICON_CHOICES = [
        ("",            "Không có"),
        ("arrow-right", "Mũi tên →"),
        ("external",    "Mở ngoài ↗"),
    ]

    listing_page = models.ForeignKey(
        KnowledgeListingPage,
        on_delete=models.CASCADE,
        related_name="cta_buttons",
        verbose_name=_("listing page"),
    )
    text = models.CharField(_("button text"), max_length=200)
    url = models.CharField(_("button URL"), max_length=500, blank=True)
    target = models.CharField(
        _("button target"), max_length=20, default="_self",
        choices=TARGET_CHOICES,
    )
    style = models.CharField(
        _("button style"), max_length=20, default="primary",
        choices=STYLE_CHOICES,
    )
    icon = models.CharField(
        _("button icon"), max_length=50, blank=True,
        choices=ICON_CHOICES,
    )
    is_published = models.BooleanField(_("published"), default=True, db_index=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("CTA button")
        verbose_name_plural = _("CTA buttons")
        ordering = ["display_order"]

    def __str__(self) -> str:
        return self.text
