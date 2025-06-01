print("✅ demandes admin chargé")

from django.contrib import admin
from membres.admin import custom_admin_site  # Site admin personnalisé

from demandes.models import (
    DemandePret, DemandeCotisation, DemandeDon,
    AdhesionTontineDemande, DemandeRemboursement, TestDemande
)

from operations.models import Pret, Cotisation, Don, Remboursement
from tontines.models import MembreTontine


# 🔹 Action : Approuver Prêt
def approuver_pret(modeladmin, request, queryset):
    for demande in queryset:
        if not demande.traite:
            demande.approuve = True
            demande.traite = True
            demande.save()

            Pret.objects.create(
                membre=demande.membre,
                montant=demande.montant,
                date_demande=demande.date_demande,
                statut='APPROUVE'
            )
approuver_pret.short_description = "✅ Approuver"

# 🔹 Action : Approuver Cotisation
def approuver_cotisation(modeladmin, request, queryset):
    for demande in queryset:
        if not demande.traite:
            demande.approuve = True
            demande.traite = True
            demande.save()

            Cotisation.objects.create(
                membre=demande.membre,
                montant=demande.montant,
                date_cotisation=demande.date_demande
            )
approuver_cotisation.short_description = "✅ Approuver"

# 🔹 Action : Approuver Don
def approuver_don(modeladmin, request, queryset):
    for demande in queryset:
        if not demande.traite:
            demande.approuve = True
            demande.traite = True
            demande.save()

            Don.objects.create(
                donateur=demande.donateur,
                montant=demande.montant,
                motif=demande.motif,
                date_don=demande.date_demande
            )
approuver_don.short_description = "✅ Approuver"

# 🔹 Action : Approuver Adhésion
def approuver_adhesion(modeladmin, request, queryset):
    for demande in queryset:
        if not demande.traite:
            demande.approuve = True
            demande.traite = True
            demande.save()

            MembreTontine.objects.create(
                membre=demande.membre,
                tontine=demande.tontine
            )
approuver_adhesion.short_description = "✅ Approuver"

# 🔹 Action : Approuver Remboursement
def approuver_remboursement(modeladmin, request, queryset):
    for demande in queryset:
        if demande.statut == 'EN_ATTENTE':
            demande.statut = 'APPROUVEE'
            demande.save()

            Remboursement.objects.create(
                membre=demande.membre,
                pret=demande.pret,
                montant=demande.montant,
                date_remboursement=demande.date_demande
            )
approuver_remboursement.short_description = "✅ Approuver"


# 🔸 Action : Rejeter
def rejeter(modeladmin, request, queryset):
    queryset.update(approuve=False, traite=True)
rejeter.short_description = "❌ Rejeter"

# ==========================
# ENREGISTREMENT DES ADMIN
# ==========================

@admin.register(DemandePret, site=custom_admin_site)
class DemandePretAdmin(admin.ModelAdmin):
    list_display = ('membre', 'montant', 'approuve', 'traite', 'notification_envoyee', 'date_demande')
    actions = [approuver_pret, rejeter]

@admin.register(DemandeCotisation, site=custom_admin_site)
class DemandeCotisationAdmin(admin.ModelAdmin):
    list_display = ('membre', 'montant', 'approuve', 'traite', 'notification_envoyee', 'date_demande')
    actions = [approuver_cotisation, rejeter]

@admin.register(DemandeDon, site=custom_admin_site)
class DemandeDonAdmin(admin.ModelAdmin):
    list_display = ('donateur', 'montant', 'motif', 'approuve', 'traite', 'notification_envoyee', 'date_demande')
    actions = [approuver_don, rejeter]

@admin.register(AdhesionTontineDemande, site=custom_admin_site)
class AdhesionTontineDemandeAdmin(admin.ModelAdmin):
    list_display = ('membre', 'tontine', 'approuve', 'traite', 'notification_envoyee', 'date_demande')
    actions = [approuver_adhesion, rejeter]

@admin.register(DemandeRemboursement, site=custom_admin_site)
class DemandeRemboursementAdmin(admin.ModelAdmin):
    list_display = ('membre', 'pret', 'montant', 'statut', 'notification_envoyee', 'date_demande')
    actions = [approuver_remboursement]

# Autre modèle test
custom_admin_site.register(TestDemande)

