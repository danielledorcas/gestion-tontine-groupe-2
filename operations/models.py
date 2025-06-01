from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils import timezone
from django.conf import settings
from django.contrib.auth import get_user_model
from django.db.models import Sum


#from tontines.models import Tontine, Cycle, MembreTontine # Suppression de cette ligne
#from django.apps import apps # Suppression de cette ligne

User = get_user_model()
class Cotisation(models.Model):
    membre = models.ForeignKey('membres.Membre', on_delete=models.CASCADE, related_name='cotisations_operations')
    tontine = models.ForeignKey('tontines.Tontine', on_delete=models.CASCADE, related_name='cotisations_operations')
    cycle = models.ForeignKey('tontines.Cycle', on_delete=models.CASCADE, related_name='cycles_operations')
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_prevue = models.DateField()
    date_paiement = models.DateField(auto_now_add=True)
    est_payee = models.BooleanField(default=False)
    enregistre_par = models.ForeignKey(User, on_delete=models.CASCADE, related_name='cotisations_operations')
    commentaire = models.TextField(blank=True)

    def __str__(self):
        return f"{self.membre} - {self.tontine} - {self.date_paiement}"

from django.core.exceptions import ValidationError

class Pret(models.Model):
    STATUT_CHOICES = [
        ('EN_COURS', 'En cours'),
        ('REMBOURSE', 'Remboursé'),
        ('EN_RETARD', 'En retard'),
    ]

    membre = models.ForeignKey('membres.Membre', on_delete=models.CASCADE, related_name='prets_operations')
    tontine = models.ForeignKey('tontines.Tontine', on_delete=models.CASCADE, related_name='prets_operations')
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    taux_interet = models.DecimalField(max_digits=5, decimal_places=2, default=0)
    date_demande = models.DateField(auto_now_add=True)
    date_approbation = models.DateField(blank=True, null=True)
    date_echeance = models.DateField()
    statut = models.CharField(max_length=10, choices=STATUT_CHOICES, default='EN_COURS')
    approuve_par = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='approuve_operations')

    # 📎 CNI obligatoire
    cni_justificatif = models.FileField(upload_to='prets/cni/', blank=False, null=False, verbose_name="Photocopie de la CNI")

    def clean(self):
        from tontines.models import MembreTontine  # Import ici pour éviter les boucles
        if not MembreTontine.objects.filter(membre=self.membre, tontine=self.tontine, est_actif=True).exists():
            raise ValidationError("Ce membre n'appartient pas à la tontine sélectionnée.")

    def __str__(self):
        return f"Prêt de {self.montant} à {self.membre}"

    def verifier_remboursement(self):
        from tontines.models import Remboursement  # adapte selon ton app
        total_rembourse = Remboursement.objects.filter(pret=self).aggregate(total=Sum('montant'))['total'] or 0
        if total_rembourse >= self.montant:
            self.statut = 'REMBOURSE'
            self.save()
        else:
            self.statut = 'EN_COURS'
            self.save()
            


class Remboursement(models.Model):
    pret = models.ForeignKey(Pret, on_delete=models.CASCADE, related_name='remboursements_operations')
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_paiement = models.DateField(auto_now_add=True)
    enregistre_par = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='enregistre_operations')
    commentaire = models.TextField(blank=True)

    def __str__(self):
        return f"Remboursement de {self.montant} pour {self.pret}"

class Don(models.Model):
    SENS_CHOICES = [
        ('ENTREE', 'Don reçu par la tontine'),
        ('SORTIE', 'Don fait par la tontine'),
    ]

    donateur = models.ForeignKey('tontines.MembreTontine', on_delete=models.CASCADE, null=True, blank=True, help_text="Personne qui fait le don", related_name='dons_faits_operations')
    beneficiaire = models.CharField(max_length=255, blank=True, null=True, help_text="Bénéficiaire du don si la tontine donne")
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_don = models.DateField()
    tontine = models.ForeignKey('tontines.Tontine', on_delete=models.CASCADE, related_name='dons_operations')
    sens_don = models.CharField(max_length=10, choices=SENS_CHOICES)
    motif = models.CharField(max_length=255, blank=True, null=True)
    enregistre_par = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='dons_enregistres_operations')  # Modifié ici

    def __str__(self):
        if self.sens_don == 'ENTREE':
            return f"Don de {self.donateur} à {self.tontine}"
        else:
            return f"Don de {self.tontine} à {self.beneficiaire or 'Inconnu'}"
