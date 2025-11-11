# NeoCode - Custom Terminal-Based Code Editor

## Project Overview
NeoCode is a highly optimized terminal-based code editor that combines the power of Neovim with tmux to deliver a VSCode-like user experience in headless/server environments. The project aims to create a modular, extensible, and performant editor suitable for remote development.

## Architecture
- **Core Engine**: Heavily customized Neovim with Lua-based configuration
- **Session Management**: tmux for window/pane management and terminal multiplexing  
- **Plugin System**: Modular architecture supporting custom extensions
- **Configuration**: YAML/JSON-based settings with hot-reloading
- **Future**: Desktop environment support planned

## Development Guidelines
- Use Lua for Neovim customization and plugin development
- Shell scripts for tmux automation and session management
- Focus on performance optimization and minimal resource usage
- Maintain modularity for easy extension and customization
- Prioritize keyboard-driven workflows and vim-style navigation

## Key Features to Implement
- Integrated file explorer and fuzzy finder
- Multi-pane editing with tmux integration
- Built-in terminal and command palette
- Language server protocol (LSP) support
- Git integration and status display
- Customizable themes and statuslines
- Session persistence and restoration