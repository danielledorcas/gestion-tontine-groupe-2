from django.db import models
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import Cotisation, Pret, Remboursement, Don
from .forms import CotisationForm, PretForm, RemboursementForm, DonForm
from tontines.models import Tontine, Cycle, MembreTontine
from django.core.paginator import Paginator

@login_required
def enregistrer_cotisation(request, tontine_id=None, cycle_id=None):
    if tontine_id:
        tontine = get_object_or_404(Tontine, pk=tontine_id)
        initial_data = {'tontine': tontine}
        if cycle_id:
            cycle = get_object_or_404(Cycle, pk=cycle_id)
            initial_data['cycle'] = cycle
    else:
        initial_data = {}
    
    if request.method == 'POST':
        form = CotisationForm(request.POST)
        if form.is_valid():
            cotisation = form.save(commit=False)
            cotisation.enregistre_par = request.user
            cotisation.save()
            messages.success(request, "La cotisation a été enregistrée avec succès.")
            
            # Rediriger vers le détail du cycle si disponible
            if cycle_id:
                return redirect('detail_cycle', cycle_id=cycle_id)
            elif tontine_id:
                return redirect('detail_tontine', tontine_id=tontine_id)
            else:
                return redirect('liste_cotisations')
    else:
        form = CotisationForm(initial=initial_data)
    
    return render(request, 'operations/formulaire_cotisation.html', {
        'form': form, 
        'title': 'Enregistrer une cotisation'
    })

@login_required
def liste_cotisations(request):
    cotisations = Cotisation.objects.all().order_by('-date_paiement')
    return render(request, 'operations/liste_cotisations.html', {'cotisations': cotisations})

@login_required
def enregistrer_pret(request, tontine_id=None):
    if tontine_id:
        tontine = get_object_or_404(Tontine, pk=tontine_id)
        initial_data = {'tontine': tontine}
    else:
        initial_data = {}
    
    if request.method == 'POST':
        form = PretForm(request.POST, request.FILES)  # ✅ Ajout de request.FILES
        if form.is_valid():
            pret = form.save(commit=False)
            pret.approuve_par = request.user
            pret.save()
            messages.success(request, "Le prêt a été enregistré avec succès.")
            return redirect('liste_prets')
    else:
        form = PretForm(initial=initial_data)
    
    return render(request, 'operations/formulaire_pret.html', {
        'form': form, 
        'title': 'Enregistrer un prêt'
    })
@login_required
def liste_prets(request):
    prets = Pret.objects.all().order_by('-date_demande')
    return render(request, 'operations/liste_prets.html', {'prets': prets})

@login_required
def detail_pret(request, pret_id):
    pret = get_object_or_404(Pret, pk=pret_id)
    remboursements = Remboursement.objects.filter(pret=pret).order_by('-date_paiement')
    
    # Calculer le montant total remboursé
    total_rembourse = sum(r.montant for r in remboursements)
    reste_a_payer = pret.montant - total_rembourse
    
    return render(request, 'operations/detail_pret.html', {
        'pret': pret,
        'remboursements': remboursements,
        'total_rembourse': total_rembourse,
        'reste_a_payer': reste_a_payer
    })

@login_required
def enregistrer_remboursement(request, pret_id):
    pret = get_object_or_404(Pret, pk=pret_id)
    
    if request.method == 'POST':
        form = RemboursementForm(request.POST)
        if form.is_valid():
            remboursement = form.save(commit=False)
            remboursement.pret = pret
            remboursement.enregistre_par = request.user
            remboursement.save()
            
            # Mettre à jour le statut du prêt si entièrement remboursé
            total_rembourse = Remboursement.objects.filter(pret=pret).aggregate(
                total= models.Sum('montant'))['total'] or 0
            
            if total_rembourse >= pret.montant:
                pret.statut = 'REMBOURSE'
                pret.save()
            
            messages.success(request, "Le remboursement a été enregistré avec succès.")
            return redirect('detail_pret', pret_id=pret.id)
    else:
        form = RemboursementForm(initial={'pret': pret})
    
    return render(request, 'operations/formulaire_remboursement.html', {
        'form': form, 
        'pret': pret,
        'title': 'Enregistrer un remboursement'
    })

