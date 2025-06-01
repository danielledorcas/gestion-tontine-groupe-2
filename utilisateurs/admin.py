from django.contrib.auth.admin import UserAdmin
from django.utils.translation import gettext_lazy as _
from .models import CustomUser
from .forms import CustomUserCreationForm, CustomUserChangeForm
from django.contrib import admin

@admin.register(CustomUser)
class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = CustomUser

    list_display = ('username', 'email', 'telephone', 'role', 'is_staff', 'is_active')
    list_filter = ('is_staff', 'is_active', 'est_admin', 'est_tresorier', 'role')

    fieldsets = (
        (None, {'fields': ('username', 'email', 'password')}),
        (_('Informations personnelles'), {'fields': ('telephone', 'adresse')}),
        (_('Permissions'), {
            'fields': ('is_active', 'is_staff', 'is_superuser', 'est_admin', 'est_tresorier', 'groups', 'user_permissions'),
        }),
        (_('Dates importantes'), {'fields': ('last_login', 'date_joined')}),
        (_('Rôle dans la plateforme'), {'fields': ('role',)}),
    )

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'email', 'telephone', 'adresse', 'role', 'password1', 'password2', 'is_active', 'is_staff')}
        ),
    )

    search_fields = ('email', 'username')
    ordering = ('email',)

    def save_model(self, request, obj, form, change):
        if form.cleaned_data.get('password1') and not change:
            obj.set_password(form.cleaned_data['password1'])
        obj.save()
