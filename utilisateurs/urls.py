from django.urls import path
from . import views
from django.contrib.auth import views as auth_views
from .views import dashboard_demande_view

app_name = 'utilisateurs'  # Ou le nom de votre application

urlpatterns = [
    path('register/', views.register_view, name='register'),
   path('login/', auth_views.LoginView.as_view(template_name='utilisateurs/login.html'), name='login'),
    path('logout/', views.logout_view, name='logout'),
     path('profil/', views.profil_view, name='profil'),
    path('redirection/', views.redirection_apres_login, name='redirection'),
    path('admin_dashboard/', views.admin_dashboard_view, name='admin_dashboard'),
    path('tresorier_dashboard/', views.tresorier_dashboard_view, name='tresorier_dashboard'),
    path('user_dashboard/', views.user_dashboard_view, name='user_dashboard'),
    path('dashboard/', views.user_dashboard_view, name='dashboard'),
    path('mon-espace/', dashboard_demande_view, name='mon_espace'),
]