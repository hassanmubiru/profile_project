#!/bin/bash

# Build script for Render deployment
# This runs automatically when deploying to Render

echo "🚀 Building Django Profile Project for Render..."

# Install dependencies
echo "📦 Installing dependencies..."
pip install -r requirements.txt

# Collect static files
echo "📂 Collecting static files..."
python manage.py collectstatic --noinput

# Run migrations
echo "🗄️ Running database migrations..."
python manage.py migrate

echo "✅ Build complete! Ready to deploy."
