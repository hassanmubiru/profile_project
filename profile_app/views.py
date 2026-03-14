"""
Views for the profile application
Demonstrates Python variables, loops, and Django views
"""
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from .models import Profile


def home_view(request):
    """
    Public home page showing all profiles
    No login required - accessible to everyone
    """
    # Get all profiles from database
    all_profiles = Profile.objects.all()
    
    # Count total profiles
    total_profiles = all_profiles.count()
    
    context = {
        "profiles": all_profiles,
        "total_profiles": total_profiles,
    }
    
    return render(request, 'home.html', context)


@login_required(login_url='admin:login')
def profile_view(request):
    """
    Display user profile with today's learning topics
    
    Demonstrates:
    - VARIABLES: user data storage, topics list, loop variables
    - LOOPS: Python for-loop to process topics with enumerate()
    - Django: login_required decorator, queryset filtering
    
    Args:
        request: HTTP request object containing user information
    
    Returns:
        Rendered HTML template with user profile data
    """
    
    # VARIABLE EXAMPLE 1: Get current logged-in user
    current_user = request.user
    
    # VARIABLE EXAMPLE 2: Try to get or create profile
    try:
        user_profile = Profile.objects.get(user=current_user)
    except Profile.DoesNotExist:
        # Create a new profile if it doesn't exist
        user_profile = Profile.objects.create(user=current_user)
    
    # VARIABLE EXAMPLE 3: List of today's learning topics (Python list data structure)
    today_topics = ["variables", "loops", "functions"]
    
    # VARIABLE EXAMPLE 4: Dictionary storing user information
    user_data = {
        "username": current_user.username,
        "email": current_user.email,
        "first_name": current_user.first_name or "Not set",
        "last_name": current_user.last_name or "Not set",
    }
    
    # LOOP EXAMPLE 1: Process topics with enumerate() to get index
    # This is a Python for-loop that iterates through the list
    processed_topics = []
    for index, topic in enumerate(today_topics, start=1):
        """
        enumerate() provides:
        - index: position in list (1, 2, 3...)
        - topic: current item ("variables", "loops", "functions")
        
        This loop demonstrates:
        - Loop iteration with enumerate()
        - String formatting
        - Appending to a list
        """
        formatted_topic = f"Lesson {index}: {topic.upper()}"
        processed_topics.append(formatted_topic)
    
    # VARIABLE EXAMPLE 5: Processed data ready for template
    context = {
        "profile": user_profile,
        "user_data": user_data,
        "today_topics": today_topics,  # Raw list for template loop
        "processed_topics": processed_topics,  # Processed by Python loop
        "total_topics": len(today_topics),  # VARIABLE: length of list
    }
    
    # Return the rendered template with context variables
    return render(request, 'profile.html', context)


def profile_list_view(request):
    """
    Display all user profiles (admin view)
    Demonstrates queryset filtering and looping over database results
    """
    # LOOP EXAMPLE 2: Retrieve all profiles from database
    all_profiles = Profile.objects.all()  # QuerySet of all Profile objects
    
    # VARIABLE: Count total profiles
    total_users = all_profiles.count()
    
    context = {
        "profiles": all_profiles,  # Will be looped in template
        "total_users": total_users,
    }
    
    return render(request, 'profile_list.html', context)
