# membres/models.py
from django.db import models
# from utilisateurs.models import CustomUser # Supprimez cette ligne
from django.utils import timezone
from django.conf import settings
from django.apps import apps

# membres/models.py
from django.db import models
from django.utils import timezone
from django.conf import settings
from django.apps import apps
from tontines.models import Tontine

class Membre(models.Model):
    STATUT_CHOICES = [
        ('ACTIF', 'Actif'),
        ('INACTIF', 'Inactif'),
        ('SUSPENDU', 'Suspendu'),
    ]

    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    date_naissance = models.DateField(blank=True, null=True)
    profession = models.CharField(max_length=100, blank=True)
    telephone = models.CharField(max_length=15)
    email = models.EmailField(unique=True, blank=True)
    adresse = models.TextField()
    # Utilisation d'une valeur par défaut pour date_adhesion
    date_adhesion = models.DateField(default=timezone.now)
    statut = models.CharField(max_length=10, choices=STATUT_CHOICES, default='ACTIF')
    photo = models.ImageField(upload_to='membres/photos/', blank=True, null=True)
    utilisateur = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='membre_membres')
    photo_cni = models.FileField(upload_to='membres/cni/', blank=True, null=True)
    def __str__(self):
        return f"{self.prenom} {self.nom}"

    def get_tontines(self):
        from tontines.models import Tontine
        return Tontine.objects.filter(membres_tontine__membre=self)

    def get_prets(self):
     return self.prets_operations.filter(statut__in=['EN_COURS', 'EN_RETARD'])

    
class Tontine(models.Model):
    nom = models.CharField(max_length=100)
    description = models.TextField()
    montant_cotisation = models.DecimalField(max_digits=10, decimal_places=2)
    frequence_cotisation = models.CharField(max_length=50)
    date_creation = models.DateTimeField(auto_now_add=True)
    def get_tontines(self):
     return Tontine.objects.filter(membres_tontine__membre=self)

    def __str__(self):
        return self.nom
   
   


class Pret(models.Model):
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_demande = models.DateField()

class Remboursement(models.Model):
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_remboursement = models.DateField()

class Don(models.Model):
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date = models.DateField()

class Cotisation(models.Model):
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date = models.DateField()

class CotisationDemande(models.Model):
    STATUT_CHOICES = [
        ('EN_ATTENTE', 'En attente'),
        ('VALIDE', 'Validé'),
        ('REFUSE', 'Refusé'),
    ]

    membre = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    date_demande = models.DateTimeField(auto_now_add=True)
    statut = models.CharField(max_length=20, choices=STATUT_CHOICES, default='EN_ATTENTE')

    def __str__(self):
        return f"Cotisation {self.montant} par {self.membre.username} ({self.statut})"
