#!/bin/bash
# NeoCode Installation Script
# Installs NeoCode and its dependencies

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[INSTALL]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Detect OS and package manager
detect_platform() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt &> /dev/null; then
            echo "ubuntu"
        elif command -v yum &> /dev/null || command -v dnf &> /dev/null; then
            echo "rhel"
        elif command -v pacman &> /dev/null; then
            echo "arch"
        else
            echo "linux"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]] || [[ -n "$WSL_DISTRO_NAME" ]]; then
        echo "windows"
    else
        echo "unknown"
    fi
}

# Universal dependency installer
install_dependencies() {
    local platform=$(detect_platform)
    log "Detected platform: $platform"
    
    # Check what's missing
    local missing_deps=()
    command -v tmux &> /dev/null || missing_deps+=("tmux")
    command -v nvim &> /dev/null || missing_deps+=("neovim")
    command -v git &> /dev/null || missing_deps+=("git")
    
    if [ ${#missing_deps[@]} -eq 0 ]; then
        log "All core dependencies already installed ✓"
        return
    fi
    
    log "Missing dependencies: ${missing_deps[*]}"
    
    case $platform in
        "ubuntu")
            log "Installing with apt..."
            sudo apt update
            local packages=()
            [[ " ${missing_deps[*]} " =~ " tmux " ]] && packages+=("tmux")
            [[ " ${missing_deps[*]} " =~ " neovim " ]] && packages+=("neovim")
            [[ " ${missing_deps[*]} " =~ " git " ]] && packages+=("git")
            sudo apt install -y "${packages[@]}" curl build-essential
            ;;
        "rhel")
            log "Installing with yum/dnf..."
            local packages=()
            [[ " ${missing_deps[*]} " =~ " tmux " ]] && packages+=("tmux")
            [[ " ${missing_deps[*]} " =~ " neovim " ]] && packages+=("neovim")
            [[ " ${missing_deps[*]} " =~ " git " ]] && packages+=("git")
            
            if command -v dnf &> /dev/null; then
                sudo dnf install -y "${packages[@]}" curl gcc make
            else
                sudo yum install -y "${packages[@]}" curl gcc make
            fi
            ;;
        "arch")
            log "Installing with pacman..."
            local packages=()
            [[ " ${missing_deps[*]} " =~ " tmux " ]] && packages+=("tmux")
            [[ " ${missing_deps[*]} " =~ " neovim " ]] && packages+=("neovim")
            [[ " ${missing_deps[*]} " =~ " git " ]] && packages+=("git")
            sudo pacman -S --needed "${packages[@]}" curl base-devel
            ;;
        "macos")
            if ! command -v brew &> /dev/null; then
                error "Homebrew required for macOS. Install from https://brew.sh"
                exit 1
            fi
            log "Installing with brew..."
            local packages=()
            [[ " ${missing_deps[*]} " =~ " tmux " ]] && packages+=("tmux")
            [[ " ${missing_deps[*]} " =~ " neovim " ]] && packages+=("neovim")  
            [[ " ${missing_deps[*]} " =~ " git " ]] && packages+=("git")
            brew install "${packages[@]}" curl
            ;;
        "windows")
            if [[ -n "$WSL_DISTRO_NAME" ]]; then
                log "WSL detected, using Ubuntu packages..."
                install_dependencies # Recursively call as ubuntu
                return
            else
                warning "Windows/Git Bash detected."
                warning "Install manually: tmux (via MSYS2), neovim, git"
                warning "Or use WSL2 for best experience."
            fi
            ;;
        *)
            warning "Unknown platform. Install manually: tmux, neovim, git"
            ;;
    esac
}

# Install Node.js and language servers (optional)
install_optional_tools() {
    log "Installing optional tools..."
    
    # Install Node.js if missing (for LSP servers)
    if ! command -v node &> /dev/null; then
        warning "Node.js not found. Language servers won't be available."
        warning "Install Node.js manually for LSP support."
    else
        log "Node.js found ✓"
        # Install language servers
        if command -v npm &> /dev/null; then
            log "Installing language servers..."
            npm install -g typescript-language-server pyright bash-language-server 2>/dev/null || warning "Some LSP installs failed"
        fi
    fi
    
    # Install useful CLI tools if available
    local platform=$(detect_platform)
    case $platform in
        "ubuntu")
            sudo apt install -y ripgrep fd-find 2>/dev/null || true
            ;;
        "macos")
            command -v brew &> /dev/null && brew install ripgrep fd 2>/dev/null || true
            ;;
    esac
}

