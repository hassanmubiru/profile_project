"""
URL configuration for profile_app
Maps URLs to view functions
"""
from django.urls import path
from . import views

# URL patterns for the app
urlpatterns = [
    # Profile view - requires login
    # Access at: http://localhost:8000/profile/
    path('profile/', views.profile_view, name='profile'),
    
    # All profiles list view (optional)
    # Access at: http://localhost:8000/profiles/
    path('profiles/', views.profile_list_view, name='profiles'),
]
