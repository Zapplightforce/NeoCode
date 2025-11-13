# NeoCode# NeoCode# NeoCode - LazyVim + tmux in Docker



**Stock LazyVim + tmux. Simple. Clean. VSCode-like.**



## What This Is**LazyVim + tmux in Docker. Simple.****Simple. Clean. Just LazyVim.**



NeoCode is a terminal-based code editor that combines LazyVim with tmux for a modern, VSCode-like development experience in the terminal.



- **LazyVim**: Modern Neovim distribution from https://www.lazyvim.org/## What This Is## What This Is

- **tmux**: Enhanced session and window management

- **VSCode-like**: Familiar shortcuts and workflow



Stock LazyVim configuration with an optimized tmux setup for seamless integration.Stock LazyVim running in tmux. No custom configs, no bullshit.- **LazyVim**: Stock configuration from https://www.lazyvim.org/



## ✨ Features- **tmux**: For window management



- **🚀 LazyVim**: Modern Neovim distribution with LSP, fuzzy finding, and more## Quick Start- **Docker**: So it runs anywhere

- **🎯 Smart Navigation**: Seamless movement between tmux panes and Neovim splits with Ctrl+h/j/k/l

- **📊 Split Panes**: tmux integration with vim-tmux-navigator

- **🔍 Fuzzy Finding**: Quick file search (Space+ff or Space+Space)

- **⚡ Modern LSP**: Language servers, autocompletion, diagnostics```bashThat's it. No custom configs, no bullshit.

- **🎨 Beautiful UI**: Catppuccin theme with modern statusline

- **📁 File Explorer**: Neo-tree file browser (Space+e)# Build and start

- **🔧 Works Out of the Box**: Optimized tmux configuration included

- **🌟 Stock LazyVim**: No custom configs - just enhanced tmux integrationdocker-compose up -d## ✨ Features



## 🚀 Quick Start



### Prerequisites# Enter container  - **🚀 LazyVim**: Modern Neovim distribution with VSCode-like features



- **Neovim** >= 0.8.0docker-compose exec neocode bash- **🪟 Windows-Style Shortcuts**: Familiar Ctrl+S, Ctrl+C, Ctrl+V, and more

- **tmux** >= 3.0

- **git**- **📑 Buffer-Based Tabs**: Open files shown as tabs (like VSCode), not Neovim tabs

- **LazyVim** installed at `~/.config/nvim`

# Start LazyVim- **📁 Unified File Explorer**: One shared file tree, not duplicated per tab

### Installation

nvim- **🎯 Smart Navigation**: Seamless movement between tmux panes and Neovim splits

1. **Install LazyVim** (if not already installed):

```bash```- **📊 Dashboard as Buffer**: LazyVim menu accessible as a tab, not an overlay

# Backup existing config

mv ~/.config/nvim ~/.config/nvim.bak- **🔍 Fuzzy Finding**: Quick file search (Ctrl+P or Space+ff)



# Install LazyVim starter## What You Get- **⚡ Modern LSP**: Language servers, autocompletion, diagnostics

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git- **🎨 Beautiful UI**: Catppuccin theme with modern statusline and bufferline

```

