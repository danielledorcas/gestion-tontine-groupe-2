# tontines/models.py

from django.db import models
from django.conf import settings
from django.utils import timezone
import datetime
from django.contrib.auth.models import User


class Tontine(models.Model):
    nom = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    montant_cotisation = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    frequence_cotisation = models.CharField(max_length=50, choices=[
        ('hebdomadaire', 'Hebdomadaire'),
        ('mensuelle', 'Mensuelle'),
        ('trimestrielle', 'Trimestrielle'),
    ], default='mensuelle')
    jour_cotisation = models.CharField(max_length=20, blank=True, null=True)  # Par exemple "Lundi"
    tresorier = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True, blank=True)
    est_active = models.BooleanField(default=True)
    date_creation = models.DateTimeField(auto_now_add=True)
  
    

    def formatted_date_creation(self):
        if self.date_creation:
            date_creation_dt = self.date_creation
            return timezone.localtime(date_creation_dt).strftime("%d/%m/%Y")
        return "-"

    def __str__(self):
        return self.nom


class MembreTontine(models.Model):
    membre = models.ForeignKey('membres.Membre', on_delete=models.CASCADE, related_name='participations_tontine')
    tontine = models.ForeignKey(Tontine, on_delete=models.CASCADE, null=True, related_name='membres_tontine')  # ✅ ici
    date_adhesion = models.DateField(null=True, blank=True)
    est_actif = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.membre}"

    def get_date_adhesion_as_datetime(self):
        if self.date_adhesion:
            return datetime.datetime.combine(self.date_adhesion, datetime.time.min)
        return None


class Cycle(models.Model):
    tontine = models.ForeignKey(Tontine, on_delete=models.CASCADE, related_name='cycles')
    nom = models.CharField(max_length=100)
    date_debut = models.DateTimeField()
    date_fin = models.DateTimeField(blank=True, null=True)
    est_actif = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.nom} - {self.tontine}"


class Attribution(models.Model):
    cycle = models.ForeignKey(Cycle, on_delete=models.CASCADE, related_name='attributions')
    membre = models.ForeignKey('membres.Membre', on_delete=models.CASCADE, related_name='attributions')
    ordre = models.PositiveIntegerField()
    date_prevue = models.DateTimeField()
    date_reelle = models.DateTimeField(blank=True, null=True)
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    est_effectuee = models.BooleanField(default=False)

    class Meta:
        unique_together = ('cycle', 'ordre')
        ordering = ['ordre']

    def __str__(self):
        return f"{self.cycle} - Tour {self.ordre} - {self.membre}"