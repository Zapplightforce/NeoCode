# Contributing to NeoCode

Thank you for your interest in contributing to NeoCode! This document provides guidelines and information for contributors.

## 🚀 Getting Started

### Prerequisites

- Neovim >= 0.8.0
- tmux >= 3.0
- Git
- Node.js (for development tools)
- Basic knowledge of Lua and shell scripting

### Development Setup

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/neocode.git
   cd neocode
   ```
3. Install development dependencies:
   ```bash
   ./scripts/install.sh --dev
   ```
4. Create a development branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## 🔧 Development Workflow

### Project Structure

```
neocode/
├── lua/neocode/         # Core Lua modules
│   ├── core/            # Core functionality (options, keymaps, etc.)
│   ├── plugins/         # Plugin configurations
│   └── ui/              # UI components (statusline, etc.)
├── config/              # Configuration files
├── scripts/             # Shell scripts for setup and session management
├── themes/              # Color schemes
├── templates/           # Project templates
└── docs/                # Documentation
```

### Coding Standards

#### Lua Code
- Use 2 spaces for indentation
- Follow existing naming conventions
- Add docstrings for functions
- Use local variables when possible
- Organize code into logical modules

Example:
```lua
-- Good
local M = {}

--- Setup the plugin with given options
---@param opts table Configuration options
function M.setup(opts)
  opts = opts or {}
  -- implementation
end

return M
```

#### Shell Scripts
- Use bash for shell scripts
- Add shebang line: `#!/bin/bash`
- Use `set -e` for error handling
- Add comments for complex logic
- Use consistent variable naming (snake_case)

### Testing

Run tests before submitting:
```bash
# Lua tests
make test-lua

# Shell script tests
make test-shell

# Integration tests
make test-integration
```

### Code Quality

We use the following tools:
- `stylua` for Lua formatting
- `shellcheck` for shell script linting
- `luacheck` for Lua static analysis

Format your code before committing:
```bash
make format
make lint
```

## 📝 Commit Guidelines

### Commit Message Format

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

#### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

#### Examples
```
feat(ui): add customizable statusline components

fix(tmux): resolve pane navigation issue on macOS

docs: update installation instructions for Windows
```

### Branching Strategy

- `main`: Production-ready code
- `develop`: Integration branch for features
- `feature/*`: Feature development branches
- `hotfix/*`: Critical bug fixes

## 🎯 Areas for Contribution

### High Priority
- [ ] Windows PowerShell support improvements
- [ ] Additional language server configurations
- [ ] Performance optimizations
- [ ] Better error handling and user feedback
- [ ] More comprehensive tests

### Medium Priority
- [ ] Additional themes
- [ ] Plugin configuration presets
- [ ] Documentation improvements
- [ ] UI/UX enhancements

### Future Features
- [ ] Desktop GUI version
- [ ] Remote development capabilities
- [ ] Collaborative editing support
- [ ] Extension marketplace

## 🐛 Bug Reports

When reporting bugs, please include:

1. **Environment Information**:
   - OS and version
   - Neovim version (`nvim --version`)
   - tmux version (`tmux -V`)
   - NeoCode version

2. **Steps to Reproduce**:
   - Detailed steps to reproduce the issue
   - Expected vs. actual behavior
   - Screenshots if applicable

3. **Logs**:
   - Run with debug mode: `NEOCODE_DEBUG=1 neocode start`
   - Include relevant error messages

## 💡 Feature Requests

For feature requests:

1. Check existing issues to avoid duplicates
2. Describe the use case and motivation
3. Provide examples or mockups if applicable
4. Consider implementation complexity and maintainability

## 📖 Documentation

Documentation improvements are always welcome:

- README updates
- Code comments and docstrings
- Wiki articles
- Tutorial videos or blog posts
- Man pages

### Documentation Style

- Use clear, concise language
- Include practical examples
- Keep formatting consistent
- Test all code examples

## 🔍 Code Review Process

1. All contributions require code review
2. Automated checks must pass (CI/CD)
3. At least one maintainer approval required
4. Address feedback promptly and respectfully

### Review Checklist

- [ ] Code follows style guidelines
- [ ] Tests are included and passing
- [ ] Documentation is updated
- [ ] No breaking changes (or properly documented)
- [ ] Performance impact considered

## 🏆 Recognition

Contributors are recognized in:
- README.md contributors section
- Release notes
- GitHub contributors page

## 📞 Getting Help

Need help? Reach out:

- GitHub Issues for bugs and features
- GitHub Discussions for questions
- Discord server (coming soon)

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to NeoCode! 🚀