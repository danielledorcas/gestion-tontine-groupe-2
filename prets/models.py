from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils import timezone
from django.conf import settings
from tontines.models import Tontine, Cycle, MembreTontine
from django.apps import apps
from django.contrib.auth import get_user_model


class Pret(models.Model):
    STATUT_CHOICES = [
        ('EN_COURS', 'En cours'),
        ('REMBOURSE', 'Remboursé'),
        ('EN_RETARD', 'En retard'),
    ]

    membre = models.ForeignKey('membres.Membre', on_delete=models.CASCADE, related_name='prets_prets')
    tontine = models.ForeignKey('tontines.Tontine', on_delete=models.CASCADE, related_name='prets_prets')
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    taux_interet = models.DecimalField(max_digits=5, decimal_places=2, default=0)
    date_demande = models.DateField(auto_now_add=True)
    date_approbation = models.DateField(blank=True, null=True)
    date_echeance = models.DateField()
    statut = models.CharField(max_length=10, choices=STATUT_CHOICES, default='EN_COURS')
    approuve_par = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)

    def __str__(self):
        return f"Prêt de {self.montant} à {self.membre}"


class Remboursement(models.Model):
    pret = models.ForeignKey(Pret, on_delete=models.CASCADE)
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_paiement = models.DateField(auto_now_add=True)
    enregistre_par = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    commentaire = models.TextField(blank=True)

    def __str__(self):
        return f"Remboursement de {self.montant} pour {self.pret}"


