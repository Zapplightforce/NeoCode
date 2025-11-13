# NeoCode VSCode-like Setup Guide

This guide will help you set up NeoCode with a VSCode-like terminal environment using tmux and Neovim, creating a professional development experience in headless/server environments.

## 🎯 Overview

NeoCode creates a VSCode-like layout with:
- **Left sidebar**: File explorer (nvim-tree) 
- **Main area**: Editor with tabs (Neovim + bufferline)
- **Right sidebar**: Utility panel (git, terminal, etc.)
- **Bottom panel**: Terminal area (toggleterm)

## 📋 Prerequisites

### Required Software
- **Neovim** >= 0.9.0
- **tmux** >= 3.0
- **git**
- **Node.js** (for LSP servers)

### Installation Commands

#### Ubuntu/Debian
```bash
sudo apt update
sudo apt install -y neovim tmux git nodejs npm build-essential
```

#### CentOS/RHEL/Fedora
```bash
sudo yum install -y neovim tmux git nodejs npm gcc-c++ make
# or for newer versions:
sudo dnf install -y neovim tmux git nodejs npm gcc-c++ make
```

#### macOS
```bash
brew install neovim tmux git node
```

#### Windows (WSL2 recommended)
```bash
# In WSL2 Ubuntu
sudo apt update
sudo apt install -y neovim tmux git nodejs npm build-essential

# Or use Windows Terminal with tmux in WSL
```

#### Arch Linux
```bash
sudo pacman -S neovim tmux git nodejs npm base-devel
```

## 🚀 Quick Setup

### 1. Clone NeoCode
```bash
git clone https://github.com/YourUsername/NeoCode.git
cd NeoCode
```

### 2. Install NeoCode
```bash
# Make scripts executable
chmod +x scripts/install.sh scripts/neocode-session

# Run the installer
./scripts/install.sh

# Or manual setup:
mkdir -p ~/.config/neocode
cp -r * ~/.config/neocode/
```

### 3. Setup tmux Configuration
```bash
# Backup existing tmux config (if any)
cp ~/.tmux.conf ~/.tmux.conf.backup 2>/dev/null || true

# Link NeoCode tmux config
ln -sf ~/.config/neocode/config/tmux.conf ~/.tmux.conf

# Reload tmux config (if tmux is running)
tmux source-file ~/.tmux.conf 2>/dev/null || true
```

### 4. Install Neovim Plugins
```bash
# Start Neovim to trigger plugin installation
nvim -u ~/.config/neocode/init.lua +PlugInstall +qa

# Or use the NeoCode config directly
echo "alias nv='nvim -u ~/.config/neocode/init.lua'" >> ~/.bashrc
source ~/.bashrc
```

## 🎮 Launch NeoCode Session

### Method 1: Using the Session Script
```bash
# Launch in current directory
./scripts/neocode-session

# Launch in specific directory  
./scripts/neocode-session /path/to/your/project

# For Windows (PowerShell)
.\scripts\neocode-session.ps1 C:\path\to\your\project
```

### Method 2: Manual tmux Setup
```bash
# Create session
tmux new-session -d -s neocode-dev

# Create the VSCode-like layout
tmux split-window -h -p 75        # Create left sidebar
tmux split-window -h -p 25        # Create right panel  
tmux split-window -v -p 30        # Create bottom terminal

# Setup panes
tmux send-keys -t 0 "nvim -c 'NvimTreeOpen | only'" C-m  # File explorer
tmux send-keys -t 1 "nvim" C-m                           # Main editor
tmux send-keys -t 2 "nvim -c 'terminal'" C-m             # Utility panel
tmux send-keys -t 3 "bash" C-m                           # Terminal

# Attach to session
tmux attach-session -t neocode-dev
```

## ⌨️ Key Bindings & Navigation

### tmux + Neovim Navigation (Seamless)
- `Ctrl-h/j/k/l` - Navigate between panes/splits (works across tmux and Neovim)
- `Ctrl-\` - Go to previous pane
- `Alt-Arrow` - Navigate panes (alternative)

### File Explorer (nvim-tree)
- `<leader>e` or `Ctrl-n` - Toggle file explorer
- `<leader>o` - Focus file explorer
- In file tree:
  - `Enter` - Open file
  - `a` - Create file/directory
  - `d` - Delete
  - `r` - Rename
  - `x` - Cut
  - `c` - Copy
  - `p` - Paste

### Buffer/Tab Management (VSCode-like)
- `Tab` - Next buffer/tab
- `Shift-Tab` - Previous buffer/tab
- `<leader>bd` - Close buffer
- `<leader>1-9` - Go to buffer by number
- `<leader>bp` - Toggle pin buffer
- `<leader>bo` - Close other buffers

### Terminal Management
- `Ctrl-\` or `Ctrl-`` - Toggle main terminal
- `<leader>th` - Horizontal terminal
- `<leader>tf` - Floating terminal
- `<leader>tv` - Vertical terminal
- `<leader>tg` - Git terminal
- In terminal:
  - `Esc` - Exit terminal mode
  - `Ctrl-h/j/k/l` - Navigate to other panes