@login_required
def enregistrer_don(request, tontine_id=None):
    if tontine_id:
        tontine = get_object_or_404(Tontine, pk=tontine_id)
        initial_data = {'tontine': tontine}
    else:
        initial_data = {}
    
    if request.method == 'POST':
        form = DonForm(request.POST)
        if form.is_valid():
            don = form.save(commit=False)
            don.enregistre_par = request.user
            don.save()
            messages.success(request, "Le don a été enregistré avec succès.")
            return redirect('liste_dons')
    else:
        form = DonForm(initial=initial_data)
    
    return render(request, 'operations/formulaire_don.html', {
        'form': form, 
        'title': 'Enregistrer un don'
    })

@login_required
def liste_dons(request):
    dons = Don.objects.all().order_by('-date_don')
    return render(request, 'operations/liste_dons.html', {'dons': dons})
@login_required
def liste_remboursements(request):
     remboursements_list = Remboursement.objects.select_related('pret', 'enregistre_par', 'pret__membre').all().order_by('-date_paiement')
     paginator = Paginator(remboursements_list, 10)  # 10 remboursements par page

     page_number = request.GET.get('page')
     remboursements = paginator.get_page(page_number)

     return render(request, 'cotisations/liste_remboursements.html', {'remboursements': remboursements})

from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from .forms import PretDemandeForm
from demandes.models import DemandePret

@login_required
def demander_pret(request):
    if request.method == 'POST':
        form = PretDemandeForm(request.POST)
        if form.is_valid():
            demande = form.save(commit=False)
            demande.membre = request.user.membre
            demande.est_valide = False
            demande.save()
            return redirect('utilisateurs:user_dashboard')
    else:
        form = PretDemandeForm()
    return render(request, 'operations/demande_pret.html', {'form': form})

from .forms import CotisationDemandeForm
from demandes.models import DemandeCotisation

@login_required
def demander_cotisation(request):
    if request.method == 'POST':
        form = CotisationDemandeForm(request.POST)
        if form.is_valid():
            cotisation = form.save(commit=False)
            cotisation.membre = request.user.membre
            cotisation.est_valide = False
            cotisation.save()
            return redirect('utilisateurs:user_dashboard')
    else:
        form = CotisationDemandeForm()
    return render(request, 'operations/demande_cotisation.html', {'form': form})

from .forms import RemboursementForm

@login_required
def demander_remboursement(request, pret_id):  # ← ici, on ajoute le paramètre pret_id
    pret = get_object_or_404(Pret, id=pret_id)
    if request.method == 'POST':
        form = RemboursementForm(request.POST)
        if form.is_valid():
            remboursement = form.save(commit=False)
            remboursement.est_valide = False
            remboursement.save()
            return redirect('utilisateurs:user_dashboard')
    else:
        form = RemboursementForm()
    return render(request, 'operations/demande_remboursement.html', {'form': form})

from .forms import DonForm

@login_required
def faire_don(request):
    if request.method == 'POST':
        form = DonForm(request.POST)
        if form.is_valid():
            don = form.save(commit=False)
            don.donateur = request.user.membre
            don.est_valide = False
            don.save()
            return redirect('utilisateurs:user_dashboard')
    else:
        form = DonForm()
    return render(request, 'operations/demande_don.html', {'form': form})

from .forms import DemandeAdhesionTontineForm


@login_required
def demander_adhesion_tontine(request):
    if request.method == 'POST':
        form = DemandeAdhesionTontineForm()

        if form.is_valid():
            demande = form.save(commit=False)
            demande.membre = request.user.membre
            demande.est_valide = False
            demande.save()
            return redirect('utilisateurs:user_dashboard')
    else:
        form = DemandeAdhesionTontineForm()
    return render(request, 'operations/demande_adhesion.html', {'form': form})

from django.contrib.auth.decorators import user_passes_test
from django.shortcuts import render, redirect
from demandes.models import DemandePret

def is_admin(user):
    return user.is_authenticated and user.est_admin  # adapte selon ton modèle

@user_passes_test(is_admin)
def valider_demandes_pret(request):
    demandes = DemandePret.objects.filter(est_valide=False)
    
    if request.method == 'POST':
        # Ici, par exemple, on récupère les IDs des demandes à valider
        demandes_ids = request.POST.getlist('demandes')
        for demande_id in demandes_ids:
            demande = DemandePret.objects.get(pk=demande_id)
            demande.est_valide = True
            demande.save()
        return redirect('url_de_redirection_apres_validation')  # adapte l’URL
    
    return render(request, 'operations/valider_demandes_pret.html', {'demandes': demandes})
