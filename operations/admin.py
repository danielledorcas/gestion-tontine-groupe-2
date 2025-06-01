from django.contrib import admin
from django.utils.html import format_html
from django.utils.translation import gettext_lazy as _
from .models import ( Cotisation, Pret, Remboursement, Don
)

# -----------------------
# DÉFINITIONS UTILITAIRES
# -----------------------

def approuver_action(modeladmin, request, queryset):
    queryset.update(approuve=True, traite=True)
approuver_action.short_description = "✅ Approuver les demandes sélectionnées"

def rejeter_action(modeladmin, request, queryset):
    queryset.update(approuve=False, traite=True)
rejeter_action.short_description = "❌ Rejeter les demandes sélectionnées"

# -------------------
# ADMIN DES DEMANDES
# -------------------


# -------------------
# ADMIN DES OPÉRATIONS
# -------------------

@admin.register(Cotisation)
class CotisationAdmin(admin.ModelAdmin):
    list_display = ('id', 'membre', 'montant', 'date_paiement', 'tontine', 'cycle', 'enregistre_par')
    list_filter = ('tontine', 'cycle', 'date_paiement')
    search_fields = ('membre__nom_complet', 'tontine__nom')
    ordering = ('-date_paiement',)


@admin.register(Pret)
class PretAdmin(admin.ModelAdmin):
    list_display = ('membre', 'montant', 'taux_interet', 'date_demande', 'date_echeance', 'statut', 'approuve_par')
    list_filter = ('statut', 'date_demande')
    search_fields = ('membre__nom_complet',)
    ordering = ('-date_demande',)


@admin.register(Remboursement)
class RemboursementAdmin(admin.ModelAdmin):
    list_display = ('id', 'membre_nom', 'montant', 'date_paiement', 'pret', 'enregistre_par')
    list_filter = ('date_paiement',)
    search_fields = ('pret__membre__nom', 'pret__membre__prenom')
    ordering = ('-date_paiement',)

    @admin.display(description="Membre")
    def membre_nom(self, obj):
        return f"{obj.pret.membre.prenom} {obj.pret.membre.nom}"


@admin.register(Don)
class DonAdmin(admin.ModelAdmin):
    list_display = ('id', 'tontine', 'sens_don', 'donateur', 'beneficiaire', 'montant', 'date_don', 'enregistre_par')
    list_filter = ('sens_don', 'tontine', 'date_don')
    search_fields = ('donateur__membre__nom_complet', 'beneficiaire')
    ordering = ('-date_don',)
