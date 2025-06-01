from django.urls import path
from . import views

app_name = 'cotisation'

urlpatterns = [
    path('', views.CotisationListView.as_view(), name='liste'),
    path('ajouter/', views.CotisationCreateView.as_view(), name='ajouter'),
    path('<int:pk>/', views.CotisationDetailView.as_view(), name='detail'),
    path('<int:pk>/modifier/', views.CotisationUpdateView.as_view(), name='modifier'),
    path('<int:pk>/supprimer/', views.CotisationDeleteView.as_view(), name='supprimer'),
]
