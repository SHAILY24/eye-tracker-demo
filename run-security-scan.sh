#!/bin/bash

# Eye Tracker Demo - Security Scan Script
# Author: Shaily Sharma
# Description: Manual security scanning script

set -e

echo "================================================"
echo "Eye Tracker Demo - Security Scan"
echo "================================================"
echo ""

# Activate virtual environment if it exists
if [ -d ".venv" ]; then
    source .venv/bin/activate
fi

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Scan for secrets
if command_exists gitleaks; then
    echo "1. Scanning for secrets with Gitleaks..."
    echo "----------------------------------------"
    gitleaks detect --source . --verbose --no-git || echo "⚠ Gitleaks found potential issues"
    echo ""
else
    echo "⚠ Gitleaks not installed. Run ./setup-security.sh first"
fi

# Run Bandit for Python security issues
if command_exists bandit; then
    echo "2. Running Bandit security scan..."
    echo "----------------------------------------"
    bandit -r . -ll || echo "⚠ Bandit found potential issues"
    echo ""
else
    echo "⚠ Bandit not installed. Run: pip install bandit"
fi

# Check for vulnerable dependencies
if command_exists safety; then
    echo "3. Checking dependencies with Safety..."
    echo "----------------------------------------"
    safety check || echo "⚠ Safety found vulnerable dependencies"
    echo ""
else
    echo "⚠ Safety not installed. Run: pip install safety"
fi

# Run pip-audit
if command_exists pip-audit; then
    echo "4. Running pip-audit..."
    echo "----------------------------------------"
    pip-audit || echo "⚠ pip-audit found issues"
    echo ""
else
    echo "⚠ pip-audit not installed. Run: pip install pip-audit"
fi

# Check file permissions
echo "5. Checking file permissions..."
echo "----------------------------------------"
find . -type f -name "*.sh" -exec ls -la {} \; | grep -E "^-rwxr-xr-x|^-rw-r--r--" > /dev/null || echo "⚠ Some scripts may have incorrect permissions"
echo "✓ File permissions check complete"
echo ""

# Check for hardcoded IPs or URLs
echo "6. Checking for hardcoded IPs/URLs..."
echo "----------------------------------------"
grep -r -E "([0-9]{1,3}\.){3}[0-9]{1,3}" --include="*.py" --include="*.js" --include="*.html" . 2>/dev/null | grep -v ".venv" | grep -v "127.0.0.1" | grep -v "0.0.0.0" || echo "✓ No suspicious IPs found"
echo ""

# Pre-commit check
if [ -f ".pre-commit-config.yaml" ]; then
    echo "7. Running pre-commit checks..."
    echo "----------------------------------------"
    pre-commit run --all-files || echo "⚠ Pre-commit checks found issues"
    echo ""
fi

# Summary
echo "================================================"
echo "Security Scan Complete!"
echo "================================================"
echo ""
echo "Review any warnings above and fix as needed."
echo "For automated scanning on every commit, ensure"
echo "pre-commit hooks are installed:"
echo "  pre-commit install"
echo ""