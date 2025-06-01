from django.apps import AppConfig
from django.db.models.signals import post_save
from django.dispatch import receiver



class RemboursementsConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'remboursements'


class MembresConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'membres'

    def ready(self):
        import membres.signals 

