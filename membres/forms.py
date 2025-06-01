from django import forms
from .models import Membre

class MembreForm(forms.ModelForm):
    class Meta:
        model = Membre
        fields = '__all__'  # Ou spécifiez les champs que vous voulez *inclure*
        exclude = ('tontines',)  # Exclut le champ 'tontines'

        


