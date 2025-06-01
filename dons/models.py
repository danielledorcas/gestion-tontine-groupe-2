# dons/models.py
from django.db import models
from membres.models import Membre
from django.utils import timezone

class Don(models.Model):
    STATUS_CHOICES = (
        ('enregistre', 'Enregistré'),
        ('distribue', 'Distribué'),
        ('annule', 'Annulé'),
    )
    
    membre = models.ForeignKey(Membre, on_delete=models.CASCADE, related_name='dons')
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    description = models.TextField(blank=True, null=True)
    date = models.DateField(default=timezone.now)
    beneficiaire = models.CharField(max_length=255)
    statut = models.CharField(max_length=10, choices=STATUS_CHOICES, default='enregistre')
    date_creation = models.DateTimeField(auto_now_add=True)
    date_modification = models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name = "Don"
        verbose_name_plural = "Dons"
        ordering = ['-date']
    
    def __str__(self):
        return f"Don de {self.membre} - {self.montant}€ - {self.beneficiaire}"