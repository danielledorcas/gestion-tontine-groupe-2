from django.urls import path
from . import views

app_name = 'don'

urlpatterns = [
    path('', views.DonListView.as_view(), name='liste'),
    path('ajouter/', views.DonCreateView.as_view(), name='ajouter'),
    path('<int:pk>/', views.DonDetailView.as_view(), name='detail'),
    path('<int:pk>/modifier/', views.DonUpdateView.as_view(), name='modifier'),
    path('<int:pk>/supprimer/', views.DonDeleteView.as_view(), name='supprimer'),
]
from django.urls import path
from . import views

urlpatterns = [
    path('liste/', views.liste_dons, name='liste_dons'),
]
