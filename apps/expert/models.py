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
    directory_section_label = models.CharField(
        _("directory section label"), max_length=100, blank=True,
        default="TÌM KIẾM",
        help_text=_("Nhãn nhỏ phía trên tiêu đề section. Để trống để ẩn."),
    )
    directory_heading = models.CharField(
        _("directory section heading"), max_length=300, blank=True,
        default="TÌM NHÀ KHOA HỌC/CHUYÊN GIA"
    )
    directory_description = models.TextField(
        _("directory section description"), blank=True,
        help_text=_("Mô tả ngắn hiển thị bên dưới tiêu đề section tìm kiếm."),
    )

    # Knowledge Topic Section
    topic_heading = models.CharField(
        _("knowledge topic section heading"), max_length=300, blank=True,
        default="CÁC CHỦ ĐỀ THÔNG TIN CHUYÊN MÔN"
    )
    topic_description = models.TextField(_("knowledge topic section description"), blank=True)

    # Info Groups Section (CÁC NHÓM THÔNG TIN CHUYÊN MÔN)
    info_group_section_label = models.CharField(
        _("info group section label"), max_length=100, blank=True,
        default="CÁC NHÓM THÔNG TIN CHUYÊN MÔN",
        help_text=_("Nhãn nhỏ phía trên tiêu đề section. Để trống để ẩn."),
    )
    info_group_section_heading = models.CharField(
        _("info group section heading"), max_length=300, blank=True,
        default="CÁC NHÓM THÔNG TIN CHUYÊN MÔN",
    )
    info_group_section_description = models.TextField(
        _("info group section description"), blank=True,
        help_text=_("Mô tả ngắn hiển thị bên dưới tiêu đề section."),
    )

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


# ─── Engagement Type (Hình thức đồng hành) ──────────────────────────────────