### tmux Specific
- `Prefix` (default: `Ctrl-a`) + key for tmux commands
- `Prefix + |` - Split pane vertically
- `Prefix + -` - Split pane horizontally
- `Prefix + z` - Zoom/unzoom current pane
- `Prefix + r` - Reload tmux config

## 🎨 Customization

### Change Layout Proportions
Edit `scripts/neocode-session` and modify the percentage values:
```bash
# Adjust these values to your preference:
tmux split-window -h -p 75    # Left sidebar width (25%)
tmux split-window -h -p 25    # Right panel width (20% of remaining)
tmux split-window -v -p 30    # Bottom terminal height (30%)
```

### Customize tmux Colors/Theme
Edit `config/tmux.conf` and modify the status bar colors:
```bash
# Status bar colors (Catppuccin theme)
set -g status-style 'bg=#1e1e2e,fg=#cdd6f4'
set -g pane-active-border-style 'fg=#89b4fa'
```

### Add Custom Keybindings
Edit `lua/neocode/core/keymaps.lua`:
```lua
-- Add your custom keymaps
keymap("n", "<leader>custom", ":YourCommand<CR>", opts)
```

## 🔧 Troubleshooting

### Plugin Installation Issues
```bash
# Clear plugin cache and reinstall
rm -rf ~/.local/share/nvim/lazy
nvim -u ~/.config/neocode/init.lua
```

### tmux Navigator Not Working
1. Ensure tmux config is loaded: `tmux source-file ~/.tmux.conf`
2. Check if vim-tmux-navigator plugin is installed
3. Verify tmux version >= 3.0

### File Explorer Not Showing
```vim
" In Neovim
:NvimTreeToggle
:checkhealth nvim-tree
```

### Performance Issues
- Reduce file watcher scope in `nvim-tree` config
- Disable unused LSP servers
- Limit tmux history: `set -g history-limit 5000`

### Layout Not Preserved
Add to your shell profile (`.bashrc`, `.zshrc`):
```bash
# Auto-attach to NeoCode session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach-session -t neocode-dev 2>/dev/null || ~/.config/neocode/scripts/neocode-session
fi
```

## 🔄 Updates & Maintenance

### Update NeoCode
```bash
cd ~/.config/neocode
git pull origin main

# Update plugins
nvim -u init.lua +Lazy sync +qa
```

### Backup Configuration
```bash
# Backup your customizations
tar -czf neocode-backup-$(date +%Y%m%d).tar.gz ~/.config/neocode ~/.tmux.conf
```

### Performance Monitoring
```bash
# Check Neovim startup time
nvim --startuptime startup.log +qa && cat startup.log

# Check tmux performance
tmux show -g | grep -i history
```

## 📚 Additional Resources

### Recommended Plugins
See the full plugin list in `lua/neocode/plugins/init.lua`

### Learning Resources
- [tmux Cheat Sheet](https://tmuxcheatsheet.com/)
- [Neovim Documentation](https://neovim.io/doc/)
- [Vim-tmux-navigator Guide](https://github.com/christoomey/vim-tmux-navigator)

### Community
- Report issues: [GitHub Issues](https://github.com/YourUsername/NeoCode/issues)
- Discussions: [GitHub Discussions](https://github.com/YourUsername/NeoCode/discussions)

## ✅ Verification Checklist

After setup, verify everything works:

- [ ] tmux session launches successfully
- [ ] Four panes are created in VSCode-like layout
- [ ] File explorer (nvim-tree) opens in left pane
- [ ] Main editor opens in center pane  
- [ ] Terminal works in bottom pane
- [ ] Ctrl-h/j/k/l navigates between panes seamlessly
- [ ] Buffer tabs show at the top
- [ ] LSP and syntax highlighting work
- [ ] Git integration shows file status

🎉 **Success!** You now have a VSCode-like terminal development environment!