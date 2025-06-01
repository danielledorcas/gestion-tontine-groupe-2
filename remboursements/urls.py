from django.urls import path
from . import views

app_name = 'remboursements'

urlpatterns = [
    path('', views.RemboursementListView.as_view(), name='liste'),
    # Autres URLs...
]