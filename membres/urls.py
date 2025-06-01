# membres/urls.py
from django.urls import path
from . import views
from .views import MembreListView

app_name = 'membres'

urlpatterns = [
    path('', MembreListView.as_view(), name='liste_membres'),
    path('creer/', views.MembreCreateView.as_view(), name='creer_membre'),
    path('<int:pk>/', views.MembreDetailView.as_view(), name='detail_membre'),
    path('<int:pk>/modifier/', views.MembreUpdateView.as_view(), name='modifier_membre'),
    path('<int:pk>/supprimer/', views.MembreDeleteView.as_view(), name='supprimer_membre'),
]
