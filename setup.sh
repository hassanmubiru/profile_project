#!/bin/bash

echo "==================================="
echo "Django Profile Project Setup"
echo "==================================="
echo ""

# Step 1: Check Python
echo "✓ Checking Python..."
python3 --version

# Step 2: Create virtual environment
echo ""
echo "✓ Creating virtual environment..."
python3 -m venv venv

# Step 3: Activate virtual environment
echo "✓ Activating virtual environment..."
source venv/bin/activate

# Step 4: Install dependencies
echo ""
echo "✓ Installing Django..."
pip install -q -r requirements.txt

# Step 5: Run migrations
echo ""
echo "✓ Running database migrations..."
python manage.py migrate

# Step 6: Create superuser
echo ""
echo "✓ Creating superuser..."
echo "Follow the prompts to create an admin account"
python manage.py createsuperuser

# Step 7: Ready to run
echo ""
echo "==================================="
echo "✓ Setup Complete!"
echo "==================================="
echo ""
echo "To start the server, run:"
echo "  source venv/bin/activate"
echo "  python manage.py runserver"
echo ""
echo "Then visit:"
echo "  Admin: http://localhost:8000/admin/"
echo "  Profile: http://localhost:8000/profile/"
echo ""
