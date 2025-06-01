from django.urls import path
from . import views

app_name = 'prets'

urlpatterns = [
    # Vos URLs ici
    path('', views.PretListView.as_view(), name='liste'),
    # Autres chemins...
]