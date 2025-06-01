from django.db.models.signals import post_save
from django.dispatch import receiver
from django.core.mail import send_mail
from demandes.models import DemandePret, DemandeCotisation, DemandeDon, DemandeRemboursement, AdhesionTontineDemande

def send_validation_email(user, type_demande):
    send_mail(
        subject="Votre demande a été validée",
        message=f"Bonjour {user.first_name}, votre demande de {type_demande} a été approuvée.",
        from_email="noreply@tontine.com",
        recipient_list=[user.email],
        fail_silently=True,
    )

@receiver(post_save, sender=DemandePret)
@receiver(post_save, sender=DemandeCotisation)
@receiver(post_save, sender=DemandeRemboursement)
@receiver(post_save, sender=DemandeDon)
@receiver(post_save, sender=AdhesionTontineDemande)
def notify_user_on_validation(sender, instance, created, **kwargs):
    if not created and instance.statut == 'APPROUVEE' and not instance.notification_envoyee:
        send_validation_email(instance.membre, sender.__name__)
        instance.notification_envoyee = True
        instance.save()
