from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .models import Cotisation

class CotisationListView(ListView):
    model = Cotisation
    template_name = 'cotisation/cotisation_list.html'
    context_object_name = 'cotisations'

class CotisationDetailView(DetailView):
    model = Cotisation
    template_name = 'cotisation/cotisation_detail.html'
    context_object_name = 'cotisation'

class CotisationCreateView(CreateView):
    model = Cotisation
    template_name = 'cotisation/cotisation_form.html'
    fields = ['montant', 'date', 'membre']  # adapte selon ton modèle
    success_url = reverse_lazy('cotisation:liste')

class CotisationUpdateView(UpdateView):
    model = Cotisation
    template_name = 'cotisation/cotisation_form.html'
    fields = ['montant', 'date', 'membre']
    success_url = reverse_lazy('cotisation:liste')

class CotisationDeleteView(DeleteView):
    model = Cotisation
    template_name = 'cotisation/cotisation_confirm_delete.html'
    success_url = reverse_lazy('cotisation:liste')
    
