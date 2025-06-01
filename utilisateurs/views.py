from django.shortcuts import render, redirect
from django.contrib.auth import login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import AuthenticationForm, PasswordChangeForm
from .forms import CustomUserCreationForm, CustomUserChangeForm
from membres.models import Membre
from tontines.models import Tontine, Cycle
from operations.models import Cotisation, Pret, Remboursement
from django.shortcuts import redirect


# --- Authentication Views ---
def register_view(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            messages.success(request, f"Compte créé pour {user.username}. Bienvenue !")
            return redirect('utilisateurs:profil')
    else:
        form = CustomUserCreationForm()
    return render(request, 'utilisateurs/register.html', {'form': form})

def login_view(request):
    if request.method == 'POST':
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            return redirect('utilisateurs:profil')
        else:
            messages.error(request, "Nom d'utilisateur ou mot de passe incorrect.")
    else:
        form = AuthenticationForm()
    return render(request, 'utilisateurs/login.html', {'form': form})

@login_required
def logout_view(request):
    logout(request)
    return redirect('connexion')  # Cette route doit exister


# --- Profile Views ---
@login_required
def profil_view(request):
    if request.method == 'POST':
        form = CustomUserChangeForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            messages.success(request, "Profil mis à jour.")
            return redirect('utilisateurs:profil')
    else:
        form = CustomUserChangeForm(instance=request.user)
    return render(request, 'utilisateurs/profile.html', {'form': form})

# --- Redirection après login selon le rôle ---
@login_required
def redirection_apres_login(request):
    user = request.user
    if hasattr(user, 'est_admin') and user.est_admin:
        return redirect('utilisateurs:admin_dashboard')
    elif hasattr(user, 'est_tresorier') and user.est_tresorier:
        return redirect('utilisateurs:tresorier_dashboard')
    else:
        return redirect('utilisateurs:user_dashboard')

# --- Dashboard Views ---
@login_required
def admin_dashboard_view(request):
    return render(request, 'utilisateurs/admin_dashboard.html')

@login_required
def tresorier_dashboard_view(request):
    return render(request, 'utilisateurs/tresorier_dashboard.html')

from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from tontines.models import Tontine, Cycle
from membres.models import Membre
from .models import Cotisation, Pret, Remboursement

@login_required
def user_dashboard_view(request):
    total_membres = Membre.objects.filter(statut='ACTIF').count()
    total_tontines = Tontine.objects.filter(est_active=True).count()
    cycles_actifs = Cycle.objects.filter(est_actif=True).count()

    cotisations_recentes = Cotisation.objects.filter(est_payee=True).order_by('-date_paiement')[:5]
    remboursements_recents = Remboursement.objects.order_by('-date_paiement')[:5]
    prets_en_cours = Pret.objects.filter(statut='EN_COURS').count()

    context = {
        'total_membres': total_membres,
        'total_tontines': total_tontines,
        'cycles_actifs': cycles_actifs,
        'cotisations_recentes': cotisations_recentes,
        'remboursements_recents': remboursements_recents,
        'prets_en_cours': prets_en_cours,
    }

    return render(request, 'utilisateurs/dashboard.html', context)
def connexion(request):
    # Ta logique de connexion ici
    return render(request, 'utilisateurs/login.html')

from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from demandes.models import DemandePret, DemandeCotisation, DemandeRemboursement, DemandeDon, AdhesionTontineDemande


@login_required
def dashboard_demande_view(request):
    user = request.user
    demandes_pret = DemandePret.objects.filter(membre=user)
    demandes_cotisation = DemandeCotisation.objects.filter(membre=user)
    demandes_remboursement = DemandeRemboursement.objects.filter(membre=user)
    demandes_don = DemandeDon.objects.filter(donateur=user)
    demandes_adhesion = AdhesionTontineDemande.objects.filter(membre=user)

    context = {
        'demandes_pret': demandes_pret,
        'demandes_cotisation': demandes_cotisation,
        'demandes_remboursement': demandes_remboursement,
        'demandes_don': demandes_don,
        'demandes_adhesion': demandes_adhesion,
    }
    return render(request, 'utilisateurs/mon_espace.html', context)
