from django.views.generic import ListView
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import Pret

class PretListView(LoginRequiredMixin, ListView):
    model = Pret
    template_name = 'prets/liste.html'
    context_object_name = 'prets'
    paginate_by = 10
    
    def get_queryset(self):
        queryset = super().get_queryset()
        search_query = self.request.GET.get('search', '')
        if search_query:
            queryset = queryset.filter(membre__nom__icontains=search_query) | \
                      queryset.filter(membre__prenom__icontains=search_query) | \
                      queryset.filter(montant__icontains=search_query)
        return queryset