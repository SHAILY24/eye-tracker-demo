#!/bin/bash

# Eye Tracker Demo - Security Setup Script
# Author: Shaily Sharma
# Description: One-command security setup for the project

set -e

echo "================================================"
echo "Eye Tracker Demo - Security Setup"
echo "================================================"

# Check Python version
echo "Checking Python version..."
python_version=$(python3 --version 2>&1 | grep -Po '(?<=Python )\d+\.\d+')
required_version="3.10"

if [ "$(printf '%s\n' "$required_version" "$python_version" | sort -V | head -n1)" != "$required_version" ]; then
    echo "Error: Python $required_version or higher is required. Found: $python_version"
    exit 1
fi

echo "✓ Python version: $python_version"

# Create virtual environment if it doesn't exist
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv .venv
    echo "✓ Virtual environment created"
fi

# Activate virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip > /dev/null 2>&1

# Install application dependencies
echo "Installing application dependencies..."
pip install -r requirements.txt

# Install security tools
echo "Installing security tools..."
pip install bandit safety pip-audit pre-commit

# Install Gitleaks
echo "Installing Gitleaks..."
GITLEAKS_VERSION="8.18.1"
SYSTEM=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
    ARCH="x64"
elif [ "$ARCH" = "aarch64" ]; then
    ARCH="arm64"
fi

GITLEAKS_URL="https://github.com/gitleaks/gitleaks/releases/download/v${GITLEAKS_VERSION}/gitleaks_${GITLEAKS_VERSION}_${SYSTEM}_${ARCH}.tar.gz"

if ! command -v gitleaks &> /dev/null; then
    wget -q "$GITLEAKS_URL" -O /tmp/gitleaks.tar.gz
    tar -xzf /tmp/gitleaks.tar.gz -C /tmp/
    sudo mv /tmp/gitleaks /usr/local/bin/
    rm /tmp/gitleaks.tar.gz
    echo "✓ Gitleaks installed"
else
    echo "✓ Gitleaks already installed"
fi

# Set up pre-commit hooks
echo "Setting up pre-commit hooks..."
pre-commit install
echo "✓ Pre-commit hooks installed"

# Run initial security scan
echo ""
echo "================================================"
echo "Running Security Scans"
echo "================================================"

# Check for secrets
echo "Scanning for secrets with Gitleaks..."
gitleaks detect --source . --verbose --no-git || true

# Run Bandit
echo ""
echo "Running Bandit security scan..."
bandit -r . -ll -f json -o bandit-report.json 2>/dev/null || true
bandit -r . -ll

# Check dependencies
echo ""
echo "Checking for vulnerable dependencies..."
safety check || true
pip-audit || true

# Summary
echo ""
echo "================================================"
echo "Security Setup Complete!"
echo "================================================"
echo ""
echo "Next steps:"
echo "1. Review any security findings above"
echo "2. Create .env file from .env.example"
echo "3. Run 'pre-commit run --all-files' to test hooks"
echo "4. Commit your changes"
echo ""
echo "To run security scans manually:"
echo "  ./run-security-scan.sh"
echo ""