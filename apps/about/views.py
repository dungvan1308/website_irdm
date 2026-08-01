"""About page views."""

from django.views.generic import TemplateView

from .services import AboutService


class AboutPageView(TemplateView):
    """Public /ve-irdm/ page."""

    template_name = "about/about.html"

    def get_context_data(self, **kwargs: object) -> dict:
        ctx = super().get_context_data(**kwargs)
        ctx["seo"] = AboutService.get_seo()
        ctx["hero"] = AboutService.get_hero()
        ctx["introduction"] = AboutService.get_introduction()
        ctx["purpose"] = AboutService.get_purpose()
        ctx["vision_mission"] = AboutService.get_vision_mission()
        ctx["core_value_section"] = AboutService.get_core_value_section()
        ctx["core_values"] = AboutService.get_core_values()
        ctx["legal_info"] = AboutService.get_legal_info()
        ctx["cta_banner"] = AboutService.get_cta_banner()
        ctx["partner_benefit_section"] = AboutService.get_partner_benefit_section()
        ctx["network_header"] = AboutService.get_network_header()
        ctx["professional_networks"] = AboutService.get_professional_networks()
        ctx["target_audience_section"] = AboutService.get_target_audience_section()
        ctx["capability_ecosystem"] = AboutService.get_capability_ecosystem()
        ctx["contact_banner"] = AboutService.get_contact_banner()
        return ctx
