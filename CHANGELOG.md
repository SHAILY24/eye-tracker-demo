# Changelog

All notable changes to the Eye Tracker Demo project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-09-15

### Added
- Initial release of Eye Tracker Demo
- Real-time eye tracking using WebGazer.js
- 9-point calibration system for improved accuracy
- Interactive target detection using gaze focus
- Responsive web interface with modern design
- Client-side processing for privacy protection
- Comprehensive documentation (README, SECURITY, CONTRIBUTING)
- Security scanning with Gitleaks and Bandit
- Pre-commit hooks for code quality
- Flask backend with Python 3.10 support
- Nginx reverse proxy configuration
- SSL/TLS encryption via Cloudflare
- Mathematical regression models for gaze prediction
- Visual feedback with real-time gaze pointer
- Browser compatibility with Chrome and Firefox
- Accessibility-focused design principles

### Technical Stack
- Backend: Flask 3.1.0
- Frontend: HTML5, CSS3, JavaScript ES6
- Eye Tracking: WebGazer.js v2.2.1
- Mathematics: Math.js 9.5.2
- Deployment: Ubuntu 22.04 LTS with Nginx

### Security
- Implemented comprehensive .gitignore
- Added Gitleaks configuration for secret scanning
- Configured Bandit for Python security analysis
- Set up pre-commit hooks for automated checks
- Created security policy and reporting guidelines

### Documentation
- Detailed README with setup instructions
- Security policy with vulnerability reporting
- Contributing guidelines for developers
- MIT License for open source distribution
- Code of Conduct for community standards

### Infrastructure
- Deployed to https://eyetracker.shaily.dev
- GitHub repository at https://github.com/SHAILY24/eye-tracker-demo
- Automated CI/CD pipeline ready
- Docker support planned for future releases

## [Unreleased]

### Planned Features
- Mobile device support with front-facing cameras
- Multi-user calibration profiles
- Advanced gesture recognition (blinks, winks)
- Integration with accessibility tools
- Machine learning model improvements
- Heatmap visualization of gaze patterns
- Export tracking data for analysis
- Voice command integration
- Customizable interaction zones

---

For more information, visit the [project repository](https://github.com/SHAILY24/eye-tracker-demo).