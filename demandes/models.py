from django.db import models
from django.conf import settings
from tontines.models import Tontine
from operations.models import Pret

class DemandePret(models.Model):
    membre = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_demande = models.DateTimeField(auto_now_add=True)
    approuve = models.BooleanField(default=False)
    traite = models.BooleanField(default=False)
    notification_envoyee = models.BooleanField(default=False)

class DemandeCotisation(models.Model):
    membre = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_demande = models.DateTimeField(auto_now_add=True)
    approuve = models.BooleanField(default=False)
    traite = models.BooleanField(default=False)
    notification_envoyee = models.BooleanField(default=False)

class DemandeDon(models.Model):
    donateur = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='dons_effectues')
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_demande = models.DateTimeField(auto_now_add=True)
    approuve = models.BooleanField(default=False)
    traite = models.BooleanField(default=False)
    motif = models.TextField(blank=True)
    notification_envoyee = models.BooleanField(default=False)

class AdhesionTontineDemande(models.Model):
    membre = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    tontine = models.ForeignKey(Tontine, on_delete=models.CASCADE)
    date_demande = models.DateTimeField(auto_now_add=True)
    approuve = models.BooleanField(default=False)
    traite = models.BooleanField(default=False)
    notification_envoyee = models.BooleanField(default=False)

class DemandeRemboursement(models.Model):
    STATUT_CHOICES = [
        ('EN_ATTENTE', 'En attente'),
        ('APPROUVEE', 'Approuvée'),
        ('REJETEE', 'Rejetée'),
    ]
    membre = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    pret = models.ForeignKey(Pret, on_delete=models.CASCADE)
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    commentaire = models.TextField(blank=True, null=True)
    date_demande = models.DateTimeField(auto_now_add=True)
    statut = models.CharField(max_length=20, choices=STATUT_CHOICES, default='EN_ATTENTE')
    notification_envoyee = models.BooleanField(default=False)
from django.db import models

class TestDemande(models.Model):
    nom = models.CharField(max_length=100)

    def __str__(self):
        return self.nom
