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

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        echo "windows"
    else
        echo "unknown"
    fi
}

# Install dependencies based on OS
install_dependencies() {
    local os=$(detect_os)
    log "Detected OS: $os"
    
    case $os in
        "linux")
            if command -v apt &> /dev/null; then
                log "Installing dependencies with apt..."
                sudo apt update
                sudo apt install -y tmux neovim git curl build-essential
            elif command -v yum &> /dev/null; then
                log "Installing dependencies with yum..."
                sudo yum install -y tmux neovim git curl gcc make
            elif command -v pacman &> /dev/null; then
                log "Installing dependencies with pacman..."
                sudo pacman -S --noconfirm tmux neovim git curl base-devel
            else
                error "Unsupported Linux distribution"
                exit 1
            fi
            ;;
        "macos")
            if command -v brew &> /dev/null; then
                log "Installing dependencies with Homebrew..."
                brew install tmux neovim git curl
            else
                error "Homebrew not found. Please install Homebrew first."
                exit 1
            fi
            ;;
        "windows")
            warning "Windows detected. Please install dependencies manually:"
            echo "1. Install tmux via WSL or Windows Subsystem for Linux"
            echo "2. Install Neovim from https://neovim.io/"
            echo "3. Install Git from https://git-scm.com/"
            ;;
        *)
            error "Unsupported operating system: $OSTYPE"
            exit 1
            ;;
    esac
}

# Install Node.js (required for some language servers)
install_nodejs() {
    if ! command -v node &> /dev/null; then
        log "Installing Node.js..."
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
        sudo apt-get install -y nodejs
    else
        log "Node.js already installed ✓"
    fi
}

# Install additional tools
install_tools() {
    log "Installing additional tools..."
    
    # Install ripgrep for better searching
    local os=$(detect_os)
    case $os in
        "linux")
            if command -v apt &> /dev/null; then
                sudo apt install -y ripgrep fd-find
            fi
            ;;
        "macos")
            if command -v brew &> /dev/null; then
                brew install ripgrep fd
            fi
            ;;
    esac
    
    # Install language servers
    if command -v npm &> /dev/null; then
        log "Installing language servers..."
        sudo npm install -g \
            typescript-language-server \
            pyright \
            lua-language-server \
            bash-language-server
    fi
}

# Setup NeoCode
setup_neocode() {
    local neocode_dir="$HOME/.neocode"
    
    log "Setting up NeoCode..."
    
    # Clone or update NeoCode
    if [ -d "$neocode_dir" ]; then
        log "Updating existing NeoCode installation..."
        cd "$neocode_dir"
        git pull origin main
    else
        log "Cloning NeoCode..."
        git clone https://github.com/your-username/neocode.git "$neocode_dir"
        cd "$neocode_dir"
    fi
    
    # Make scripts executable
    chmod +x scripts/neocode
    chmod +x scripts/install.sh
    
    # Create symlink for easy access
    if [ ! -f "/usr/local/bin/neocode" ]; then
        sudo ln -sf "$neocode_dir/scripts/neocode" "/usr/local/bin/neocode"
        log "Created neocode command symlink"
    fi
    
    # Run setup
    ./scripts/neocode setup
}

# Main installation
main() {
    log "Starting NeoCode installation..."
    
    # Check if running as root
    if [ "$EUID" -eq 0 ]; then
        error "Please do not run this script as root"
        exit 1
    fi
    
    # Install dependencies
    install_dependencies
    install_nodejs
    install_tools
    
    # Setup NeoCode
    setup_neocode
    
    log "Installation completed successfully!"
    log "You can now use 'neocode start' to begin a coding session."
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
        install_nodejs
        install_tools
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