from django.urls import path
from . import views

urlpatterns = [
    path('cotisations/', views.liste_cotisations, name='liste_cotisations'),
    path('cotisations/creer/', views.enregistrer_cotisation, name='enregistrer_cotisation'),
    path('cotisations/creer/tontine/<int:tontine_id>/', views.enregistrer_cotisation, name='enregistrer_cotisation_tontine'),
    path('cotisations/creer/cycle/<int:cycle_id>/', views.enregistrer_cotisation, name='enregistrer_cotisation_cycle'),
    
    path('prets/', views.liste_prets, name='liste_prets'),
    path('prets/creer/', views.enregistrer_pret, name='enregistrer_pret'),
    path('prets/creer/tontine/<int:tontine_id>/', views.enregistrer_pret, name='enregistrer_pret_tontine'),
    path('prets/<int:pret_id>/', views.detail_pret, name='detail_pret'),
    path('prets/<int:pret_id>/remboursement/', views.enregistrer_remboursement, name='enregistrer_remboursement'),
    
    path('dons/', views.liste_dons, name='liste_dons'),
    path('dons/creer/', views.enregistrer_don, name='enregistrer_don'),
    path('dons/creer/tontine/<int:tontine_id>/', views.enregistrer_don, name='enregistrer_don_tontine'),
    path('demande/pret/', views.demander_pret, name='demander_pret'),
    path('demande/cotisation/', views.demander_cotisation, name='demander_cotisation'),
    path('demande/don/', views.faire_don, name='faire_don'),
    path('demande/adhesion/', views.demander_adhesion_tontine, name='adhesion_tontine'),
    path('prets/<int:pret_id>/demande-remboursement/', views.demander_remboursement, name='enregistrer_remboursement'),
path('remboursement/nouveau/<int:pret_id>/', views.demander_remboursement, name='demander_remboursement'),

    path('admin/validations/prets/', views.valider_demandes_pret, name='valider_demandes_pret'),
    # Et les autres validations
]