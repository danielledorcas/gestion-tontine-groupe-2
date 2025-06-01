# views.py
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.views.generic import ListView, CreateView, UpdateView, DetailView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from .models import Membre
from .forms import MembreForm
from django.db.models import Q
from django.shortcuts import render

def accueil(request):
    return render(request, 'accueil.html')

class GestionnaireRequiredMixin(UserPassesTestMixin):
    def test_func(self):
        return self.request.user.is_authenticated and self.request.user.est_gestionnaire

class MembreListView(LoginRequiredMixin, ListView):
    model = Membre
    template_name = 'membres/liste_membres.html'
    context_object_name = 'membres'
    paginate_by = None

    def get_queryset(self):
        queryset = super().get_queryset().order_by('id')
        search_query = self.request.GET.get('search', '')
        if search_query:
            queryset = queryset.filter(
                Q(nom__icontains=search_query) |
                Q(prenom__icontains=search_query) |
                Q(telephone__icontains=search_query) |
                Q(email__icontains=search_query)
            )
        return queryset
  
class MembreCreateView(LoginRequiredMixin, GestionnaireRequiredMixin, CreateView):
    model = Membre
    form_class = MembreForm
    template_name = 'membres/creer.html'
    success_url = reverse_lazy('membres:liste_membres')

    def form_valid(self, form):
        messages.success(self.request, "Le membre a été créé avec succès.")
        return super().form_valid(form)

class MembreUpdateView(LoginRequiredMixin, GestionnaireRequiredMixin, UpdateView):
    model = Membre
    form_class = MembreForm
    template_name = 'membres/modifier.html'
    success_url = reverse_lazy('membres:liste_membres')

    def form_valid(self, form):
        messages.success(self.request, "Le membre a été mis à jour avec succès.")
        return super().form_valid(form)

class MembreDetailView(LoginRequiredMixin, DetailView):
    model = Membre
    template_name = 'membres/detail.html'
    context_object_name = 'membre'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        membre = self.object
        context['tontines'] = membre.get_tontines()
        context['prets'] = membre.get_prets()
        return context



class MembreDeleteView(LoginRequiredMixin, GestionnaireRequiredMixin, DeleteView):
    model = Membre
    template_name = 'membres/supprimer.html'
    success_url = reverse_lazy('membres:liste_membres')

    def delete(self, request, *args, **kwargs):
        messages.success(self.request, "Le membre a été supprimé avec succès.")
        return super().delete(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        membre = self.get_object()
        tontines_actives = membre.get_tontines().filter(statut='actif').exists()
        prets_actifs = membre.get_prets().filter(statut__in=['demande', 'approuve', 'en_cours']).exists()

        if tontines_actives or prets_actifs:
            messages.error(request, "Impossible de supprimer ce membre car il a des tontines ou des prêts actifs.")
            return redirect('membres:detail_membre', pk=membre.pk)

        return super().post(request, *args, **kwargs)