# Setup NeoCode configuration (universal)
setup_neocode() {
    log "Setting up NeoCode configuration..."
    
    # Ensure we're in the right directory
    if [[ ! -f "init.lua" ]] || [[ ! -d "lua/neocode" ]]; then
        error "Please run this script from the NeoCode directory"
        exit 1
    fi
    
    # Create config directories
    mkdir -p "$HOME/.config/neocode"
    mkdir -p "$HOME/.local/share/neocode"
    
    # Copy configuration files (universal approach)
    cp config/tmux.conf "$HOME/.config/neocode/tmux.conf"
    
    # Create symlinks for Neovim config
    ln -sf "$(pwd)/init.lua" "$HOME/.config/neocode/init.lua" 2>/dev/null || {
        warning "Could not create symlink, copying instead..."
        cp init.lua "$HOME/.config/neocode/init.lua"
    }
    
    ln -sf "$(pwd)/lua" "$HOME/.config/neocode/lua" 2>/dev/null || {
        warning "Could not create symlink, copying instead..."
        cp -r lua "$HOME/.config/neocode/"
    }
    
    # Make scripts executable
    chmod +x scripts/* 2>/dev/null || true
    
    # Add to PATH (detect shell)
    local shell_rc=""
    if [[ -n "$BASH_VERSION" ]] && [[ -f "$HOME/.bashrc" ]]; then
        shell_rc="$HOME/.bashrc"
    elif [[ -n "$ZSH_VERSION" ]] && [[ -f "$HOME/.zshrc" ]]; then
        shell_rc="$HOME/.zshrc"
    elif [[ -f "$HOME/.profile" ]]; then
        shell_rc="$HOME/.profile"
    fi
    
    if [[ -n "$shell_rc" ]] && ! grep -q "neocode" "$shell_rc"; then
        echo "" >> "$shell_rc"
        echo "# NeoCode" >> "$shell_rc"
        echo "export PATH=\"$(pwd)/scripts:\$PATH\"" >> "$shell_rc"
        log "Added NeoCode to PATH in $shell_rc"
        warning "Restart your shell or run: source $shell_rc"
    fi
    
    log "NeoCode setup complete!"
}

# Main installation
main() {
    log "NeoCode Universal Installer"
    log "=========================="
    
    # Check if running as root
    if [ "$EUID" -eq 0 ]; then
        error "Please do not run this script as root"
        exit 1
    fi
    
    # Install core dependencies
    install_dependencies
    
    # Install optional tools
    install_optional_tools
    
    # Setup NeoCode configuration
    setup_neocode
    
    log "Installation completed successfully!"
    echo ""
    log "🚀 Quick Start:"
    echo "  1. Restart your terminal (or run: source ~/.bashrc)"
    echo "  2. Test: neocode --help"
    echo "  3. Start coding: neocode start"
    echo "  4. Try VSCode layout: neocode-vscode"
    echo ""
    log "📚 Next Steps:"
    echo "  - Read: docs/VSCode-Setup-Guide.md"
    echo "  - Test: ./scripts/debug-layout"
}

# Show help
show_help() {
    cat << EOF
NeoCode Installation Script

This script installs NeoCode and all required dependencies.

Usage: $0 [OPTIONS]

Options:
    --help, -h      Show this help message
    --deps-only     Install only dependencies, skip NeoCode setup

Requirements:
    - Linux, macOS, or Windows with WSL
    - Internet connection
    - sudo privileges (for Linux/macOS)

EOF
}

# Parse arguments
case "${1:-install}" in
    "--help"|"-h")
        show_help
        ;;
    "--deps-only")
        log "Installing dependencies only..."
        install_dependencies
        install_optional_tools
        log "Dependencies installed!"
        ;;
    "install"|"")
        main
        ;;
    *)
        error "Unknown option: $1"
        show_help
        exit 1
        ;;
esac