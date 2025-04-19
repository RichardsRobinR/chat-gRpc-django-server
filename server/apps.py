from django.apps import AppConfig
from .utils import firebase_utils


class ServerConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'server'
    
    def ready(self):
        firebase_utils.initialize_firebase()