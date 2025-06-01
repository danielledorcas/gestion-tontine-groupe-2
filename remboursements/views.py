from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .models import Remboursement

class RemboursementListView(ListView):
    model = Remboursement
    template_name = 'remboursements/remboursement_list.html'
    context_object_name = 'remboursements'

class RemboursementDetailView(DetailView):
    model = Remboursement
    template_name = 'remboursements/remboursement_detail.html'
    context_object_name = 'remboursement'

class RemboursementCreateView(CreateView):
    model = Remboursement
    template_name = 'remboursements/remboursement_form.html'
    fields = ['montant', 'date', 'description']  # À adapter selon ton modèle
    success_url = reverse_lazy('remboursements:liste')

class RemboursementUpdateView(UpdateView):
    model = Remboursement
    template_name = 'remboursements/remboursement_form.html'
    fields = ['montant', 'date', 'description']
    success_url = reverse_lazy('remboursements:liste')

class RemboursementDeleteView(DeleteView):
    model = Remboursement
    template_name = 'remboursements/remboursement_confirm_delete.html'
    success_url = reverse_lazy('remboursements:liste')
from django.http import HttpResponse

def index(request):
    return HttpResponse("Bienvenue dans l'app tontines !")
