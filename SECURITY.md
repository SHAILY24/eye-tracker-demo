# Security Policy

## Supported Versions

We release patches for security vulnerabilities in the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Security Tools in Use

This project employs multiple security tools to ensure code safety:

1. **Gitleaks**: Scans for secrets and sensitive information
2. **Bandit**: Python security linter for common vulnerabilities
3. **Pre-commit hooks**: Automated security checks before commits
4. **Dependency scanning**: Regular updates and vulnerability checks

## Running Security Checks

### Quick Security Scan
```bash
# Install security tools
pip install bandit safety pip-audit

# Run Bandit for Python security issues
bandit -r . -ll

# Check for known vulnerabilities in dependencies
safety check
pip-audit

# Scan for secrets with Gitleaks
gitleaks detect --source . --verbose
```

### Pre-commit Setup
```bash
# Install pre-commit
pip install pre-commit

# Install git hook scripts
pre-commit install

# Run against all files
pre-commit run --all-files
```

## Reporting a Vulnerability

We take security vulnerabilities seriously. If you discover a security issue, please report it responsibly.

### How to Report

1. **Email**: Send details to [shailysharmawork@gmail.com](mailto:shailysharmawork@gmail.com)
2. **Subject Line**: "Security Vulnerability - Eye Tracker Demo"
3. **Include**:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### What to Expect

- **Initial Response**: Within 48 hours
- **Status Update**: Within 5 business days
- **Resolution Timeline**: Typically within 30 days for confirmed issues

### Responsible Disclosure

- Please allow us reasonable time to address the issue before public disclosure
- We'll credit you in the security advisory (unless you prefer to remain anonymous)
- We don't offer monetary rewards but deeply appreciate your contribution to security

## Security Best Practices

### For Contributors

1. **Never commit secrets**: Use environment variables for sensitive data
2. **Validate input**: Always sanitize user input
3. **Keep dependencies updated**: Regularly update all packages
4. **Use HTTPS**: Never transmit sensitive data over HTTP
5. **Follow OWASP guidelines**: Implement security best practices

### For Users

1. **Use HTTPS**: Always access the application via HTTPS
2. **Camera permissions**: Only grant camera access to trusted sites
3. **Browser security**: Keep your browser updated
4. **Network security**: Use the application on secure networks

## Security Features

### Current Implementation

- **Client-side processing**: No data leaves your browser
- **No data storage**: No personal information is collected or stored
- **HTTPS enforced**: SSL/TLS encryption in production
- **Content Security Policy**: Prevents XSS attacks
- **Input validation**: All user inputs are validated
- **No authentication required**: Reduces attack surface

### Privacy Considerations

- **Camera access**: Used only for eye tracking, no recording
- **Local processing**: All computations happen in your browser
- **No analytics**: No tracking cookies or analytics scripts
- **No external requests**: Except for loading WebGazer.js from CDN

## Emergency Response

In case of an active security incident:

1. **Immediate**: Disable affected features
2. **Within 1 hour**: Assess scope and impact
3. **Within 4 hours**: Deploy temporary fix if possible
4. **Within 24 hours**: Communicate with affected users
5. **Follow-up**: Full post-mortem and permanent fix

## Security Audit History

| Date | Type | Result | Action |
|------|------|--------|--------|
| 2025-01 | Initial audit | No critical issues | Baseline established |

## Contact

**Security Team**: Shaily Sharma  
**Email**: [shailysharmawork@gmail.com](mailto:shailysharmawork@gmail.com)  
**Response Time**: 24-48 hours

## Attribution

This security policy is adapted from best practices recommended by:
- [GitHub Security Advisories](https://github.com/security/advisories)
- [OWASP Security Guidelines](https://owasp.org)
- Industry standard responsible disclosure practices