✅ LazyVim (from https://www.lazyvim.org/)  - **📊 Split Panes**: tmux integration for terminal workflow

2. **Clone NeoCode**:

```bash✅ File explorer (`Space + e`)  - **🔧 Works Out of the Box**: Optimized configuration included

git clone https://github.com/Zapplightforce/NeoCode.git

cd NeoCode✅ Fuzzy finder (`Space + Space`)  - **🌟 Extensible**: Easy to add plugins and customizations

```

✅ LSP, auto-complete, syntax highlighting  

3. **Make script executable**:

```bash✅ Terminal (`Ctrl + /`)  ## 🚀 Quick Start

chmod +x scripts/neocode

```✅ Git integration  



4. **Start NeoCode**:### 🐛 Dashboard Overlay Issue?

```bash

./scripts/neocode start## Key Shortcuts

```

**If you're seeing the LazyVim dashboard covering your entire screen:**

## 📖 Usage

| Key | Action |- **Using Docker?** → **[Docker Debug Guide](DOCKER_DEBUG.md)** ← Start here!

### Starting a Session

|-----|--------|- **Linux/macOS install?** → [Quick Fix Guide](QUICKFIX.md)

```bash

# Start in current directory (interactive prompt)| `Space` | Leader key |

./scripts/neocode start

| `Space + e` | File explorer |### Automated Installation (Linux/macOS/WSL)

# Start in specific directory

./scripts/neocode start /path/to/project| `Space + Space` | Find files |



# Attach to existing session| `Ctrl + /` | Terminal |```bash

./scripts/neocode attach

# Clone the repository

# List all sessions

./scripts/neocode list[Full shortcuts](https://www.lazyvim.org/keymaps)git clone https://github.com/Zapplightforce/NeoCode.git



# Stop current sessioncd NeoCode

./scripts/neocode stop

```## Customization



### What You Get# Run the installer



When you start NeoCode, you get an optimized tmux layout:LazyVim is already configured. To customize:chmod +x INSTALL.sh



```./INSTALL.sh

┌────────────────────────────────────────────────────────┐

│ LazyVim Editor (Top Pane)                              │https://www.lazyvim.org/configuration/general```

│ • File explorer: Space + e                             │

│ • Find files: Space + Space or Space + ff              │

│ • Live grep: Space + fg                                │

│ • Buffers: Space + fb                                  │## License### Manual Installation

├──────────────────────┬─────────────────────────────────┤

│ Terminal Pane        │ Git Pane (if git repo)          │

│ (Bottom Left)        │ (Bottom Right)                  │

└──────────────────────┴─────────────────────────────────┘MIT```bash

```

# Copy configuration files

## ⌨️ Key Bindingscp config/nvim-neocode.lua ~/.config/nvim/lua/config/neocode.lua

cp config/plugins/neocode.lua ~/.config/nvim/lua/plugins/neocode.lua

### LazyVim Shortcuts (Stock)cp config/autocmds.lua ~/.config/nvim/lua/config/autocmds.lua



| Key | Action |# Restart Neovim

|-----|--------|nvim

| `Space` | Leader key |```

| `Space + e` | Toggle file explorer |

| `Space + Space` | Find files |### Docker (Alternative)

| `Space + ff` | Find files (alternative) |

| `Space + fg` | Live grep (search in files) |```bash

| `Space + fb` | Browse buffers |# Build the container

| `Space + /` | Toggle terminal |docker build -t neocode .



Full LazyVim keymaps: https://www.lazyvim.org/keymaps# Run NeoCode

docker run -it --rm -v ${PWD}:/workspace neocode

### tmux Navigation (Enhanced)

# Inside container, start NeoCode

| Key | Action |neocode start

|-----|--------|```

| `Ctrl + h/j/k/l` | Navigate between panes AND Neovim splits |

| `Alt + Arrow Keys` | Alternative pane navigation |## 📖 Usage

| `Ctrl + Left/Right` | Switch tmux windows |

| `Ctrl + Shift + Arrow` | Resize panes |### Starting a Session



### tmux Window Management```bash

# Start in current directory

| Key | Action |neocode start

|-----|--------|

| `Ctrl + a` then `\|` | Split vertically |# Start in specific directory  

| `Ctrl + a` then `-` | Split horizontally |neocode start /path/to/project

| `Ctrl + a` then `z` | Zoom current pane |

| `Ctrl + a` then `r` | Reload tmux config |# Attach to existing session

neocode attach

## ⚙️ Configuration

# List all sessions

### tmux Configurationneocode list

```

NeoCode includes an optimized tmux configuration at `config/tmux.conf` with:

### Key Bindings

- **Catppuccin theme**: Matching LazyVim's aesthetic

- **vim-tmux-navigator**: Seamless navigation between tmux panes and Neovim splits**📖 See the complete [Navigation Guide](docs/Navigation-Guide.md) for all shortcuts!**

- **Enhanced keybindings**: VSCode-inspired shortcuts

- **Mouse support**: Click to switch panes#### Windows-Style Shortcuts (Familiar!)

- **Clipboard integration**: Shared clipboard between tmux and system

- `Ctrl + S` - Save file

The configuration is automatically copied to `~/.config/neocode/tmux.conf` when you run the script.- `Ctrl + W` - Close buffer/tab

- `Ctrl + C` - Copy (line or selection)

### LazyVim Customization- `Ctrl + V` - Paste

- `Ctrl + X` - Cut

NeoCode uses stock LazyVim. To customize LazyVim:- `Ctrl + Z` - Undo

- `Ctrl + Y` - Redo

1. Edit files in `~/.config/nvim/lua/`- `Ctrl + F` - Find in file

2. Add plugins in `~/.config/nvim/lua/plugins/`- `Ctrl + H` - Find and replace

3. Configure settings in `~/.config/nvim/lua/config/`- `Ctrl + P` - Quick open file

- `Ctrl + Shift + F` - Find in all files

See https://www.lazyvim.org/configuration for details.- `Ctrl + B` - Toggle file explorer

- `Ctrl + Tab` - Next buffer/tab

## 🛠️ Project Structure- `Ctrl + /` - Toggle comment



```#### File Operations (LazyVim Style)

neocode/

├── config/- `<Space>` - Leader key

│   └── tmux.conf        # Enhanced tmux configuration- `<Space> + ff` - Find files (Telescope)

├── scripts/- `<Space> + fg` - Live grep (search in files)

│   └── neocode          # Main session manager script- `<Space> + fb` - Browse buffers

├── README.md            # This file- `<Space> + e` - Toggle file explorer

└── LICENSE              # MIT License- `<Space> + ud` - Open dashboard (as a tab)

```

#### Navigation

## 🔧 Troubleshooting

- `Ctrl + H/J/K/L` - Navigate between tmux panes AND Neovim splits

### tmux not found- `Alt + Arrow Keys` - Alternative pane navigation

- `F12` - Go to definition (LSP)

```bash- `Ctrl + F12` - Go to implementation

# Ubuntu/Debian- `Shift + F12` - Find references

sudo apt install tmux

#### tmux Window Management

# macOS

brew install tmux- `Ctrl + A` then `|` - Split vertically

- `Ctrl + A` then `-` - Split horizontally  

# Arch Linux- `Ctrl + A` then `Z` - Zoom current pane

sudo pacman -S tmux- `Ctrl + Left/Right` - Switch tmux windows

```- `Ctrl + Shift + Left/Right/Up/Down` - Resize panes



### Neovim version too old### Session Management



```bashNeoCode creates organized tmux sessions with an optimized layout:

# Ubuntu/Debian - use unstable PPA for latest

sudo add-apt-repository ppa:neovim-ppa/unstable#### Architecture

sudo apt update && sudo apt install neovim

```

# macOS┌────────────────────────────────────────────────────────┐

brew install neovim│ tmux Window 1: "NeoCode" (Main Workspace)             │

│ ┌──────────┬───────────────────────────────────────┐  │

# Or build from source│ │          │ Bufferline (VSCode-like file tabs)    │  │

git clone https://github.com/neovim/neovim│ │  Neo-    │ ┌──────────────────────────────────┐  │  │

cd neovim && make CMAKE_BUILD_TYPE=Release│ │  Tree    │ │                                  │  │  │

sudo make install│ │          │ │   Editor Area (Current Buffer)   │  │  │

```│ │  File    │ │                                  │  │  │

│ │  Explorer│ └──────────────────────────────────┘  │  │

### LazyVim not installed│ │          ├──────────────────┬──────────────────┤  │

│ │  (Shared)│   Terminal Pane   │    Git Pane     │  │

```bash│ └──────────┴──────────────────┴──────────────────┘  │

# Backup existing config│                                                        │

mv ~/.config/nvim ~/.config/nvim.bak│ tmux Window 2+: Additional workspaces as needed       │

└────────────────────────────────────────────────────────┘

# Install LazyVim starter```

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git#### Key Concepts



# Start Neovim to install plugins- **tmux Windows** = Separate workspaces (shown in bottom status bar)

nvim- **Neovim Buffers** = Open files (shown in top bufferline as "tabs")

```- **One File Tree** = Shared file explorer in left pane

- **No Neovim Tabs** = We use buffers instead for VSCode-like experience

### Navigation between panes not working- **Dashboard as Buffer** = LazyVim menu opens as a tab, not an overlay



Make sure vim-tmux-navigator is installed in LazyVim:## ⚙️ Configuration



```lua### Global Settings

-- In ~/.config/nvim/lua/plugins/navigation.lua

return {Edit `~/.config/neocode/settings.lua` for global configuration:

  "christoomey/vim-tmux-navigator",

  lazy = false,```lua

}-- Example configuration

```editor = {

  theme = "catppuccin-mocha",

### Session already exists  font_size = 14,

  auto_save = true,

```bash}

# Kill existing session

./scripts/neocode stoplsp = {

  servers = { "lua_ls", "pyright", "tsserver" }

# Or attach to existing}

./scripts/neocode attach```

```

### Project-Specific Settings

## 🤝 Contributing

Create `.neocode.yaml` in your project root:

Contributions are welcome! Please feel free to submit a Pull Request.

```yaml

1. Fork the repositoryeditor:

2. Create a feature branch: `git checkout -b feature/amazing-feature`  tab_size: 4

3. Commit your changes: `git commit -m 'Add amazing feature'`  format_on_save: true

4. Push to the branch: `git push origin feature/amazing-feature`

5. Open a Pull Requestlsp:

  servers:

## 📄 License    - pyright

    - ruff_lsp

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.```



## 🙏 Acknowledgments### Custom Themes



- [Neovim](https://neovim.io/) - The extensible vim-based text editorCreate custom themes in `themes/` directory:

- [LazyVim](https://www.lazyvim.org/) - Modern Neovim distribution

- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer```lua

- [Catppuccin](https://github.com/catppuccin/nvim) - Soothing pastel theme-- themes/my-theme.lua

- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - Seamless navigationreturn {

  bg = "#1a1a1a",

## 📊 Roadmap  fg = "#ffffff",

  -- ... more colors

- [x] Core LazyVim integration}

- [x] Enhanced tmux configuration```

- [x] Seamless pane navigation

- [x] Session management script## 🔌 Plugin System

- [x] Catppuccin theme integration

- [ ] Additional language server configurationsNeoCode uses lazy.nvim for plugin management. Add plugins in `lua/neocode/plugins/`:

- [ ] Custom project templates

- [ ] Integration with popular dev tools```lua

- [ ] Video tutorials-- Example plugin configuration

{

---  "your-username/awesome-plugin",

  config = function()

<div align="center">    require("awesome-plugin").setup()

  <p>Made with ❤️ for terminal enthusiasts</p>  end,

  <p>⭐ Star us on GitHub if you find NeoCode useful!</p>}

</div>```


## 🛠️ Development

### Project Structure

```
neocode/
├── init.lua              # Main entry point
├── config/               # Configuration files
│   ├── settings.lua      # Default settings
│   └── tmux.conf        # tmux configuration
├── lua/neocode/         # Lua modules
│   ├── core/            # Core functionality
│   ├── plugins/         # Plugin configurations
│   └── ui/              # UI components
├── scripts/             # Installation and session scripts
├── themes/              # Color schemes
├── templates/           # Project templates
└── docs/                # Documentation
```

### Building from Source

```bash
git clone https://github.com/your-username/neocode.git
cd neocode
./scripts/install.sh --dev
```

### Running Tests

```bash
# Run Lua tests
make test-lua

# Run integration tests
make test-integration
```

## 🎨 Themes

NeoCode comes with several built-in themes:

- **Catppuccin Mocha** (default) - Dark, warm theme
- **Catppuccin Latte** - Light theme
- **Tokyo Night** - Dark blue theme
- **Gruvbox** - Retro groove theme

Switch themes with `<leader>nt` or set in configuration.

## 🔧 Troubleshooting

### Common Issues

1. **tmux not found**:
   ```bash
   # Install tmux
   sudo apt install tmux  # Ubuntu/Debian
   brew install tmux      # macOS
   ```

2. **Neovim version too old**:
   ```bash
   # Install latest Neovim
   sudo add-apt-repository ppa:neovim-ppa/unstable
   sudo apt update && sudo apt install neovim
   ```

3. **LSP servers not working**:
   ```bash
   # Install language servers
   npm install -g typescript-language-server pyright
   ```

### Debug Mode

Run with debug logging:
```bash
NEOCODE_DEBUG=1 neocode start
```

### Reset Configuration

```bash
neocode reset-config
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Neovim](https://neovim.io/) - The extensible vim-based text editor
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [Catppuccin](https://github.com/catppuccin/nvim) - Soothing pastel theme
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager

## � Documentation

NeoCode comes with comprehensive documentation:

- **[Navigation Guide](docs/Navigation-Guide.md)** - Complete keyboard shortcuts reference (Windows + Vim)
- **[Quick Reference](docs/Quick-Reference.md)** - Printable cheat sheet with top shortcuts
- **[LazyVim Setup Guide](docs/LazyVim-Setup-Guide.md)** - Installation and configuration instructions
- **[Visual Architecture](docs/Visual-Architecture.md)** - Diagrams and visual workflow guides
- **[Implementation Summary](docs/Implementation-Summary.md)** - Technical details and design decisions
- **[VSCode Setup Guide](docs/VSCode-Setup-Guide.md)** - Using NeoCode from VSCode

### Quick Links

| I want to... | Read this... |
|--------------|--------------|
| Learn all shortcuts | [Navigation Guide](docs/Navigation-Guide.md) |
| Get started quickly | [Quick Reference](docs/Quick-Reference.md) |
| Install NeoCode | [LazyVim Setup Guide](docs/LazyVim-Setup-Guide.md) |
| Understand architecture | [Visual Architecture](docs/Visual-Architecture.md) |
| Customize NeoCode | [Implementation Summary](docs/Implementation-Summary.md) |

## �📊 Roadmap

- [x] Core editor functionality
- [x] tmux integration
- [x] LSP support
- [x] Plugin system
- [x] Windows-style keyboard shortcuts
- [x] VSCode-like buffer/tab system
- [x] Comprehensive documentation
- [ ] Desktop GUI version
- [ ] Remote development server
- [ ] Collaborative editing
- [ ] Extension marketplace
- [ ] Video tutorials

---

<div align="center">
  <p>Made with ❤️ by the NeoCode team</p>
  <p>⭐ Star us on GitHub if you find NeoCode useful!</p>
</div>