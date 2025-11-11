# NeoCode API Documentation

This document describes the NeoCode API for plugin developers and advanced users.

## Core Modules

### neocode.core

#### Options (`neocode.core.options`)

Manages Neovim options and editor settings.

```lua
local options = require('neocode.core.options')

-- Get current theme
local theme = vim.g.neocode_theme

-- Set option
vim.opt.number = true
```

#### Keymaps (`neocode.core.keymaps`)

Handles key bindings and shortcuts.

```lua
local keymap = vim.keymap.set

-- Add custom keymap
keymap("n", "<leader>cc", ":NeoCodeCommand<CR>", { desc = "Custom command" })
```

#### Autocmds (`neocode.core.autocmds`)

Manages automatic commands and event handlers.

```lua
local autocmd = vim.api.nvim_create_autocmd

-- Add custom autocmd
autocmd("BufWritePost", {
  pattern = "*.lua",
  callback = function()
    print("Lua file saved!")
  end,
})
```

### neocode.ui

#### Statusline (`neocode.ui.statusline`)

Custom statusline component system.

```lua
local statusline = require('neocode.ui.statusline')

-- Get current mode
local mode = statusline.mode()

-- Custom statusline component
function MyComponent()
  return "Custom: " .. vim.fn.expand("%:t")
end
```

### neocode.plugins

Plugin management and configuration.

```lua
local plugins = require('neocode.plugins')

-- Add custom plugin
table.insert(plugins.plugins, {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup({})
  end,
})
```

## Configuration API

### Settings Schema

```lua
-- Global settings
local settings = {
  editor = {
    theme = "catppuccin-mocha",
    font_size = 14,
    auto_save = true,
  },
  
  ui = {
    statusline = {
      enabled = true,
      components = { "mode", "file", "git" }
    }
  },
  
  lsp = {
    servers = { "lua_ls", "pyright" }
  }
}
```

### Configuration Loading

```lua
-- Load user configuration
local config = require('neocode.config')
local user_settings = config.load()

-- Merge with defaults
local final_config = vim.tbl_deep_extend("force", defaults, user_settings)
```

## Plugin Development

### Plugin Structure

```lua
-- lua/neocode/plugins/my-plugin.lua
local M = {}

function M.setup(opts)
  opts = vim.tbl_extend("force", {
    enabled = true,
    custom_option = "default"
  }, opts or {})
  
  -- Plugin initialization
end

return M
```

### Registering Plugins

```lua
-- Add to lua/neocode/plugins/init.lua
{
  "author/my-plugin",
  dependencies = { "required/dependency" },
  config = function()
    require("neocode.plugins.my-plugin").setup({
      custom_option = "custom_value"
    })
  end,
}
```

## Command API

### Custom Commands

```lua
-- Register custom command
vim.api.nvim_create_user_command('NeoCodeCustom', function(args)
  -- Command implementation
  print("Custom command executed with args:", args.args)
end, {
  nargs = '*',
  desc = 'Custom NeoCode command',
})
```

### Built-in Commands

- `:NeoCodeConfig` - Open configuration
- `:NeoCodeReload` - Reload configuration
- `:NeoCodeToggleTheme` - Toggle theme
- `:NeoCodeStatus` - Show status information
- `:NeoCodeUpdate` - Update plugins

## Event System

### Available Events

```lua
-- Plugin loaded
vim.api.nvim_create_autocmd("User", {
  pattern = "NeoCodePluginLoaded",
  callback = function(args)
    print("Plugin loaded:", args.data.plugin)
  end,
})

-- Theme changed
vim.api.nvim_create_autocmd("User", {
  pattern = "NeoCodeThemeChanged",
  callback = function(args)
    print("Theme changed to:", args.data.theme)
  end,
})
```

### Emitting Events

```lua
-- Emit custom event
vim.api.nvim_exec_autocmds("User", {
  pattern = "NeoCodeCustomEvent",
  data = { custom_data = "value" }
})
```

## Utility Functions

### File Operations

```lua
local utils = require('neocode.utils')

-- Check if file exists
if utils.file_exists("path/to/file") then
  -- File exists
end

-- Read file contents
local contents = utils.read_file("path/to/file")

-- Write file contents
utils.write_file("path/to/file", "contents")
```

### System Information

```lua
-- Get OS type
local os_type = utils.get_os()

-- Check if running in tmux
local in_tmux = utils.in_tmux()

-- Get NeoCode version
local version = utils.get_version()
```

## Theming API

### Custom Themes

```lua
-- themes/my-theme.lua
return {
  name = "my-theme",
  colors = {
    bg = "#1a1a1a",
    fg = "#ffffff",
    accent = "#00ff00",
  },
  
  highlights = {
    Normal = { fg = "fg", bg = "bg" },
    StatusLine = { fg = "bg", bg = "accent" },
  }
}
```

### Theme Management

```lua
local themes = require('neocode.themes')

-- Load theme
themes.load("my-theme")

-- Get current theme
local current = themes.current()

-- List available themes
local available = themes.list()
```

## LSP Integration

### Adding Language Servers

```lua
local lsp = require('neocode.lsp')

-- Add custom server configuration
lsp.add_server("my_ls", {
  cmd = { "my-language-server" },
  filetypes = { "mylang" },
  settings = {
    mylang = {
      enable = true
    }
  }
})
```

### LSP Utilities

```lua
-- Check if LSP is attached
local attached = lsp.is_attached()

-- Get active clients
local clients = lsp.get_clients()

-- Format document
lsp.format()
```

## Testing API

### Test Helpers

```lua
local test = require('neocode.test')

-- Create test buffer
local buf = test.create_buffer("test content")

-- Simulate keypress
test.send_keys("n", "<leader>ff")

-- Assert buffer content
test.assert_buffer_contains(buf, "expected content")
```

## Migration Guide

### From v0.1 to v0.2

```lua
-- Old API (deprecated)
vim.g.neocode_theme = "dark"

-- New API
require('neocode.config').set('ui.theme', 'catppuccin-mocha')
```