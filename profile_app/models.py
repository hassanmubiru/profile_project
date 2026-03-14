"""
Profile model demonstrating Django models and JSONField for storing list data
This file shows how to structure data in Django using models.
"""
from django.db import models
from django.contrib.auth.models import User
from django.db.models import JSONField


class Profile(models.Model):
    """
    User Profile model - extends Django's built-in User model
    Demonstrates:
    - Variables: user (ForeignKey), age, bio, topics (stored data)
    - Data types: CharField, IntegerField, TextField, JSONField
    """
    # Variables: Foreign key linking to Django's User model
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    
    # Variables: Basic profile information
    age = models.IntegerField(default=0, help_text="User's age (example variable)")
    bio = models.TextField(default="", blank=True, help_text="User's biography")
    
    # Variables: JSONField stores a list of topics (modern Python list data structure)
    topics = JSONField(
        default=list,
        blank=True,
        help_text="List of learning topics - demonstrates JSON storage"
    )
    
    # Variables: Timestamp for when profile was created
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        verbose_name = "User Profile"
        verbose_name_plural = "User Profiles"
    
    def __str__(self):
        """Return username as string representation"""
        return f"{self.user.username}'s Profile"
