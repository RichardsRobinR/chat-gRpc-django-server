from django.apps import AppConfig
from mongoengine import connect


class ServerConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'server'

    def ready(self):
        connect(
            host="mongodb+srv://richierichr:1210@awscluster.eobbnxt.mongodb.net/?retryWrites=true&w=majority&appName=AWSCluster",
            db="connect_db",
        )
