"""Expert domain models for the IRDM Website."""

import uuid

from django.db import models
from django.utils.translation import gettext_lazy as _

from apps.common.models import BaseModel


# ─── Listing Page CMS (Singleton) ─────────────────────────────────────────────

class ExpertListingPage(BaseModel):
    """CMS-editable content for the expert listing page."""

    # Hero Badge
    hero_badge_text = models.CharField(
        _("hero badge text"), max_length=200, blank=True,
        default="ĐỘI NGŨ CHUYÊN GIA",
        help_text=_("Badge label phía trên tiêu đề, e.g. ĐỘI NGŨ CHUYÊN GIA"),
    )
    hero_badge_icon = models.CharField(
        _("hero badge icon"), max_length=50, blank=True,
        help_text=_("Heroicon name, e.g. 'users'. Để trống để dùng dot mặc định."),
    )
    hero_badge_color = models.CharField(
        _("hero badge color (hex)"), max_length=30, blank=True, default="#ffffff1a",
        help_text=_("Màu nền badge dạng hex hoặc rgba, e.g. #ffffff1a"),
    )
    hero_badge_show = models.BooleanField(_("show hero badge"), default=True)

    # Hero Content
    hero_eyebrow = models.CharField(_("hero eyebrow (legacy)"), max_length=200, blank=True)
    hero_heading = models.TextField(
        _("hero heading"),
        help_text=_("Nhập Enter để xuống dòng trong tiêu đề. VD: MẠNG LƯỚI NHÀ KHOA HỌC (Enter) & CHUYÊN GIA LIÊN NGÀNH"),
    )
    hero_description = models.TextField(_("hero description"), blank=True)
    hero_image = models.ImageField(
        _("hero background image"), upload_to="expert/hero/", blank=True
    )

    # Hero Buttons
    hero_btn1_label = models.CharField(_("button 1 label"), max_length=100, blank=True, default="Tìm chuyên gia")
    hero_btn1_url = models.CharField(_("button 1 URL"), max_length=500, blank=True, default="#ket-noi")
    hero_btn1_icon = models.CharField(
        _("button 1 icon"), max_length=50, blank=True,
        help_text=_("Heroicon name, e.g. 'arrow-right'. Để trống nếu không dùng icon."),
    )
    hero_btn1_target = models.CharField(
        _("button 1 target"), max_length=10, blank=True, default="_self",
        choices=[("_self", "Cùng tab (_self)"), ("_blank", "Tab mới (_blank)")],
    )
    hero_btn2_label = models.CharField(_("button 2 label"), max_length=100, blank=True, default="Xem lĩnh vực chuyên môn")
    hero_btn2_url = models.CharField(_("button 2 URL"), max_length=500, blank=True, default="/lien-he/")
    hero_btn2_icon = models.CharField(
        _("button 2 icon"), max_length=50, blank=True,
        help_text=_("Heroicon name, e.g. 'arrow-right'. Để trống nếu không dùng icon."),
    )
    hero_btn2_target = models.CharField(
        _("button 2 target"), max_length=10, blank=True, default="_self",
        choices=[("_self", "Cùng tab (_self)"), ("_blank", "Tab mới (_blank)")],
    )

    # Hero Bottom Badge (ĐÚNG CHUYÊN MÔN CHO ĐÚNG BÀI TOÁN)
    hero_bottom_badge_text = models.CharField(
        _("hero bottom badge text"), max_length=300, blank=True,
        default="ĐÚNG CHUYÊN MÔN CHO ĐÚNG BÀI TOÁN",
        help_text=_("Text hiển thị bên dưới CTA buttons, e.g. ĐÚNG CHUYÊN MÔN CHO ĐÚNG BÀI TOÁN"),
    )
    hero_bottom_badge_logo = models.ImageField(
        _("hero bottom badge logo"),
        upload_to="expert/hero/badges/",
        blank=True,
        help_text=_("Upload ảnh/logo hiển thị bên trái text badge. Ưu tiên hơn icon text."),
    )
    hero_bottom_badge_icon = models.CharField(
        _("hero bottom badge icon (fallback)"), max_length=50, blank=True,
        help_text=_("Chỉ dùng khi không upload logo ở trên. Heroicon name, e.g. 'chat-bubble-left-right'."),
    )
    hero_bottom_badge_bg = models.CharField(
        _("hero bottom badge bg color"), max_length=30, blank=True, default="#ffffff14",
        help_text=_("Màu nền bottom badge, e.g. #ffffff14"),
    )
    hero_bottom_badge_show = models.BooleanField(_("show hero bottom badge"), default=True)

    # Process Section
    process_section_label = models.CharField(
        _("process section label"), max_length=100, blank=True,
        default="PHƯƠNG THỨC TIẾP CẬN",
        help_text=_("Nhãn nhỏ phía trên tiêu đề section, e.g. PHƯƠNG THỨC TIẾP CẬN. Để trống để ẩn."),
    )
    process_heading = models.TextField(
        _("process section heading"), blank=True,
        help_text=_("Nhấn Enter để xuống dòng trong tiêu đề. VD: VIỆN IRDM KẾT NỐI CHUYÊN GIA (Enter) NHƯ THẾ NÀO?"),
    )
    process_description = models.TextField(_("process section description"), blank=True)

    # Senior Section
    senior_section_label = models.CharField(
        _("senior section label"), max_length=100, blank=True,
        default="CHUYÊN GIA CẤP CAO",
        help_text=_("Nhãn nhỏ phía trên tiêu đề section. Để trống để ẩn."),
    )
    senior_heading = models.CharField(
        _("senior experts section heading"), max_length=300, blank=True,
        default="CHUYÊN GIA CAO CẤP CỦA VIỆN IRDM"
    )
    senior_description = models.TextField(
        _("senior section description"), blank=True,
        help_text=_("Mô tả ngắn bên dưới tiêu đề section chuyên gia cao cấp."),
    )
    senior_cta_label = models.CharField(_("senior section CTA label"), max_length=100, blank=True, default="Xem tất cả")
    senior_cta_url = models.CharField(_("senior section CTA URL"), max_length=500, blank=True, default="#tim-kiem")

    # Research Area Map Section
    map_section_label = models.CharField(
        _("map section label"), max_length=100, blank=True,
        default="BẢN ĐỒ CHUYÊN MÔN",
        help_text=_("Nhãn nhỏ phía trên tiêu đề section. Để trống để ẩn."),
    )
    map_heading = models.CharField(
        _("research area map heading"), max_length=300, blank=True,
        default="BẢN ĐỒ CHUYÊN MÔN LIÊN NGÀNH"
    )
    map_description = models.TextField(_("research area map description"), blank=True)
    map_cta1_label = models.CharField(_("map CTA 1 label"), max_length=100, blank=True, default="Tìm chuyên gia")
    map_cta1_url = models.CharField(_("map CTA 1 URL"), max_length=500, blank=True, default="#tim-kiem")
    map_cta2_label = models.CharField(_("map CTA 2 label"), max_length=100, blank=True, default="Khám phá giải pháp")
    map_cta2_url = models.CharField(_("map CTA 2 URL"), max_length=500, blank=True, default="/giai-phap/")

    # Directory Section
    directory_heading = models.CharField(
        _("directory section heading"), max_length=300, blank=True,
        default="TÌM NHÀ KHOA HỌC/CHUYÊN GIA"
    )

    # Knowledge Topic Section
    topic_heading = models.CharField(
        _("knowledge topic section heading"), max_length=300, blank=True,
        default="CÁC CHỦ ĐỀ THÔNG TIN CHUYÊN MÔN"
    )
    topic_description = models.TextField(_("knowledge topic section description"), blank=True)

    # CTA Section
    cta_eyebrow = models.CharField(_("CTA eyebrow"), max_length=200, blank=True)
    cta_heading = models.CharField(_("CTA heading"), max_length=400, blank=True)
    cta_description = models.TextField(_("CTA description"), blank=True)
    cta_bg_image = models.ImageField(_("CTA background image"), upload_to="expert/cta/", blank=True)
    cta_btn1_label = models.CharField(_("CTA button 1 label"), max_length=100, blank=True, default="LIÊN HỆ NGAY")
    cta_btn1_url = models.CharField(_("CTA button 1 URL"), max_length=500, blank=True, default="/lien-he/")
    cta_btn2_label = models.CharField(_("CTA button 2 label"), max_length=100, blank=True, default="ĐĂNG KÝ CHUYÊN GIA")
    cta_btn2_url = models.CharField(_("CTA button 2 URL"), max_length=500, blank=True, default="/lien-he/")

    # SEO
    meta_title = models.CharField(_("meta title"), max_length=200, blank=True)
    meta_description = models.CharField(_("meta description"), max_length=300, blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("expert listing page")
        verbose_name_plural = _("expert listing pages")

    def __str__(self) -> str:
        return self.hero_heading or "Expert Listing Page"


# ─── Expert Group (Nhóm chuyên gia) ──────────────────────────────────────────

class ExpertGroup(BaseModel):
    """Category/group for filtering experts (e.g. Nhà khoa học, Chuyên gia tư vấn)."""

    name = models.CharField(_("name"), max_length=200)
    slug = models.SlugField(_("slug"), max_length=200, unique=True, db_index=True)
    description = models.TextField(_("description"), blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("expert group")
        verbose_name_plural = _("expert groups")

    def __str__(self) -> str:
        return self.name


# ─── Research Area (Lĩnh vực nghiên cứu) ─────────────────────────────────────

class ResearchArea(BaseModel):
    """Research area / field of expertise shown on the Interdisciplinary Map."""

    ICON_CHOICES = [
        ("chart-bar",       "📊 chart-bar — Kinh tế / Thống kê"),
        ("briefcase",       "💼 briefcase — Quản trị / Lãnh đạo"),
        ("cpu",             "🖥️ cpu — Công nghệ / AI"),
        ("building-library","🏛️ building-library — Chính sách / Pháp luật"),
        ("leaf",            "🌿 leaf — Bền vững / Môi trường"),
        ("academic-cap",    "🎓 academic-cap — Giáo dục / Đào tạo"),
        ("heart",           "❤️ heart — Y tế / Sức khoẻ"),
        ("light-bulb",      "💡 light-bulb — Đổi mới sáng tạo"),
        ("globe-alt",       "🌐 globe-alt — Quốc tế / Toàn cầu"),
        ("users",           "👥 users — Nhân lực / Cộng đồng"),
        ("beaker",          "🔬 beaker — Nghiên cứu / Khoa học"),
        ("currency-dollar", "💵 currency-dollar — Tài chính / Đầu tư"),
    ]

    name = models.CharField(_("name"), max_length=200)
    slug = models.SlugField(_("slug"), max_length=200, unique=True, db_index=True)
    icon = models.CharField(
        _("icon name"),
        max_length=100,
        blank=True,
        choices=ICON_CHOICES,
        help_text=_("Chọn icon đại diện cho lĩnh vực chuyên môn."),
    )
    card_icon = models.ImageField(
        _("card icon"),
        upload_to="expert/area-icons/",
        blank=True,
        help_text=_("Upload icon PNG/SVG (~40×40 px). Nếu upload thì ưu tiên hiển thị, nếu không sẽ dùng icon từ danh sách bên trên."),
    )
    color = models.CharField(
        _("color (hex)"),
        max_length=20,
        blank=True,
        default="#1d4ed8",
        help_text=_("Hex color for the tag background, e.g. #1d4ed8"),
    )
    description = models.TextField(
        _("description"), blank=True,
        help_text=_("Mô tả ngắn hiển thị trong card bản đồ chuyên môn (2-3 câu)."),
    )
    card_tags = models.TextField(
        _("card tags"), blank=True,
        help_text=_("Mỗi tag một dòng (nhấn Enter để xuống dòng). VD:\nY tế\nHệ thống y tế\nAI dữ liệu"),
    )
    card_cta_label = models.CharField(
        _("CTA label"), max_length=200, blank=True,
        default="Tìm chuyên gia liên quan",
        help_text=_("Nhãn nút CTA trong card, e.g. 'Tìm chuyên gia liên quan'"),
    )
    card_cta_url = models.CharField(
        _("CTA URL"), max_length=500, blank=True,
        default="/chuyen-gia/",
        help_text=_("Đường dẫn khi nhấn CTA, e.g. /chuyen-gia/?linh-vuc=kinh-te"),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("research area")
        verbose_name_plural = _("research areas")

    def __str__(self) -> str:
        return self.name


# ─── Process Step (Bước quy trình kết nối) ───────────────────────────────────

class ProcessStep(BaseModel):
    """A step in the 'How IRDM connects experts' process section."""

    step_number = models.PositiveSmallIntegerField(_("step number"))
    title = models.CharField(_("title"), max_length=200)
    description = models.TextField(_("description"), blank=True)
    icon = models.CharField(
        _("icon name"),
        max_length=100,
        blank=True,
        help_text=_("Heroicon name, e.g. 'document-text'"),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("process step")
        verbose_name_plural = _("process steps")
        ordering = ["step_number"]

    def __str__(self) -> str:
        return f"Bước {self.step_number}: {self.title}"


# ─── Knowledge Topic (Chủ đề chuyên môn) ─────────────────────────────────────

class KnowledgeTopic(BaseModel):
    """Professional knowledge topic for grouping experts in the accordion section."""

    name = models.CharField(_("name"), max_length=200)
    slug = models.SlugField(_("slug"), max_length=200, unique=True, db_index=True)
    description = models.TextField(_("description"), blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("knowledge topic")
        verbose_name_plural = _("knowledge topics")

    def __str__(self) -> str:
        return self.name


# ─── Expert (Chuyên gia) ─────────────────────────────────────────────────────

class Expert(BaseModel):
    """Core Expert entity — represents a researcher or specialist in the IRDM network."""

    # Identity
    name = models.CharField(_("full name"), max_length=200)
    slug = models.SlugField(_("slug"), max_length=200, unique=True, db_index=True)
    academic_title = models.CharField(
        _("academic title"),
        max_length=100,
        blank=True,
        help_text=_("e.g. GS.TS., PGS.TS., TS."),
    )
    position = models.CharField(
        _("position/role"),
        max_length=300,
        blank=True,
        help_text=_("e.g. Giáo sư Kinh tế học, Phó Giáo sư Quản trị Kinh doanh"),
    )
    organization = models.CharField(
        _("organization"),
        max_length=300,
        blank=True,
        help_text=_("Trường đại học hoặc tổ chức công tác"),
    )

    # Media
    avatar = models.ImageField(
        _("avatar"),
        upload_to="expert/avatars/",
        blank=True,
        help_text=_("Portrait photo, recommended 400×400 px"),
    )

    # Content
    short_bio = models.TextField(
        _("short bio"),
        blank=True,
        help_text=_("1–3 sentences shown on listing card"),
    )
    full_bio = models.TextField(
        _("full bio"),
        blank=True,
        help_text=_("Full biography shown on detail page"),
    )

    # Contact / Links
    email = models.EmailField(_("email"), blank=True)
    profile_url = models.URLField(
        _("external profile URL"),
        blank=True,
        help_text=_("Google Scholar, ResearchGate, personal website, etc."),
    )

    # Classification
    group = models.ForeignKey(
        ExpertGroup,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="experts",
        verbose_name=_("expert group"),
    )
    research_areas = models.ManyToManyField(
        ResearchArea,
        blank=True,
        related_name="experts",
        verbose_name=_("research areas"),
    )
    knowledge_topics = models.ManyToManyField(
        KnowledgeTopic,
        blank=True,
        related_name="experts",
        verbose_name=_("knowledge topics"),
    )

    # Status flags
    is_published = models.BooleanField(_("published"), default=False, db_index=True)
    is_featured = models.BooleanField(_("featured"), default=False, db_index=True)
    is_senior = models.BooleanField(
        _("senior expert"),
        default=False,
        db_index=True,
        help_text=_("Show in 'Senior Experts' section on listing page"),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("expert")
        verbose_name_plural = _("experts")

    def __str__(self) -> str:
        if self.academic_title:
            return f"{self.academic_title} {self.name}"
        return self.name

    def get_absolute_url(self) -> str:
        from django.urls import reverse
        return reverse("expert:detail", kwargs={"slug": self.slug})

    @property
    def display_name(self) -> str:
        """Full display name with academic title."""
        if self.academic_title:
            return f"{self.academic_title} {self.name}"
        return self.name
