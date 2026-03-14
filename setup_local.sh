#!/bin/bash

# Django Profile Project - Local Setup Script
# Run this script to set up the project on your machine

echo "🚀 Django Profile Project - Local Setup"
echo "========================================"
echo ""

# Step 1: Create virtual environment
echo "📦 Creating virtual environment..."
python3 -m venv venv

# Step 2: Activate virtual environment
echo "✅ Activating virtual environment..."
source venv/bin/activate

# Step 3: Install dependencies
echo "📥 Installing dependencies..."
pip install -r requirements.txt

# Step 4: Run migrations
echo "🗄️  Running database migrations..."
python manage.py migrate

# Step 5: Create superuser
echo ""
echo "🔐 Creating admin superuser..."
echo "   Username: admin"
echo "   Email: admin@example.com"
echo "   Password: admin123456"
echo ""

python manage.py shell << END
from django.contrib.auth.models import User
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'admin123456')
    print("✅ Admin superuser created!")
else:
    print("ℹ️  Admin user already exists")
END

echo ""
echo "✨ Setup complete!"
echo ""
echo "📋 Next steps:"
echo "   1. Activate virtual environment:"
echo "      source venv/bin/activate"
echo ""
echo "   2. Start the Django server:"
echo "      python manage.py runserver"
echo ""
echo "   3. Visit in your browser:"
echo "      http://localhost:8000/"
echo ""
echo "   4. Admin dashboard:"
echo "      http://localhost:8000/admin/"
echo "      (Username: admin, Password: admin123456)"
echo ""
