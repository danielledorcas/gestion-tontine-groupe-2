# membres/signals.py
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth import get_user_model
from .models import Membre

User = get_user_model()

@receiver(post_save, sender=Membre)
def creer_utilisateur_lie(sender, instance, created, **kwargs):
    if created and not instance.utilisateur:
        # Crée un username basé sur l'email ou une valeur par défaut
        username = instance.email if instance.email else f"user{instance.id}"
        password = User.objects.make_random_password()
        utilisateur = User.objects.create_user(
            username=username,
            email=instance.email,
            password=password,
            role='user'
        )
        instance.utilisateur = utilisateur
        instance.save()
from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Membre
from tontines.models import Tontine, MembreTontine

@receiver(post_save, sender=Membre)
def ajouter_a_tontine_presence(sender, instance, created, **kwargs):
    if created:
        try:
            tontine_presence = Tontine.objects.get(nom="Présence")
            MembreTontine.objects.get_or_create(membre=instance, tontine=tontine_presence)
        except Tontine.DoesNotExist:
            # Crée automatiquement la Tontine si elle n'existe pas (optionnel)
            tontine_presence = Tontine.objects.create(nom="Présence", montant_cotisation=0, frequence_cotisation="mensuel", est_active=True)
            MembreTontine.objects.create(membre=instance, tontine=tontine_presence)
