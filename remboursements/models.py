# remboursements/models.py
from django.db import models
from prets.models import Pret
from django.utils import timezone

class Remboursement(models.Model):
    STATUS_CHOICES = (
        ('planifie', 'Planifié'),
        ('paye', 'Payé'),
        ('en_retard', 'En retard'),
        ('annule', 'Annulé'),
    )
    
    pret = models.ForeignKey(Pret, on_delete=models.CASCADE, related_name='remboursements')
    montant_principal = models.DecimalField(max_digits=10, decimal_places=2)
    montant_interet = models.DecimalField(max_digits=10, decimal_places=2)
    date_prevue = models.DateField()
    date_effective = models.DateField(blank=True, null=True)
    penalite = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    statut = models.CharField(max_length=10, choices=STATUS_CHOICES, default='planifie')
    date_creation = models.DateTimeField(auto_now_add=True)
    date_modification = models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name = "Remboursement"
        verbose_name_plural = "Remboursements"
        ordering = ['date_prevue']
    
    def __str__(self):
        return f"Remboursement {self.pret} - {self.date_prevue}"
    
    def save(self, *args, **kwargs):
        # Mise à jour du statut en fonction de la date
        today = timezone.now().date()
        if self.statut == 'planifie' and self.date_prevue < today:
            self.statut = 'en_retard'
            
        if self.statut == 'paye' and not self.date_effective:
            self.date_effective = today
            
        super().save(*args, **kwargs)
        
        # Mettre à jour le statut du prêt si tous les remboursements sont effectués
        self.update_pret_status()
    
    def update_pret_status(self):
        pret = self.pret
        remboursements = pret.remboursements.all()
        total_remboursements = remboursements.count()
        remboursements_payes = remboursements.filter(statut='paye').count()
        
        if remboursements_payes == total_remboursements:
            pret.statut = 'termine'
            pret.save()
        elif remboursements_payes > 0 and pret.statut == 'approuve':
            pret.statut = 'en_cours'
            pret.save()
            
    def get_montant_total(self):
        return self.montant_principal + self.montant_interet + self.penalite
        
    def is_late(self):
        return self.statut == 'en_retard'
   # models.py

from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User



class Recu(models.Model):
    membre = models.ForeignKey('membres.Membre', on_delete=models.CASCADE)
    remboursement = models.OneToOneField(Remboursement, on_delete=models.CASCADE)
    date_emission = models.DateField(auto_now_add=True)

    def __str__(self):
        return f"Reçu pour {self.membre.nom} - {self.date_emission}"