class EngagementType(BaseModel):
    """Engagement mode/type for filtering experts (e.g. Tư vấn chiến lược, Đào tạo & tập huấn)."""

    name = models.CharField(_("name"), max_length=200)
    slug = models.SlugField(_("slug"), max_length=200, unique=True, db_index=True)
    description = models.TextField(_("description"), blank=True)

    class Meta(BaseModel.Meta):
        verbose_name = _("engagement type")
        verbose_name_plural = _("engagement types")

    def __str__(self) -> str:
        return self.name


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

    # Visual configuration
    icon = models.CharField(
        _("icon"),
        max_length=50,
        blank=True,
        help_text=_("Heroicon name, e.g. 'cpu-chip', 'leaf', 'chart-bar'. Hiển thị cạnh số thứ tự."),
    )
    color = models.CharField(
        _("accent color (hex)"),
        max_length=30,
        blank=True,
        help_text=_("Màu accent cho badge số thứ tự, e.g. #1B3F6E. Để trống dùng màu mặc định."),
    )

    # Optional CTA
    cta_label = models.CharField(
        _("CTA label"),
        max_length=100,
        blank=True,
        help_text=_("Nhãn nút CTA bên dưới danh sách chuyên gia, e.g. 'Xem tất cả'. Để trống để ẩn."),
    )
    cta_url = models.CharField(
        _("CTA URL"),
        max_length=500,
        blank=True,
        help_text=_("Đường dẫn của nút CTA, e.g. /chuyen-gia/?chu-de=chuyen-doi-so"),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("knowledge topic")
        verbose_name_plural = _("knowledge topics")

    def __str__(self) -> str:
        return self.name


# ─── Info Group (Nhóm thông tin — Cơ cấu tổ chức, Hội đồng KH, …) ──────────

class InfoGroup(BaseModel):
    """
    Rich-content accordion for 'CÁC NHÓM THÔNG TIN CHUYÊN MÔN'.
    Org chart nodes → OrgNode; description panels → InfoGroupBlock.
    """

    ICON_CHOICES = [
        ("building-office-2", "🏢 building-office-2 — Cơ cấu tổ chức"),
        ("academic-cap",      "🎓 academic-cap — Hội đồng khoa học"),
        ("users",             "👥 users — Nhà khoa học & Chuyên gia"),
        ("book-open",         "📖 book-open — Giảng viên & Học tập ứng dụng"),
        ("chart-bar",         "📊 chart-bar — Thống kê / Kinh tế"),
        ("briefcase",         "💼 briefcase — Quản trị / Lãnh đạo"),
        ("beaker",            "🔬 beaker — Nghiên cứu / Khoa học"),
        ("light-bulb",        "💡 light-bulb — Đổi mới sáng tạo"),
        ("globe-alt",         "🌐 globe-alt — Quốc tế / Toàn cầu"),
        ("document-text",     "📄 document-text — Tài liệu / Chính sách"),
        ("star",              "⭐ star — Nổi bật"),
    ]

    name = models.CharField(_("name"), max_length=200)
    slug = models.SlugField(_("slug"), max_length=200, unique=True, db_index=True)

    # Header
    icon = models.CharField(
        _("icon"), max_length=50, blank=True, choices=ICON_CHOICES,
        help_text=_("Icon hiển thị trong header accordion."),
    )
    icon_bg_color = models.CharField(
        _("icon background color (hex)"), max_length=30, blank=True, default="#EFF6FF",
        help_text=_("Màu nền ô icon, e.g. #EFF6FF. Để trống dùng màu mặc định."),
    )
    header_description = models.TextField(
        _("header description"), blank=True,
        help_text=_("Mô tả ngắn hiển thị trong header accordion (bên dưới tiêu đề)."),
    )

    # Body header
    section_label = models.CharField(
        _("body section label"), max_length=100, blank=True,
        help_text=_("Nhãn nhỏ uppercase bên trên tiêu đề body, e.g. 'CƠ CẤU TỔ CHỨC'."),
    )
    section_heading = models.TextField(
        _("body section heading"), blank=True,
        help_text=_("Tiêu đề đậm chính trong phần body mở rộng."),
    )
    section_description = models.TextField(
        _("body section description"), blank=True,
        help_text=_("Đoạn mô tả bên dưới tiêu đề trong phần body."),
    )

    # Expert Grid mode (Nhà khoa học & Chuyên gia)
    show_expert_grid = models.BooleanField(
        _("show expert grid"),
        default=False,
        help_text=_(
            "Khi bật, accordion hiển thị lưới chuyên gia theo nhóm chuyên môn "
            "thay vì sơ đồ tổ chức / khối mô tả."
        ),
    )
    expert_research_areas = models.ManyToManyField(
        "ResearchArea",
        blank=True,
        related_name="info_groups",
        verbose_name=_("expert research areas"),
        help_text=_(
            "Chọn các nhóm chuyên môn sẽ hiển thị trong lưới chuyên gia. "
            "Thứ tự hiển thị theo 'display_order' của từng Lĩnh vực chuyên môn."
        ),
    )
    expert_grid_cta_label = models.CharField(
        _("expert grid CTA label"),
        max_length=100,
        blank=True,
        default="Xem hồ sơ chuyên môn",
        help_text=_("Nhãn nút CTA bên dưới mỗi expert card, e.g. 'Xem hồ sơ chuyên môn'."),
    )

    # Flat Expert Grid mode (Giảng viên & Chuyên gia học tập ứng dụng)
    expert_grid_flat = models.BooleanField(
        _("flat expert grid"),
        default=False,
        help_text=_(
            "Khi bật cùng với 'show expert grid', hiển thị danh sách chuyên gia theo lưới phẳng "
            "(không tách nhóm theo lĩnh vực) — dùng cho accordion Giảng viên."
        ),
    )
    expert_direct_members = models.ManyToManyField(
        "Expert",
        blank=True,
        related_name="direct_info_groups",
        verbose_name=_("direct expert members"),
        help_text=_(
            "Chọn chuyên gia hiển thị trực tiếp trong lưới phẳng. "
            "Chỉ dùng khi bật 'flat expert grid'. "
            "Thứ tự hiển thị theo 'display_order' của từng chuyên gia."
        ),
    )

    # Association Grid mode (Hiệp hội & Mạng lưới chuyên môn)
    show_association_grid = models.BooleanField(
        _("show association grid"),
        default=False,
        help_text=_(
            "Khi bật, accordion hiển thị lưới thẻ Hiệp hội/Mạng lưới — "
            "dùng cho accordion Hiệp hội & Mạng lưới chuyên môn. "
            "Quản lý từng hiệp hội trong mục 'Hiệp hội/Mạng lưới' (inline bên dưới)."
        ),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("info group")
        verbose_name_plural = _("info groups")

    def __str__(self) -> str:
        return self.name


# ─── OrgNode (Nút sơ đồ tổ chức) ────────────────────────────────────────────

class OrgNode(BaseModel):
    """Single node in the org chart of an InfoGroup."""

    STYLE_FILLED   = "filled"
    STYLE_OUTLINED = "outlined"
    STYLE_DEFAULT  = "default"
    STYLE_CHOICES = [
        ("filled",   "Filled — Nền xanh đậm, chữ trắng (vd: Hội đồng)"),
        ("outlined", "Outlined — Viền xanh, nền trắng (vd: Viện trưởng)"),
        ("default",  "Default — Viền xám, nền trắng (vd: Phòng/Ban)"),
    ]
    LEVEL_CHOICES = [
        (0, "Cấp 0 — Hội đồng/Ban cấp cao nhất"),
        (1, "Cấp 1 — Giám đốc/Viện trưởng"),
        (2, "Cấp 2 — Phòng/Ban/Đơn vị"),
    ]

    info_group = models.ForeignKey(
        "InfoGroup", on_delete=models.CASCADE, related_name="org_nodes",
        verbose_name=_("info group"),
    )
    name   = models.CharField(_("node name"), max_length=200)
    level  = models.PositiveSmallIntegerField(
        _("level"), choices=LEVEL_CHOICES, default=2,
        help_text=_("Cấp độ trong sơ đồ tổ chức. Xác định vị trí và kiểu hiển thị mặc định."),
    )
    parent = models.ForeignKey(
        "self", null=True, blank=True, on_delete=models.SET_NULL,
        related_name="children", verbose_name=_("parent node"),
        help_text=_("Node cha trong cây tổ chức. Để trống nếu là node gốc."),
    )
    style  = models.CharField(
        _("style"), max_length=20, choices=STYLE_CHOICES, default=STYLE_DEFAULT,
        help_text=_("Kiểu hiển thị của node."),
    )
    color  = models.CharField(
        _("custom color (hex)"), max_length=30, blank=True,
        help_text=_("Màu nền tùy chỉnh (hex), e.g. #1B3F6E. Để trống dùng màu theo style."),
    )
    url    = models.CharField(
        _("URL"), max_length=500, blank=True,
        help_text=_("Đường dẫn khi click vào node. Để trống nếu không cần link."),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("org node")
        verbose_name_plural = _("org nodes")
        ordering = ["level", "display_order"]

    def __str__(self) -> str:
        return f"[L{self.level}] {self.name}"


# ─── InfoGroupBlock (Khối mô tả bên dưới sơ đồ) ─────────────────────────────

class InfoGroupBlock(BaseModel):
    """Description panel (title + function + duties) below the org chart."""

    info_group     = models.ForeignKey(
        "InfoGroup", on_delete=models.CASCADE, related_name="blocks",
        verbose_name=_("info group"),
    )
    title          = models.CharField(_("title"), max_length=200)
    function_label = models.CharField(
        _("function label"), max_length=100, blank=True, default="CHỨC NĂNG",
        help_text=_("Nhãn nhỏ uppercase trên đoạn mô tả chức năng."),
    )
    function_text  = models.TextField(
        _("function text"), blank=True,
        help_text=_("Đoạn mô tả chức năng của đơn vị."),
    )
    duties_label   = models.CharField(
        _("duties label"), max_length=100, blank=True, default="NHIỆM VỤ CHÍNH",
        help_text=_("Nhãn nhỏ uppercase trên danh sách nhiệm vụ."),
    )
    duties         = models.TextField(
        _("duties (one per line)"), blank=True,
        help_text=_("Mỗi dòng là một nhiệm vụ → bullet list. Nhấn Enter để thêm dòng."),
    )
    icon           = models.CharField(_("icon"), max_length=50, blank=True)

    @property
    def duties_list(self) -> list:
        return [d.strip() for d in self.duties.splitlines() if d.strip()]

    class Meta(BaseModel.Meta):
        verbose_name = _("info group block")
        verbose_name_plural = _("info group blocks")

    def __str__(self) -> str:
        return f"{self.info_group.name} — {self.title}"


# ─── InfoGroupMember (Thành viên Hội đồng) ───────────────────────────────────

class InfoGroupMember(BaseModel):
    """
    Council/committee member card for an InfoGroup accordion.
    Displayed as a centered card with avatar, role badge, email, and CTA link.
    """

    info_group = models.ForeignKey(
        "InfoGroup", on_delete=models.CASCADE, related_name="members",
        verbose_name=_("info group"),
    )
    role_label = models.CharField(
        _("role label"), max_length=100, blank=True,
        help_text=_("Nhãn vai trò hiển thị trên badge, vd: 'Chủ tịch Hội đồng', 'Thư ký Hội đồng'."),
    )
    academic_title = models.CharField(
        _("academic title"), max_length=100, blank=True,
        help_text=_("Học hàm/học vị, vd: GS.TS., PGS.TS., ThS., TS."),
    )
    name = models.CharField(_("full name"), max_length=200)
    position = models.CharField(
        _("position"), max_length=300, blank=True,
        help_text=_("Chức danh / đơn vị công tác (tùy chọn)."),
    )
    email = models.EmailField(_("email"), blank=True)
    avatar = models.ImageField(
        _("avatar"), upload_to="expert/council/", blank=True,
        help_text=_("Ảnh đại diện, recommended 200×200 px."),
    )
    cta_text = models.CharField(
        _("CTA text"), max_length=100, blank=True, default="Xem hồ sơ chuyên môn",
        help_text=_("Nhãn nút CTA bên dưới card, vd: 'Xem hồ sơ chuyên môn'."),
    )
    cta_url = models.CharField(
        _("CTA URL"), max_length=500, blank=True,
        help_text=_("Đường dẫn trang hồ sơ chuyên môn. Để trống nếu không cần link."),
    )

    @property
    def full_name(self) -> str:
        if self.academic_title:
            return f"{self.academic_title} {self.name}"
        return self.name

    class Meta(BaseModel.Meta):
        verbose_name = _("info group member")
        verbose_name_plural = _("info group members")

    def __str__(self) -> str:
        return f"{self.info_group.name} — {self.name}"


# ─── Association (Hiệp hội / Mạng lưới chuyên môn) ───────────────────────────

class Association(BaseModel):
    """
    Hiệp hội / Mạng lưới chuyên môn card in accordion.
    Displayed in a 2-column grid with logo, badge, title, description, CTA.
    """

    ICON_CHOICES = [
        ("globe-alt",         "🌐 globe-alt — Quốc tế / Mạng lưới"),
        ("academic-cap",      "🎓 academic-cap — Học thuật"),
        ("building-library",  "🏙 building-library — Tổ chức / Hiệp hội"),
        ("users",             "👥 users — Cộng đồng / Mạng lưới"),
        ("briefcase",         "💼 briefcase — Nghề nghiệp / Doanh nghiệp"),
        ("beaker",            "🔬 beaker — Nghiên cứu / Khoa học"),
        ("cpu-chip",          "🧠 cpu-chip — Công nghệ / AI"),
        ("heart",             "❤️ heart — Y tế / Sức khoẻ"),
        ("light-bulb",        "💡 light-bulb — Đổi mới"),
        ("chart-bar",         "📊 chart-bar — Dữ liệu / Thống kê"),
    ]

    info_group = models.ForeignKey(
        "InfoGroup",
        on_delete=models.CASCADE,
        related_name="associations",
        verbose_name=_("info group"),
    )

    # Logo / Icon
    logo = models.ImageField(
        _("logo"),
        upload_to="expert/associations/",
        blank=True,
        help_text=_("Logo PNG/JPG của hiệp hội/mạng lưới. Recommended ≥1:1, ≥200px. Ưu tiên hơn icon."),
    )
    icon = models.CharField(
        _("icon (fallback)"),
        max_length=50,
        blank=True,
        choices=ICON_CHOICES,
        help_text=_("Heroicon hiển thị khi không có logo. Chọn từ danh sách."),
    )
    icon_bg_color = models.CharField(
        _("icon background color (hex)"),
        max_length=30,
        blank=True,
        default="#EFF6FF",
        help_text=_("Màu nền ô icon khi không có logo, e.g. #EFF6FF."),
    )

    # Badge
    badge_label = models.CharField(
        _("badge label"),
        max_length=200,
        blank=True,
        help_text=_("Nhãn vai trò, e.g. 'Thành viên và Ban điều hành mở rộng'."),
    )
    badge_color = models.CharField(
        _("badge color (hex)"),
        max_length=30,
        blank=True,
        default="#EC6D29",
        help_text=_("Màu chữ badge, e.g. #EC6D29 (cam brand). Để trống dùng màu mặc định."),
    )

    # Content
    title = models.CharField(
        _("title"),
        max_length=500,
        help_text=_("Tên đầy đủ của hiệp hội/mạng lưới."),
    )
    description = models.TextField(
        _("description"),
        blank=True,
        help_text=_("Mô tả ngắn về vai trò và gia trị của việc tham gia (2-5 câu)."),
    )

    # CTA
    cta_label = models.CharField(
        _("CTA label"),
        max_length=100,
        blank=True,
        default="Tìm hiểu thêm",
        help_text=_("Nhãn nút CTA, e.g. 'Tìm hiểu thêm'."),
    )
    cta_url = models.CharField(
        _("CTA URL"),
        max_length=500,
        blank=True,
        help_text=_("URL đến trang chi tiết hiệp hội hoặc website bên ngoài."),
    )
    cta_target = models.CharField(
        _("CTA target"),
        max_length=10,
        blank=True,
        default="_blank",
        choices=[("_self", "Cùng tab (_self)"), ("_blank", "Tab mới (_blank)")],
        help_text=_("_blank để mở website bên ngoài. _self cho trang nội bộ."),
    )

    class Meta(BaseModel.Meta):
        verbose_name = _("association")
        verbose_name_plural = _("associations")

    def __str__(self) -> str:
        return f"{self.info_group.name} — {self.title[:60]}"


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
        help_text=_("Portrait photo, 400×400 px. Dùng cho listing card và fallback cho hero."),
    )
    hero_avatar = models.ImageField(
        _("hero avatar"),
        upload_to="expert/hero_avatars/",
        blank=True,
        help_text=_(
            "Ảnh chân dung riêng cho Hero Section trang hồ sơ chuyên gia. "
            "Để trống → tự động dùng Avatar chung ở trên. "
            "Khuyến nghị: portrait dọc, tỉ lệ 3:4, tối thiểu 600×800 px."
        ),
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
    engagement_types = models.ManyToManyField(
        "EngagementType",
        blank=True,
        related_name="experts",
        verbose_name=_("engagement types"),
        help_text=_("Hình thức đồng hành: Tư vấn chiến lược, Đào tạo, Nghiên cứu, v.v."),
    )
    knowledge_topics = models.ManyToManyField(
        KnowledgeTopic,
        blank=True,
        related_name="experts",
        verbose_name=_("knowledge topics"),
    )

    # Card display
    card_specialty = models.CharField(
        _("card specialty label"),
        max_length=200,
        blank=True,
        help_text=_(
            "Nhãn chuyên môn nổi bật trên card listing, e.g. 'Giáo dục & phát triển năng lực'. "
            "Để trống → tự động dùng Research Area đầu tiên."
        ),
    )

    # ── Detail page — Hero section ───────────────────────────────────────────
    hero_tagline = models.TextField(
        _("hero tagline"),
        blank=True,
        help_text=_("Đoạn tagline in đậm hiển thị trên hero, e.g. 'Chuyên gia cao cấp về quản trị đại học...'"),
    )
    role_badges = models.TextField(
        _("role badges"),
        blank=True,
        help_text=_("Mỗi dòng là một badge vai trò, e.g.:\nThành viên Hội đồng quản lý IRDM\nNhà khoa học/chuyên gia"),
    )
    ticker_text = models.CharField(
        _("ticker bar text"),
        max_length=500,
        blank=True,
        help_text=_("Văn bản chạy ngang dưới hero, e.g. 'QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG'"),
    )
    hero_cta_label = models.CharField(
        _("hero CTA label"),
        max_length=100,
        blank=True,
        default="",
        help_text=_("Nhãn nút CTA trên hero. Để trống → dùng mặc định 'Liên hệ hợp tác'."),
    )
    contact_cta_url = models.CharField(
        _("contact CTA URL"),
        max_length=500,
        blank=True,
        default="/lien-he/",
        help_text=_("URL nút 'Liên hệ hợp tác' trên hero, e.g. /lien-he/ hoặc mailto:email@irdm.edu.vn"),
    )

    # ── Detail page — Stats snapshot ─────────────────────────────────────────
    stat_1_value = models.CharField(_("stat 1 — value"), max_length=50, blank=True, help_text=_("e.g. '40+'"))
    stat_1_label = models.CharField(_("stat 1 — label"), max_length=200, blank=True, help_text=_("e.g. 'Năm kinh nghiệm'"))
    stat_2_value = models.CharField(_("stat 2 — value"), max_length=50, blank=True, help_text=_("e.g. '100+'"))
    stat_2_label = models.CharField(_("stat 2 — label"), max_length=200, blank=True, help_text=_("e.g. 'Trường đại học tư vấn'"))
    stat_3_value = models.CharField(_("stat 3 — value"), max_length=50, blank=True, help_text=_("e.g. 'ASEAN'"))
    stat_3_label = models.CharField(_("stat 3 — label"), max_length=200, blank=True, help_text=_("e.g. 'Phạm vi nghiên cứu và hợp tác quốc tế'"))

    # ── Detail page — Content sections ───────────────────────────────────────
    experience_highlights = models.TextField(
        _("experience highlights"),
        blank=True,
        help_text=_("Các kinh nghiệm nổi bật, mỗi dòng một mục (hiển thị đánh số tự động), e.g.:\nNguyên Hiệu trưởng Đại học Cần Thơ\nChủ tịch Hội đồng Đảm bảo Chất lượng"),
    )
    discussion_topics = models.TextField(
        _("discussion topics"),
        blank=True,
        help_text=_("Các chủ đề có thể đồng hành, mỗi dòng một chủ đề (hiển thị 2 cột), e.g.:\nChiến lược phát triển Giáo dục đại học\nPhát triển chương trình đào tạo theo chuẩn đầu ra"),
    )
    notable_projects = models.TextField(
        _("notable projects"),
        blank=True,
        help_text=_("Dự án / Công trình / Chương trình tiêu biểu, mỗi dòng một mục, e.g.:\nChủ nhiệm dự án phát triển đại học quốc tế VLIR (Bỉ)\nThiết kế chương trình Thạc sĩ Quản lý Môi trường"),
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
