from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils import timezone
from django.conf import settings
from tontines.models import Tontine, Cycle, MembreTontine
from django.apps import apps
from django.contrib.auth import get_user_model
from membres.models import Membre
# from membres.models import Membre  # Supprimez cette ligne

class CustomUser(AbstractUser):
    telephone = models.CharField(max_length=20, blank=True, null=True)
    adresse = models.CharField(max_length=255, blank=True, null=True)
    est_admin = models.BooleanField(default=False)
    est_tresorier = models.BooleanField(default=False)
    ROLE_CHOICES = (
        ('admin', 'Administrateur'),
        ('user', 'Utilisateur'),
    )
    tontines = models.ManyToManyField(
        'tontines.Tontine',  # Correction ici
        related_name='customuser_tontines',  # related_name modifié
        blank=True
    )
    role = models.CharField(max_length=10, choices=ROLE_CHOICES, default='user')

    def __str__(self):
        return self.username




User = get_user_model()


class Cotisation(models.Model):
    membres = Membre.objects.all()# Utilisez une chaîne
    tontine = models.ForeignKey(Tontine, on_delete=models.CASCADE)
    cycle = models.ForeignKey(Cycle, on_delete=models.CASCADE)
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_prevue = models.DateField()
    date_paiement = models.DateField(auto_now_add=True)
    est_payee = models.BooleanField(default=False)
    enregistre_par = models.ForeignKey(User, on_delete=models.CASCADE, related_name='cotisations_utilisateurs')
    commentaire = models.TextField(blank=True)

    def __str__(self):
        return f"{self.membre} - {self.tontine} - {self.date_paiement}"


class Pret(models.Model):
    STATUT_CHOICES = [
        ('EN_COURS', 'En cours'),
        ('REMBOURSE', 'Remboursé'),
        ('EN_RETARD', 'En retard'),
    ]

  
    membre = models.ForeignKey(Membre, on_delete=models.CASCADE, related_name='prets_utilisateur')
    # ... autres champs

    tontine = models.ForeignKey(Tontine, on_delete=models.CASCADE)
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    taux_interet = models.DecimalField(max_digits=5, decimal_places=2, default=0)
    date_demande = models.DateField(auto_now_add=True)
    date_approbation = models.DateField(blank=True, null=True)
    date_echeance = models.DateField()
    statut = models.CharField(max_length=10, choices=STATUT_CHOICES, default='EN_COURS')
    approuve_par = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='prets_utilisateurs')

    def __str__(self):
        return f"Prêt de {self.montant} à {self.membre}"


class Remboursement(models.Model):
    pret = models.ForeignKey(Pret, on_delete=models.CASCADE)
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_paiement = models.DateField(auto_now_add=True)
    enregistre_par = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='remboursements_utilisateurs')
    commentaire = models.TextField(blank=True)

    def __str__(self):
        return f"Remboursement de {self.montant} pour {self.pret}"


class Don(models.Model):
    SENS_CHOICES = (
        ('ENTREE', 'Don reçu par la tontine'),
        ('SORTIE', 'Don fait par la tontine'),
    )

    donateur = models.ForeignKey(MembreTontine, on_delete=models.CASCADE, null=True, blank=True,
                                 help_text="Personne qui fait le don")
    beneficiaire = models.CharField(max_length=255, blank=True, null=True,
                                    help_text="Bénéficiaire du don si la tontine donne")
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_don = models.DateField()
    tontine = models.ForeignKey(Tontine, on_delete=models.CASCADE)
    sens_don = models.CharField(max_length=10, choices=SENS_CHOICES)
    motif = models.CharField(max_length=255, blank=True, null=True)
    enregistre_par = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,
                                         related_name='dons_utilisateurs')  # Modifié ici

    def __str__(self):
        if self.sens_don == 'ENTREE':
            return f"Don de {self.donateur} à {self.tontine}"
        else:
            return f"Don de {self.tontine} à {self.beneficiaire or 'Inconnu'}"