# Eye Tracker Demo

A web app that tracks where you are looking with WebGazer.js and lets you hit on-screen targets with your gaze instead of a mouse.

**Built by Shaily Sharma | [GitHub](https://github.com/SHAILY24) | [Live Demo](https://eyetracker.shaily.dev)**

I wanted to see how far browser-based gaze tracking could go without any special hardware, so I built a small calibration-and-targeting demo around WebGazer.

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

Live at [https://eyetracker.shaily.dev](https://eyetracker.shaily.dev).

### Test Instructions
1. Allow camera permissions when prompted
2. Sit in good light with your face centered
3. Run the calibration
4. Move your eyes to hit the on-screen targets

## Features

- Gaze tracking through WebGazer.js
- A 9-point calibration step to tune accuracy for your setup
- A live pointer that follows where you look
- Targets that react when your gaze lands on them
- Works on desktop browsers that have a webcam
- Everything runs client-side. Nothing leaves the browser.
- Regression on the calibration points to predict gaze position

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

Calibration takes about 30 seconds. After that, accuracy is roughly 100 to 150px, and gaze detection latency stays under 50ms. It runs on 95%+ of modern browsers. CPU use is moderate while tracking is active.

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

Thanks to the WebGazer.js team for the tracking library and to the Flask project, which this is built on.