# NeoCode - LazyVim Edition

<div align="center">
  <h3>🚀 A VSCode-like terminal development environment using LazyVim + tmux</h3>
  <p>Modern, proven Neovim distribution with zero configuration hassle</p>
</div>

## 🎯 Overview

NeoCode combines the power of **LazyVim** (a modern Neovim distribution) with **tmux** to create a VSCode-like development experience in the terminal. Instead of building custom configurations from scratch, we leverage the mature, battle-tested LazyVim ecosystem for reliability and modern features.

## ✨ Features

- **🚀 LazyVim**: Modern Neovim distribution with VSCode-like features
- **📁 File Explorer**: Always-visible file tree (Space + e)
- **� Fuzzy Finding**: Quick file search (Space + ff)
- **⚡ Modern LSP**: Language servers, autocompletion, diagnostics
- **� Beautiful UI**: Modern themes and statusline
- **� Split Panes**: tmux integration for terminal workflow
- **� Zero Config**: Works perfectly out of the box
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

#### General
- `<Space>` - Leader key
- `<C-h/j/k/l>` - Navigate between panes
- `<C-\>` - Toggle terminal
- `<leader>w` - Save file
- `<leader>q` - Quit

#### File Operations
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Browse buffers
- `<leader>e` - Toggle file explorer

#### Editor
- `<S-h/l>` - Navigate buffers
- `<leader>bd` - Delete buffer
- `<A-j/k>` - Move lines up/down

#### NeoCode Specific
- `<leader>nc` - Open NeoCode config
- `<leader>nr` - Reload configuration
- `<leader>nt` - Toggle theme

### Session Management

NeoCode creates organized tmux sessions with predefined layouts:

- **Window 1 (Editor)**: Main Neovim instance
- **Window 2 (Terminal)**: Command line interface
- **Window 3 (Git)**: Git operations and status

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

## 📊 Roadmap

- [x] Core editor functionality
- [x] tmux integration
- [x] LSP support
- [x] Plugin system
- [ ] Desktop GUI version
- [ ] Remote development server
- [ ] Collaborative editing
- [ ] Extension marketplace

---

<div align="center">
  <p>Made with ❤️ by the NeoCode team</p>
  <p>⭐ Star us on GitHub if you find NeoCode useful!</p>
</div>