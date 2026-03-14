"""
Configuration for the profile_app application
"""
from django.apps import AppConfig


class ProfileAppConfig(AppConfig):
    """Profile app configuration"""
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'profile_app'
    
    def ready(self):
        """
        Signal handler to create admin user on first deployment
        """
        from django.contrib.auth.models import User
        from django.db.models.signals import post_migrate
        from django.dispatch import receiver
        
        @receiver(post_migrate)
        def create_admin_user(sender, **kwargs):
            """Create admin superuser automatically after migrations"""
            if not User.objects.filter(username='admin').exists():
                User.objects.create_superuser(
                    username='admin',
                    email='admin@example.com',
                    password='admin123456'
                )
                print("✅ Admin superuser created automatically!")
                print("   Username: admin")
                print("   Password: admin123456")

