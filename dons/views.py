from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .models import Don

class DonListView(ListView):
    model = Don
    template_name = 'don/don_list.html'
    context_object_name = 'dons'

class DonDetailView(DetailView):
    model = Don
    template_name = 'don/don_detail.html'
    context_object_name = 'don'

class DonCreateView(CreateView):
    model = Don
    template_name = 'don/don_form.html'
    fields = ['montant', 'date', 'donateur']  # adapte aux champs de ton modèle
    success_url = reverse_lazy('don:liste')

class DonUpdateView(UpdateView):
    model = Don
    template_name = 'don/don_form.html'
    fields = ['montant', 'date', 'donateur']
    success_url = reverse_lazy('don:liste')

class DonDeleteView(DeleteView):
    model = Don
    template_name = 'don/don_confirm_delete.html'
    success_url = reverse_lazy('don:liste')
# dons/views.py
from django.shortcuts import render
from .models import Don

def liste_dons(request):
    dons = Don.objects.all()
    return render(request, 'dons/liste_dons.html', {'dons': dons})
