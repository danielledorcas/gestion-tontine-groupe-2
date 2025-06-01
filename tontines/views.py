from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.urls import reverse_lazy
from django.views.generic import ListView, CreateView
from .models import Tontine, MembreTontine, Cycle, Attribution
from .forms import TontineForm, MembreTontineForm, CycleForm, AttributionForm
from operations.models import Cotisation
from datetime import datetime


# Vue pour créer une tontine
class TontineCreateView(CreateView):
    model = Tontine
    fields = ['nom', 'description']
    template_name = 'tontines/creer_tontine.html'
    success_url = reverse_lazy('tontines:liste')


# Vue pour afficher la liste des tontines avec diagramme circulaire
class TontineListView(LoginRequiredMixin, ListView):
    model = Tontine
    template_name = 'tontines/liste.html'
    context_object_name = 'tontines'

    def get_queryset(self):
        queryset = super().get_queryset()
        search = self.request.GET.get('search')
        statut = self.request.GET.get('statut')

        if search:
            queryset = queryset.filter(nom__icontains=search)
        if statut == 'actif':
            queryset = queryset.filter(est_active=True)
        elif statut == 'inactif':
            queryset = queryset.filter(est_active=False)
        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        tontines = self.get_queryset()

        context['labels'] = [t.nom for t in tontines]
        context['data'] = [float(t.montant_cotisation) for t in tontines]
        return context


# Vue pour créer une tontine via formulaire manuel
@login_required
def creer_tontine(request):
    if request.method == 'POST':
        form = TontineForm(request.POST)
        if form.is_valid():
            tontine = form.save()
            messages.success(request, f"La tontine {tontine.nom} a été créée avec succès.")
            return redirect('tontines:liste')
    else:
        form = TontineForm()

    return render(request, 'tontines/creer_tontine.html', {'form': form, 'title': 'Créer une tontine'})


# Vue pour modifier une tontine
@login_required
def modifier_tontine(request, tontine_id):
    tontine = get_object_or_404(Tontine, pk=tontine_id)

    if request.method == 'POST':
        form = TontineForm(request.POST, instance=tontine)
        if form.is_valid():
            tontine = form.save()
            messages.success(request, f"La tontine {tontine.nom} a été modifiée avec succès.")
            return redirect('tontines:liste')
    else:
        form = TontineForm(instance=tontine)

    return render(request, 'tontines/formulaire_tontine.html', {'form': form, 'title': 'Modifier la tontine'})


# Vue pour afficher les détails d'une tontine
@login_required
def detail_tontine(request, tontine_id):
    tontine = get_object_or_404(Tontine, pk=tontine_id)
    membres = MembreTontine.objects.filter(tontine=tontine)
    cycles = Cycle.objects.filter(tontine=tontine).order_by('-date_debut')

    return render(request, 'tontines/detail_tontine.html', {
        'tontine': tontine,
        'membres': membres,
        'cycles': cycles
    })
@login_required
def ajouter_membre_tontine(request, tontine_id):
    tontine = get_object_or_404(Tontine, pk=tontine_id)

    if request.method == 'POST':
        form = MembreTontineForm(request.POST)
        if form.is_valid():
            membre_tontine = form.save(commit=False)
            membre_tontine.tontine = tontine
            membre_tontine.save()
            messages.success(request, "Le membre a été ajouté avec succès.")
            return redirect('tontines:detail_tontine', tontine_id=tontine.id)
    else:
        form = MembreTontineForm()

    return render(request, 'tontines/formulaire_membre_tontine.html', {
        'form': form,
        'tontine': tontine,
        'title': 'Ajouter un membre à la tontine'
    })

# Vue pour supprimer une tontine
@login_required
def supprimer_tontine(request, tontine_id):
    tontine = get_object_or_404(Tontine, pk=tontine_id)
    tontine.delete()
    messages.success(request, "La tontine a été supprimée avec succès.")
    return redirect('tontines:liste')
@login_required
def creer_cycle(request, tontine_id):
    tontine = get_object_or_404(Tontine, pk=tontine_id)

    if request.method == 'POST':
        form = CycleForm(request.POST)
        if form.is_valid():
            cycle = form.save(commit=False)
            cycle.tontine = tontine
            cycle.save()
            messages.success(request, "Le cycle a été créé avec succès.")
            return redirect('tontines:detail_tontine', tontine_id=tontine.id)
    else:
        form = CycleForm(initial={'tontine': tontine})

    return render(request, 'tontines/formulaire_cycle.html', {
        'form': form,
        'tontine': tontine,
        'title': 'Créer un cycle'
    })
@login_required
def detail_cycle(request, cycle_id):
    cycle = get_object_or_404(Cycle, pk=cycle_id)
    tontine = cycle.tontine
    attributions = Attribution.objects.filter(cycle=cycle).order_by('ordre')
    cotisations = Cotisation.objects.filter(cycle=cycle)

    return render(request, 'tontines/detail_cycle.html', {
        'cycle': cycle,
        'tontine': tontine,
        'attributions': attributions,
        'cotisations': cotisations
    })
@login_required
def creer_attribution(request, cycle_id):
    cycle = get_object_or_404(Cycle, pk=cycle_id)

    if request.method == 'POST':
        form = AttributionForm(request.POST)
        if form.is_valid():
            attribution = form.save(commit=False)
            attribution.cycle = cycle
            attribution.save()
            messages.success(request, "Attribution créée avec succès.")
            return redirect('tontines:detail_cycle', cycle_id=cycle.id)
    else:
        form = AttributionForm()

    return render(request, 'tontines/creer_attribution.html', {
        'form': form,
        'cycle': cycle,
        'title': 'Créer une attribution'
    })
