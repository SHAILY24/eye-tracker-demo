# Eye Tracker Demo

An interactive web application demonstrating real-time eye-tracking capabilities using WebGazer.js, enabling hands-free computer interaction through gaze detection.

**Built by Shaily Sharma | [GitHub](https://github.com/SHAILY24) | [Live Demo](https://eyetracker.shaily.dev)**

## Why I Built This

As a computer science enthusiast passionate about human-computer interaction, I developed this project to explore the potential of eye-tracking technology in creating more accessible and intuitive user interfaces. This demonstration showcases how gaze-based interaction can revolutionize the way we interact with digital systems, particularly benefiting users with mobility challenges or those seeking hands-free computing solutions.

## Tech Stack

- **Backend**: Python 3.10.12
- **Framework**: Flask 3.1.0
- **Frontend**: HTML5, CSS3, JavaScript (ES6)
- **Eye Tracking**: WebGazer.js v2.2.1
- **Mathematical Computations**: Math.js 9.5.2
- **Web Server**: Nginx 1.18.0
- **SSL**: Cloudflare SSL certificates
- **Deployment**: Ubuntu 22.04 LTS

## Live Demo

🌐 **Access the live demo at: [https://eyetracker.shaily.dev](https://eyetracker.shaily.dev)**

### Test Instructions
1. Allow camera permissions when prompted
2. Ensure your face is well-lit and centered
3. Follow the calibration process
4. Use your eyes to interact with on-screen targets

## Features

- **Real-time Eye Tracking**: Utilizes WebGazer.js for accurate gaze detection
- **Interactive Calibration**: 9-point calibration system for personalized accuracy
- **Visual Feedback**: Real-time gaze pointer visualization
- **Target Interaction**: Interactive targets that respond to gaze focus
- **Responsive Design**: Works on desktop browsers with webcam support
- **Privacy-First**: All processing happens client-side, no data is transmitted
- **Regression Analysis**: Advanced mathematical models for gaze prediction

## Project Structure

```
eye_tracking_demo/
├── app.py                  # Flask application server
├── requirements.txt        # Python dependencies
├── static/
│   ├── css/
│   │   └── styles.css     # Application styling
│   └── js/
│       └── script.js      # Eye tracking logic and interactions
├── templates/
│   ├── index.html         # Main application interface
│   └── documentation.html # User documentation
├── .env.example           # Environment configuration template
├── .gitignore            # Git ignore rules
├── .gitleaks.toml        # Secret scanning configuration
└── .pre-commit-config.yaml # Pre-commit hooks
```

## Setup Instructions

### Prerequisites

- Python 3.10 or higher
- pip package manager
- Modern web browser with webcam support (Chrome/Firefox recommended)
- Webcam with decent resolution

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/SHAILY24/eye-tracker-demo.git
   cd eye-tracker-demo/eye_tracking_demo
   ```

2. **Create virtual environment**
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Configure environment**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

5. **Run the application**
   ```bash
   python app.py
   ```

6. **Access the application**
   Open your browser and navigate to `http://localhost:13830`

### Production Deployment

1. **Server Requirements**
   - Ubuntu 20.04+ or similar Linux distribution
   - Nginx web server
   - SSL certificates (Let's Encrypt or Cloudflare)
   - Python 3.10+

2. **Nginx Configuration**
   ```nginx
   server {
       listen 443 ssl;
       server_name eyetracker.shaily.dev;
       
       location / {
           proxy_pass http://127.0.0.1:13830;
           proxy_set_header Host $host;
           proxy_set_header X-Real-IP $remote_addr;
       }
   }
   ```

3. **Run as Service**
   Create a systemd service file for automatic startup and management.

## Troubleshooting

### Camera Not Working
- Ensure browser has camera permissions
- Check if another application is using the camera
- Try refreshing the page

### Inaccurate Tracking
- Improve lighting conditions
- Sit at a comfortable distance from the screen
- Complete the full calibration process
- Avoid strong backlighting

### Browser Compatibility
- Use latest versions of Chrome or Firefox
- Enable JavaScript and WebRTC
- Allow third-party cookies for WebGazer

### Performance Issues
- Close unnecessary browser tabs
- Ensure adequate system resources
- Disable browser extensions that might interfere

## Security

This application implements several security measures:

- No sensitive data collection or storage
- Client-side processing only
- HTTPS-only in production
- Content Security Policy headers
- Regular dependency updates
- Automated security scanning with Gitleaks

## Performance Metrics

- **Calibration Time**: ~30 seconds
- **Tracking Accuracy**: 100-150px precision after calibration
- **Response Time**: <50ms gaze detection latency
- **Browser Support**: 95%+ modern browsers
- **Resource Usage**: Moderate CPU usage during tracking

## Future Roadmap

- [ ] Mobile device support with front-facing cameras
- [ ] Multi-user calibration profiles
- [ ] Advanced gesture recognition (blinks, winks)
- [ ] Integration with accessibility tools
- [ ] Machine learning model improvements
- [ ] Heatmap visualization of gaze patterns
- [ ] Export tracking data for analysis
- [ ] Voice command integration
- [ ] Customizable interaction zones

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## Contact

**Shaily Sharma**
- GitHub: [@SHAILY24](https://github.com/SHAILY24)
- Email: [shailysharma873@gmail.com](mailto:shailysharma873@gmail.com)
- LinkedIn: [Connect with me](https://www.linkedin.com/in/shailysharma873/)

## Acknowledgments

- WebGazer.js team for the excellent eye-tracking library
- Flask community for the robust web framework
- Open source contributors who make projects like this possible