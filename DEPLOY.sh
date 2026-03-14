#!/bin/bash

# ============================================================================
# DJANGO PROFILE PROJECT - DEPLOYMENT GUIDE
# ============================================================================
# This script guides you through deploying the project step by step
# ============================================================================

echo ""
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║     DJANGO PROFILE PROJECT - DEPLOYMENT INSTRUCTIONS            ║"
echo "║         Complete Setup & Launch on Your Machine               ║"
echo "╚═════════════════════════════════════════════════════════════════╝"
echo ""

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "📍 Project Location: $PROJECT_DIR"
echo ""

# ============================================================================
# STEP 1: Prerequisites
# ============================================================================
echo "STEP 1: Checking Prerequisites"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed"
    echo "   Install from: https://www.python.org/"
    exit 1
fi

PYTHON_VERSION=$(python3 --version)
echo "✓ $PYTHON_VERSION found"
echo ""

# ============================================================================
# STEP 2: Create Virtual Environment
# ============================================================================
echo "STEP 2: Setting Up Virtual Environment"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
    if [ $? -eq 0 ]; then
        echo "✓ Virtual environment created"
    else
        echo "❌ Failed to create virtual environment"
        echo "   Try installing python3-venv:"
        echo "   Ubuntu/Debian: sudo apt install python3-venv"
        echo "   macOS: brew install python3"
        exit 1
    fi
else
    echo "✓ Virtual environment already exists"
fi

echo ""

# ============================================================================
# STEP 3: Activate & Install Django
# ============================================================================
echo "STEP 3: Installing Django"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

source venv/bin/activate
echo "✓ Virtual environment activated"

echo "Installing Django..."
pip install --quiet -r requirements.txt

if python3 -c "import django" 2>/dev/null; then
    DJANGO_VERSION=$(python3 -c "import django; print(django.get_version())")
    echo "✓ Django $DJANGO_VERSION installed"
else
    echo "❌ Django installation failed"
    exit 1
fi

echo ""

# ============================================================================
# STEP 4: Database Setup
# ============================================================================
echo "STEP 4: Setting Up Database"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "Running database migrations..."
python manage.py migrate --quiet

if [ $? -eq 0 ]; then
    echo "✓ Database migrations completed"
else
    echo "❌ Database migrations failed"
    exit 1
fi

echo ""

# ============================================================================
# STEP 5: Create Superuser
# ============================================================================
echo "STEP 5: Admin Account Setup"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

ADMIN_EXISTS=$(python manage.py shell -c "from django.contrib.auth.models import User; print('yes' if User.objects.filter(username='admin').exists() else 'no')" 2>/dev/null)

if [ "$ADMIN_EXISTS" = "yes" ]; then
    echo "✓ Admin account 'admin' already exists"
else
    echo "Creating superuser account..."
    echo ""
    echo "Follow the prompts to create an admin account:"
    echo "(Example: username=admin, email=admin@example.com, password=demo123)"
    echo ""
    python manage.py createsuperuser
fi

echo ""

# ============================================================================
# STEP 6: Start Development Server
# ============================================================================
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║              ✓ DEPLOYMENT COMPLETE - STARTING SERVER            ║"
echo "╚═════════════════════════════════════════════════════════════════╝"
echo ""

echo "Development server starting on http://127.0.0.1:8000/"
echo ""
echo "Access URLs:"
echo "  Admin Panel:  http://localhost:8000/admin/"
echo "  Profile Page: http://localhost:8000/profile/"
echo ""
echo "Login with the admin account you just created"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

python manage.py runserver

