# NeoCode# NeoCode - LazyVim + tmux in Docker



**LazyVim + tmux in Docker. Simple.****Simple. Clean. Just LazyVim.**



## What This Is## What This Is



Stock LazyVim running in tmux. No custom configs, no bullshit.- **LazyVim**: Stock configuration from https://www.lazyvim.org/

- **tmux**: For window management

## Quick Start- **Docker**: So it runs anywhere



```bashThat's it. No custom configs, no bullshit.

# Build and start

docker-compose up -d## ✨ Features



# Enter container  - **🚀 LazyVim**: Modern Neovim distribution with VSCode-like features

docker-compose exec neocode bash- **🪟 Windows-Style Shortcuts**: Familiar Ctrl+S, Ctrl+C, Ctrl+V, and more

- **📑 Buffer-Based Tabs**: Open files shown as tabs (like VSCode), not Neovim tabs

# Start LazyVim- **📁 Unified File Explorer**: One shared file tree, not duplicated per tab

nvim- **🎯 Smart Navigation**: Seamless movement between tmux panes and Neovim splits

```- **📊 Dashboard as Buffer**: LazyVim menu accessible as a tab, not an overlay

- **🔍 Fuzzy Finding**: Quick file search (Ctrl+P or Space+ff)

## What You Get- **⚡ Modern LSP**: Language servers, autocompletion, diagnostics

- **🎨 Beautiful UI**: Catppuccin theme with modern statusline and bufferline

