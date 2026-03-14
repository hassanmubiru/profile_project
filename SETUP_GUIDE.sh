#!/bin/bash

# ====================================================================
# Django Profile Project - Quick Setup Guide
# ====================================================================
# This script provides step-by-step instructions for setting up the
# Django profile project on your local machine.
# ====================================================================

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║           Django Profile Project - Setup Guide                ║"
echo "║     Teaching Python Basics: Variables, Loops, Functions       ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# ====================================================================
# STEP 1: Prerequisites Check
# ====================================================================
echo "📋 STEP 1: Checking Prerequisites"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version)
    echo "✓ $PYTHON_VERSION found"
else
    echo "✗ Python 3 not found"
    echo "  Install Python 3.8+ from https://www.python.org/"
    exit 1
fi

echo ""

# ====================================================================
# STEP 2: Create Virtual Environment
# ====================================================================
echo "🔧 STEP 2: Creating Virtual Environment"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ -d "venv" ]; then
    echo "✓ Virtual environment already exists"
else
    echo "Creating virtual environment..."
    python3 -m venv venv
    echo "✓ Virtual environment created"
fi

echo ""

# ====================================================================
# STEP 3: Activate Virtual Environment
# ====================================================================
echo "🚀 STEP 3: Activating Virtual Environment"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

source venv/bin/activate
echo "✓ Virtual environment activated"

echo ""

# ====================================================================
# STEP 4: Upgrade pip and Install Dependencies
# ====================================================================
echo "📦 STEP 4: Installing Dependencies"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo "Upgrading pip..."
pip install --upgrade pip > /dev/null 2>&1
echo "✓ pip upgraded"

echo "Installing Django..."
pip install -r requirements.txt
echo "✓ Django installed"

echo ""

# ====================================================================
# STEP 5: Apply Database Migrations
# ====================================================================
echo "💾 STEP 5: Setting Up Database"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo "Running migrations..."
python manage.py migrate
echo "✓ Database migrations applied"

echo ""

# ====================================================================
# STEP 6: Create Superuser
# ====================================================================
echo "👤 STEP 6: Creating Admin Account"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Enter admin account details (follow the prompts):"
echo ""
python manage.py createsuperuser

echo ""

# ====================================================================
# Setup Complete
# ====================================================================
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                    ✓ Setup Complete!                          ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# ====================================================================
# Next Steps
# ====================================================================
echo "🎯 NEXT STEPS:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1️⃣  Start the development server:"
echo "    python manage.py runserver"
echo ""
echo "2️⃣  Visit the admin panel:"
echo "    http://localhost:8000/admin/"
echo "    (Login with your admin credentials)"
echo ""
echo "3️⃣  Create a user profile:"
echo "    • Click 'Profiles' → 'Add Profile'"
echo "    • Select a user, add age, bio, and topics list"
echo "    • Click 'Save'"
echo ""
echo "4️⃣  View your profile page:"
echo "    http://localhost:8000/profile/"
echo "    (You must be logged in)"
echo ""
echo "🎓 LEARNING PATHS:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📚 To understand Variables, Loops, and Functions:"
echo "   • Read: profile_app/models.py - Data structure with comments"
echo "   • Read: profile_app/views.py - Variables and loops in action"
echo "   • Read: profile_app/templates/profile.html - Django loops"
echo ""
echo "💡 Code is heavily commented - look for:"
echo "   • VARIABLE EXAMPLE: Shows how to store and use data"
echo "   • LOOP EXAMPLE: Shows iteration through lists"
echo "   • Demonstrates: Lists what concepts are shown"
echo ""
echo "🛑 TO STOP THE SERVER:"
echo "   Press Ctrl+C in the terminal"
echo ""
echo "❓ TO DEACTIVATE VIRTUAL ENVIRONMENT:"
echo "   deactivate"
echo ""
echo "═════════════════════════════════════════════════════════════════"
echo ""
echo "Happy Learning! 🚀"
echo ""
