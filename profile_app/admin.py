"""
Django admin configuration for profile management
Registers the Profile model so it can be edited in Django admin panel
"""
from django.contrib import admin
from .models import Profile


@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    """
    Admin interface for editing user profiles
    Demonstrates how to customize Django admin
    """
    list_display = ['user', 'age', 'bio', 'created_at']
    list_filter = ['created_at', 'age']
    search_fields = ['user__username', 'bio']
    readonly_fields = ['created_at', 'updated_at']
    
    fieldsets = (
        ('User', {
            'fields': ('user',)
        }),
        ('Profile Information', {
            'fields': ('age', 'bio', 'topics')
        }),
        ('Timestamps', {
            'fields': ('created_at', 'updated_at'),
            'classes': ('collapse',)
        }),
    )
