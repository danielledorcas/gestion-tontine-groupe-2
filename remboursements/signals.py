# signals.py

from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Remboursement, Reçu

@receiver(post_save, sender=Remboursement)
def generate_receipt(sender, instance, created, **kwargs):
    if created:
        # Créer un reçu pour le remboursement effectué
        Reçu.objects.create(
            remboursement=instance,
            membre=instance.membre,
            montant=instance.montant
        )
