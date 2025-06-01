# tontines/admin.py
from django.contrib import admin
from .models import Tontine, MembreTontine, Cycle, Attribution

class TontineAdmin(admin.ModelAdmin):
    list_display = ('nom', 'tresorier', 'est_active', 'date_creation')  # Champs à afficher dans la liste
    list_filter = ('est_active', 'date_creation')  # Filtres à afficher sur le côté droit
    search_fields = ('nom', 'description')  # Champs dans lesquels effectuer la recherche
    date_hierarchy = 'date_creation'  # Navigation hiérarchique par date

admin.site.register(Tontine, TontineAdmin)  # Enregistrez le modèle avec la classe Admin

class CycleAdmin(admin.ModelAdmin):
    list_display = ('nom', 'tontine', 'date_debut', 'date_fin', 'est_actif')
    list_filter = ('tontine', 'est_actif')
    search_fields = ('nom',)
    date_hierarchy = 'date_debut'

admin.site.register(Cycle, CycleAdmin)

class AttributionAdmin(admin.ModelAdmin):
    list_display = ('cycle', 'membre', 'ordre', 'date_prevue', 'est_effectuee')
    list_filter = ('cycle', 'est_effectuee')
    search_fields = ('membre__nom', 'cycle__nom')  # Recherche dans les champs liés
    ordering = ('cycle', 'ordre')

admin.site.register(Attribution, AttributionAdmin)


admin.site.register(MembreTontine) # Enregistrement simple pour MembreTontine