from django.urls import path
from . import views

app_name = 'tontines'

urlpatterns = [
    path('', views.TontineListView.as_view(), name='liste'),
    path('creer/', views.TontineCreateView.as_view(), name='creer_tontine'),
    path('<int:tontine_id>/', views.detail_tontine, name='detail_tontine'),
    path('<int:tontine_id>/modifier/', views.modifier_tontine, name='modifier_tontine'),
    path('<int:tontine_id>/supprimer/', views.supprimer_tontine, name='supprimer_tontine'),
    path('<int:tontine_id>/ajouter-membre/', views.ajouter_membre_tontine, name='ajouter_membre_tontine'),
    path('<int:tontine_id>/creer-cycle/', views.creer_cycle, name='creer_cycle'),
    path('cycle/<int:cycle_id>/', views.detail_cycle, name='detail_cycle'),
    path('cycle/<int:cycle_id>/creer-attribution/', views.creer_attribution, name='creer_attribution'),
    
]
