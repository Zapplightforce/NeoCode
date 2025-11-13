# NeoCode - LazyVim Edition

<div align="center">
  <h3>🚀 A VSCode-like terminal development environment using LazyVim + tmux</h3>
  <p>Modern, proven Neovim distribution with zero configuration hassle</p>
</div>

## 🎯 Overview

NeoCode combines the power of **LazyVim** (a modern Neovim distribution) with **tmux** to create a VSCode-like development experience in the terminal. Instead of building custom configurations from scratch, we leverage the mature, battle-tested LazyVim ecosystem for reliability and modern features.

## ✨ Features

- **🚀 LazyVim**: Modern Neovim distribution with VSCode-like features
- **🪟 Windows-Style Shortcuts**: Familiar Ctrl+S, Ctrl+C, Ctrl+V, and more
- **📑 Buffer-Based Tabs**: Open files shown as tabs (like VSCode), not Neovim tabs
- **📁 Unified File Explorer**: One shared file tree, not duplicated per tab
- **🎯 Smart Navigation**: Seamless movement between tmux panes and Neovim splits
- **📊 Dashboard as Buffer**: LazyVim menu accessible as a tab, not an overlay
- **🔍 Fuzzy Finding**: Quick file search (Ctrl+P or Space+ff)
- **⚡ Modern LSP**: Language servers, autocompletion, diagnostics
- **🎨 Beautiful UI**: Catppuccin theme with modern statusline and bufferline
- **📊 Split Panes**: tmux integration for terminal workflow
- **🔧 Works Out of the Box**: Optimized configuration included
- **🌟 Extensible**: Easy to add plugins and customizations

## 🚀 Quick Start

### Docker (Recommended)

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