#!/bin/bash

# Admin Account Setup Script
# Creates a superuser for Django admin panel

echo "🔐 Creating Admin Superuser..."
echo ""
echo "Admin Credentials:"
echo "  Username: admin"
echo "  Email: admin@example.com"
echo "  Password: admin123456"
echo ""

python manage.py shell << END
from django.contrib.auth.models import User

# Check if admin already exists
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'admin123456')
    print("✅ Admin superuser created successfully!")
    print("   Login URL: /admin/")
    print("   Username: admin")
    print("   Password: admin123456")
else:
    print("⚠️  Admin user already exists")
    user = User.objects.get(username='admin')
    user.set_password('admin123456')
    user.save()
    print("✅ Admin password reset to: admin123456")
END

echo ""
echo "Done!"
