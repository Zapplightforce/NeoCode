# NeoCode

**A LazyVim plugin bundle that gives you seamless tmux control from Neovim**

NeoCode transforms LazyVim into a unified development environment where you control tmux panes, windows, and sessions directly from Neovim's command line. Think of it as a "modpack for LazyVim" that turns tmux into an extension of your editor.

## ✨ What is NeoCode?

NeoCode is **not** a standalone editor. It's a **plugin bundle** that enhances your existing LazyVim installation with:

- **Unified tmux control** - Manage tmux from Neovim's `:` command line
- **Smart navigation** - Seamlessly move between Neovim splits and tmux panes with `Ctrl+h/j/k/l`
- **Customizable commands** - Configure your own keybindings and commands
- **Extensible architecture** - Built to add more features in the future

## 🚀 Quick Start

### Prerequisites

- **Neovim** >= 0.9.0
- **LazyVim** installed at `~/.config/nvim`
- **tmux** >= 3.0

### Installation

1. **Install LazyVim** (if not already installed):
```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim  # Let it install plugins
```

2. **Add NeoCode plugin**:
```lua
-- In ~/.config/nvim/lua/plugins/neocode.lua
return {
  {
    "Zapplightforce/NeoCode",
    lazy = false,
    config = function()
      require("neocode").setup()
    end,
  },
}
```

3. **Restart Neovim** and run `:Lazy sync`

### Usage

Start tmux, then open Neovim. NeoCode gives you these commands:

| Command | Description |
|---------|-------------|
| `:NeoCodeSplit vertical` | Split tmux pane vertically |
| `:NeoCodeSplit horizontal` | Split tmux pane horizontally |
| `:NeoCodeTerminal` | Open terminal in new tmux pane |
| `:NeoCodeKillPane` | Close current tmux pane |
| `:NeoCodeResize <direction> <amount>` | Resize tmux pane |

Navigate between Neovim and tmux with `Ctrl+h/j/k/l` - it just works!

## 📖 Documentation

- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Plugin structure and how to extend NeoCode
- **[Desk research.txt](Desk%20research.txt)** - Initial research and implementation ideas

## 🛠️ Project Structure

```
neocode/
├── lua/neocode/           # Plugin source code
│   ├── init.lua           # Main plugin entry
│   ├── core/              # Core functionality
│   │   └── tmux.lua       # tmux integration
│   ├── plugins/           # Plugin dependencies specs
│   └── ui/                # UI components (future)
├── config/
│   └── tmux.conf          # Enhanced tmux configuration
├── scripts/
│   └── neocode            # Legacy session manager (will be deprecated)
└── README.md              # This file
```

## 🔧 Configuration

Customize NeoCode in your LazyVim config:

```lua
require("neocode").setup({
  -- Default split direction when opening terminal
  terminal_split = "vertical",  -- or "horizontal"
  
  -- Default split size
  terminal_size = 50,  -- percentage
  
  -- Custom keybindings (optional)
  keymaps = {
    split_vertical = "<leader>tv",
    split_horizontal = "<leader>th",
    terminal = "<leader>tt",
  },
})
```

## 🌟 Roadmap

**Phase 1: Core tmux Integration** ✅ (In Progress)
- [x] Project structure
- [x] Basic tmux command integration
- [ ] Smart navigation (nvim-tmux-navigation)
- [ ] Command-line interface
- [ ] Customizable keybindings

**Phase 2: Enhanced Features** (Planned)
- [ ] Session management from Neovim
- [ ] Git integration commands
- [ ] Project templates
- [ ] Status line integration

**Phase 3: Desktop Edition** (Future)
- [ ] Standalone desktop application
- [ ] GUI mode with embedded terminal

## 🤝 Contributing

Contributions are welcome! NeoCode is designed to be extensible. See [ARCHITECTURE.md](ARCHITECTURE.md) for details on how to add features.

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [LazyVim](https://www.lazyvim.org/) - The foundation
- [nvim-tmux-navigation](https://github.com/alexghergh/nvim-tmux-navigation) - Seamless navigation
- [tmux.nvim](https://github.com/aserowy/tmux.nvim) - tmux Lua bindings

---

<div align="center">
  <p>Made with ❤️ for LazyVim users who love tmux</p>
  <p>⭐ Star this repo if you find it useful!</p>
</div>
