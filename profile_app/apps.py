"""
Configuration for the profile_app application
"""
from django.apps import AppConfig


class ProfileAppConfig(AppConfig):
    """Profile app configuration"""
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'profile_app'
