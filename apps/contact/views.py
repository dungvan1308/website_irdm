"""Public contact page views."""

from django.http import HttpRequest, HttpResponse
from django.shortcuts import redirect, render
from django.urls import reverse
from django.views import View

from .forms import ContactRequestForm


class ContactPageView(View):
	template_name = "contact/index.html"

	def get(self, request: HttpRequest) -> HttpResponse:
		return render(
			request,
			self.template_name,
			{
				"form": ContactRequestForm(),
				"submitted": request.GET.get("sent") == "1",
			},
		)

	def post(self, request: HttpRequest) -> HttpResponse:
		form = ContactRequestForm(request.POST)
		if form.is_valid():
			contact_request = form.save(commit=False)
			contact_request.source_url = request.POST.get("source_url", "")[:500]
			contact_request.save()
			return redirect(f"{reverse('contact:index')}?sent=1#contact-form")

		return render(
			request,
			self.template_name,
			{"form": form, "submitted": False},
			status=400,
		)