✅ LazyVim (from https://www.lazyvim.org/)  - **📊 Split Panes**: tmux integration for terminal workflow

✅ File explorer (`Space + e`)  - **🔧 Works Out of the Box**: Optimized configuration included

✅ Fuzzy finder (`Space + Space`)  - **🌟 Extensible**: Easy to add plugins and customizations

✅ LSP, auto-complete, syntax highlighting  

✅ Terminal (`Ctrl + /`)  ## 🚀 Quick Start

✅ Git integration  

### 🐛 Dashboard Overlay Issue?

## Key Shortcuts

**If you're seeing the LazyVim dashboard covering your entire screen:**

| Key | Action |- **Using Docker?** → **[Docker Debug Guide](DOCKER_DEBUG.md)** ← Start here!

|-----|--------|- **Linux/macOS install?** → [Quick Fix Guide](QUICKFIX.md)

| `Space` | Leader key |

| `Space + e` | File explorer |### Automated Installation (Linux/macOS/WSL)

| `Space + Space` | Find files |

| `Ctrl + /` | Terminal |```bash

# Clone the repository

[Full shortcuts](https://www.lazyvim.org/keymaps)git clone https://github.com/Zapplightforce/NeoCode.git

cd NeoCode

## Customization

# Run the installer

LazyVim is already configured. To customize:chmod +x INSTALL.sh

./INSTALL.sh

https://www.lazyvim.org/configuration/general```



## License### Manual Installation



MIT```bash

# Copy configuration files
cp config/nvim-neocode.lua ~/.config/nvim/lua/config/neocode.lua
cp config/plugins/neocode.lua ~/.config/nvim/lua/plugins/neocode.lua
cp config/autocmds.lua ~/.config/nvim/lua/config/autocmds.lua

# Restart Neovim
nvim
```

### Docker (Alternative)

```bash
# Build the container
docker build -t neocode .

# Run NeoCode
docker run -it --rm -v ${PWD}:/workspace neocode

# Inside container, start NeoCode
neocode start
```

## 📖 Usage

### Starting a Session

```bash
# Start in current directory
neocode start

# Start in specific directory  
neocode start /path/to/project

# Attach to existing session
neocode attach

# List all sessions
neocode list
```

### Key Bindings

**📖 See the complete [Navigation Guide](docs/Navigation-Guide.md) for all shortcuts!**

#### Windows-Style Shortcuts (Familiar!)

- `Ctrl + S` - Save file
- `Ctrl + W` - Close buffer/tab
- `Ctrl + C` - Copy (line or selection)
- `Ctrl + V` - Paste
- `Ctrl + X` - Cut
- `Ctrl + Z` - Undo
- `Ctrl + Y` - Redo
- `Ctrl + F` - Find in file
- `Ctrl + H` - Find and replace
- `Ctrl + P` - Quick open file
- `Ctrl + Shift + F` - Find in all files
- `Ctrl + B` - Toggle file explorer
- `Ctrl + Tab` - Next buffer/tab
- `Ctrl + /` - Toggle comment

#### File Operations (LazyVim Style)

- `<Space>` - Leader key
- `<Space> + ff` - Find files (Telescope)
- `<Space> + fg` - Live grep (search in files)
- `<Space> + fb` - Browse buffers
- `<Space> + e` - Toggle file explorer
- `<Space> + ud` - Open dashboard (as a tab)

#### Navigation

- `Ctrl + H/J/K/L` - Navigate between tmux panes AND Neovim splits
- `Alt + Arrow Keys` - Alternative pane navigation
- `F12` - Go to definition (LSP)
- `Ctrl + F12` - Go to implementation
- `Shift + F12` - Find references

#### tmux Window Management

- `Ctrl + A` then `|` - Split vertically
- `Ctrl + A` then `-` - Split horizontally  
- `Ctrl + A` then `Z` - Zoom current pane
- `Ctrl + Left/Right` - Switch tmux windows
- `Ctrl + Shift + Left/Right/Up/Down` - Resize panes

### Session Management

NeoCode creates organized tmux sessions with an optimized layout:

#### Architecture

```
┌────────────────────────────────────────────────────────┐
│ tmux Window 1: "NeoCode" (Main Workspace)             │
│ ┌──────────┬───────────────────────────────────────┐  │
│ │          │ Bufferline (VSCode-like file tabs)    │  │
│ │  Neo-    │ ┌──────────────────────────────────┐  │  │
│ │  Tree    │ │                                  │  │  │
│ │          │ │   Editor Area (Current Buffer)   │  │  │
│ │  File    │ │                                  │  │  │
│ │  Explorer│ └──────────────────────────────────┘  │  │
│ │          ├──────────────────┬──────────────────┤  │
│ │  (Shared)│   Terminal Pane   │    Git Pane     │  │
│ └──────────┴──────────────────┴──────────────────┘  │
│                                                        │
│ tmux Window 2+: Additional workspaces as needed       │
└────────────────────────────────────────────────────────┘
```

#### Key Concepts

- **tmux Windows** = Separate workspaces (shown in bottom status bar)
- **Neovim Buffers** = Open files (shown in top bufferline as "tabs")
- **One File Tree** = Shared file explorer in left pane
- **No Neovim Tabs** = We use buffers instead for VSCode-like experience
- **Dashboard as Buffer** = LazyVim menu opens as a tab, not an overlay

## ⚙️ Configuration

### Global Settings

Edit `~/.config/neocode/settings.lua` for global configuration:

```lua
-- Example configuration
editor = {
  theme = "catppuccin-mocha",
  font_size = 14,
  auto_save = true,
}

lsp = {
  servers = { "lua_ls", "pyright", "tsserver" }
}
```

### Project-Specific Settings

Create `.neocode.yaml` in your project root:

```yaml
editor:
  tab_size: 4
  format_on_save: true

lsp:
  servers:
    - pyright
    - ruff_lsp
```

### Custom Themes

Create custom themes in `themes/` directory:

```lua
-- themes/my-theme.lua
return {
  bg = "#1a1a1a",
  fg = "#ffffff",
  -- ... more colors
}
```

## 🔌 Plugin System

NeoCode uses lazy.nvim for plugin management. Add plugins in `lua/neocode/plugins/`:

```lua
-- Example plugin configuration
{
  "your-username/awesome-plugin",
  config = function()
    require("awesome-plugin").setup()
  end,
}
```

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