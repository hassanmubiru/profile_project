"""
URL configuration for profile_project.
Maps URLs to views and includes app URLs.
"""
from django.contrib import admin
from django.urls import path, include
from django.views.generic import RedirectView

urlpatterns = [
    # Homepage redirect to admin dashboard
    path('', RedirectView.as_view(url='/admin/', permanent=False)),
    
    # Admin interface
    # Access at: http://localhost:8000/admin/
    path('admin/', admin.site.urls),
    
    # Include app URLs
    # This includes all URLs from profile_app/urls.py
    path('', include('profile_app.urls')),
]
