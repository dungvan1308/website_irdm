from django.http import HttpRequest, HttpResponse
from django.shortcuts import render


def error_404(request: HttpRequest, exception: Exception) -> HttpResponse:
	"""Render the public not-found page without exposing draft content."""
	return render(request, "errors/404.html", status=404)
