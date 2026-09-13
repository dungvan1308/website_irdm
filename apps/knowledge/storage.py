from django.conf import settings
from django.core.files.storage import FileSystemStorage
from pathlib import Path


class KnowledgeBodyImageStorage(FileSystemStorage):
    def __init__(self, *args, **kwargs):
        kwargs.setdefault("location", Path(settings.MEDIA_ROOT) / "knowledge/articles/body")
        kwargs.setdefault("base_url", f"{settings.MEDIA_URL}knowledge/articles/body/")
        super().__init__(*args, **kwargs)
