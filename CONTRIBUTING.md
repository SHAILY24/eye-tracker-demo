# Contributing to Eye Tracker Demo

Thank you for your interest in contributing to the Eye Tracker Demo project! This document provides guidelines and instructions for contributing.

## How to Contribute

### Reporting Issues

1. **Check existing issues**: Before creating a new issue, please check if it already exists
2. **Use issue templates**: Follow the issue template for bugs or feature requests
3. **Provide details**: Include steps to reproduce, expected behavior, and actual behavior
4. **Environment info**: Mention your browser, OS, and any relevant versions

### Suggesting Enhancements

1. **Open a discussion**: Start with a GitHub discussion for major features
2. **Explain the value**: Describe why this enhancement would be useful
3. **Consider alternatives**: Discuss potential implementations
4. **Be patient**: Feature requests are reviewed based on project priorities

### Pull Requests

1. **Fork the repository**: Create your own fork of the project
2. **Create a branch**: Use a descriptive branch name (e.g., `feature/add-blink-detection`)
3. **Make changes**: Implement your feature or fix
4. **Test thoroughly**: Ensure all existing tests pass
5. **Submit PR**: Provide a clear description of changes

## Development Setup

### Prerequisites

- Python 3.10+
- Git
- Modern web browser with webcam

### Local Development

1. **Fork and clone**
   ```bash
   git clone https://github.com/YOUR-USERNAME/eye-tracker-demo.git
   cd eye-tracker-demo/eye_tracking_demo
   ```

2. **Set up virtual environment**
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   pip install -r requirements-dev.txt  # If available
   ```

4. **Install pre-commit hooks**
   ```bash
   pip install pre-commit
   pre-commit install
   ```

5. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Code Style Guidelines

### Python Code

- Follow PEP 8 style guide
- Use Black for code formatting
- Maximum line length: 100 characters
- Use type hints where appropriate
- Write docstrings for all functions

### JavaScript Code

- Use ES6+ features
- Consistent indentation (2 spaces)
- Use meaningful variable names
- Comment complex logic
- Avoid global variables

### CSS Code

- Use BEM naming convention where applicable
- Organize properties logically
- Use CSS variables for colors and common values
- Mobile-first responsive design
- Comment section purposes

## Testing Requirements

### Before Submitting

1. **Run security checks**
   ```bash
   bandit -r . -ll
   safety check
   gitleaks detect
   ```

2. **Run linters**
   ```bash
   flake8 .
   black --check .
   ```

3. **Test functionality**
   - Test calibration process
   - Verify eye tracking works
   - Check responsive design
   - Test error handling

4. **Browser testing**
   - Chrome (latest)
   - Firefox (latest)
   - Edge (if available)

## Commit Guidelines

### Commit Messages

Follow the conventional commits specification:

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting, etc.)
- `refactor:` Code refactoring
- `test:` Adding or updating tests
- `chore:` Maintenance tasks

Examples:
```
feat: add multi-point calibration support
fix: resolve tracking accuracy in low light
docs: update installation instructions
```

### Commit Best Practices

- Keep commits atomic and focused
- Write clear, descriptive messages
- Reference issues when applicable (`fixes #123`)
- Sign your commits if possible

## Pull Request Process

1. **Update documentation**: Include any necessary documentation changes
2. **Add tests**: Include tests for new functionality
3. **Pass checks**: Ensure all CI checks pass
4. **Request review**: Tag maintainers for review
5. **Address feedback**: Respond to review comments promptly
6. **Stay up to date**: Rebase on main if needed

### PR Description Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement

## Testing
- [ ] Tested locally
- [ ] Added/updated tests
- [ ] Tested on multiple browsers

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No new warnings
```

## Code of Conduct

### Expected Behavior

- Be respectful and inclusive
- Welcome newcomers and help them
- Accept constructive criticism
- Focus on what's best for the community

### Unacceptable Behavior

- Harassment or discrimination
- Trolling or insulting comments
- Public or private harassment
- Publishing private information

## Getting Help

- **Documentation**: Check the README and docs
- **Discussions**: Use GitHub Discussions for questions
- **Email**: Contact [shailysharma873@gmail.com](mailto:shailysharma873@gmail.com)

## Recognition

Contributors will be recognized in:
- The project's Contributors section
- Release notes for significant contributions
- Special mentions for security reports

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

## Questions?

Feel free to contact the maintainer:
- **Name**: Shaily Sharma
- **GitHub**: [@SHAILY24](https://github.com/SHAILY24)
- **Email**: [shailysharma873@gmail.com](mailto:shailysharma873@gmail.com)