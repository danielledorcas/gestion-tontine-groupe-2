# cotisations/models.py
from django.db import models
from membres.models import Membre
from tontines.models import Tontine
from django.utils import timezone

class Cotisation(models.Model):
    STATUS_CHOICES = (
        ('planifie', 'Planifiée'),
        ('paye', 'Payée'),
        ('en_retard', 'En retard'),
        ('annule', 'Annulée'),
    )
    
    membre = models.ForeignKey(Membre, on_delete=models.CASCADE, related_name='cotisations')
    tontine = models.ForeignKey(Tontine, on_delete=models.CASCADE, related_name='cotisations')
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_prevue = models.DateField()
    date_effective = models.DateField(blank=True, null=True)
    penalite = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    statut = models.CharField(max_length=10, choices=STATUS_CHOICES, default='planifie')
    date_creation = models.DateTimeField(auto_now_add=True)
    date_modification = models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name = "Cotisation"
        verbose_name_plural = "Cotisations"
        ordering = ['date_prevue']
    
    def __str__(self):
        return f"Cotisation {self.membre} - {self.tontine} - {self.date_prevue}"
    
    def save(self, *args, **kwargs):
        # Mise à jour du statut en fonction de la date
        today = timezone.now().date()
        if self.statut == 'planifie' and self.date_prevue < today:
            self.statut = 'en_retard'
            
        if self.statut == 'paye' and not self.date_effective:
            self.date_effective = today
            
        super().save(*args, **kwargs)
        
    def get_montant_total(self):
        return self.montant + self.penalite
        
    def is_late(self):
        return self.statut == 'en_retard'