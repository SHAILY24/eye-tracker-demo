#!/bin/bash

# Eye Tracker Demo - Deployment Script
# Author: Shaily Sharma
# Description: Deploy or update the Eye Tracker Demo application

set -e

echo "================================================"
echo "Eye Tracker Demo - Deployment"
echo "================================================"

# Check if running as root for systemd operations
if [ "$EUID" -ne 0 ]; then 
    echo "Please run with sudo for systemd operations"
    exit 1
fi

# Variables
APP_DIR="/home/shaily/code/personal/company_portfolio/fairway_vision/eye_tracking_demo"
SERVICE_FILE="eyetracker.service"
NGINX_CONFIG="/home/shaily/nginx/sites-enabled/eyetracker.shaily.dev"

# Navigate to app directory
cd "$APP_DIR"

# Pull latest changes from git
echo "Pulling latest changes from GitHub..."
git pull origin main

# Activate virtual environment and update dependencies
echo "Updating dependencies..."
source .venv/bin/activate
pip install -r requirements.txt

# Copy systemd service file
echo "Installing systemd service..."
cp "$SERVICE_FILE" /etc/systemd/system/

# Reload systemd and restart service
echo "Restarting application service..."
systemctl daemon-reload
systemctl restart eyetracker.service
systemctl enable eyetracker.service

# Check service status
echo "Checking service status..."
systemctl status eyetracker.service --no-pager

# Test nginx configuration
echo "Testing nginx configuration..."
nginx -t

# Reload nginx
echo "Reloading nginx..."
nginx -s reload

echo ""
echo "================================================"
echo "Deployment Complete!"
echo "================================================"
echo ""
echo "Application URL: https://eyetracker.shaily.dev"
echo "Service Status: systemctl status eyetracker.service"
echo "Application Logs: journalctl -u eyetracker.service -f"
echo ""