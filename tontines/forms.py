from django import forms
from .models import Tontine, MembreTontine, Cycle, Attribution

class TontineForm(forms.ModelForm):
    class Meta:
        model = Tontine
        fields = ('nom', 'description', 'montant_cotisation', 
                  'frequence_cotisation', 'jour_cotisation', 'tresorier')

class MembreTontineForm(forms.ModelForm):
    class Meta:
        model = MembreTontine
        fields = ('membre', 'tontine', 'date_adhesion', 'est_actif')
        widgets = {
            'date_adhesion': forms.DateInput(attrs={'type': 'date'}),
            'tontine': forms.CheckboxSelectMultiple(),  # Utiliser des cases à cocher au lieu d'une liste déroulante
            # ou
            # 'tontine': forms.SelectMultiple(attrs={'size': '10', 'class': 'selectmultiple'}),  # Améliorer l'apparence de la liste déroulante
        }

class CycleForm(forms.ModelForm):
    class Meta:
        model = Cycle
        fields = ('tontine', 'nom', 'date_debut', 'date_fin', 'est_actif')
        widgets = {
            'date_debut': forms.DateInput(attrs={'type': 'date'}),
            'date_fin': forms.DateInput(attrs={'type': 'date'}),
        }

class AttributionForm(forms.ModelForm):
    class Meta:
        model = Attribution
        fields = ('cycle', 'membre', 'ordre', 'date_prevue', 'montant')
        widgets = {
            'date_prevue': forms.DateInput(attrs={'type': 'date'}),
        }