# 🛠️ Installing NeoCode Configuration for LazyVim

This guide shows you how to integrate NeoCode's VSCode-like experience into your LazyVim setup.

---

## 📋 Prerequisites

1. **LazyVim installed** at `~/.config/nvim`
2. **tmux** installed and configured
3. **Neovim** 0.9.0 or higher

---

## 🚀 Quick Installation

### Step 1: Copy NeoCode Configuration

Copy the NeoCode configuration file to your LazyVim config:

```bash
# From the NeoCode directory
cp config/nvim-neocode.lua ~/.config/nvim/lua/config/neocode.lua
```

### Step 2: Create LazyVim Plugin Configuration

Create a new plugin file to configure bufferline and neo-tree:

```bash
# Create the file
nano ~/.config/nvim/lua/plugins/neocode.lua
```

Add this content:

```lua
-- NeoCode Plugin Configuration for LazyVim
-- This integrates NeoCode's VSCode-like behavior

return {
  -- Configure bufferline to show buffers as tabs
  {
    "akinsho/bufferline.nvim",
    opts = function()
      return require("config.neocode").setup_bufferline()
    end,
  },

  -- Configure neo-tree file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function()
      return require("config.neocode").setup_neotree()
    end,
  },

  -- Disable alpha dashboard on startup (we'll use it as a buffer)
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      -- Keep the dashboard config but don't auto-open
      vim.g.dashboard_disable_at_vimenter = 1
      return dashboard
    end,
  },

  -- Better terminal integration
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-`>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
    },
  },

  -- tmux navigation integration
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
```

### Step 3: Initialize NeoCode Configuration

Edit your LazyVim `init.lua` or create a file at `~/.config/nvim/lua/config/autocmds.lua`:

```lua
-- Auto-load NeoCode configuration
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Initialize NeoCode
    require("config.neocode").setup()
  end,
})
```

### Step 4: Update tmux Configuration

Make sure your tmux configuration includes the NeoCode settings:

```bash
# Copy NeoCode tmux config
cp ~/.config/neocode/tmux.conf ~/.tmux.conf

# Or append to existing config
cat ~/.config/neocode/tmux.conf >> ~/.tmux.conf

# Reload tmux
tmux source ~/.tmux.conf
```

### Step 5: Restart Neovim

Close and reopen Neovim or source the config:

```vim
:source ~/.config/nvim/init.lua
```

---

## 🎯 Verification

Test that everything works:

1. **File Explorer:**
   ```
   Ctrl + B  → Should toggle neo-tree
   ```

2. **Windows Shortcuts:**
   ```
   Ctrl + S  → Should save file
   Ctrl + P  → Should open file finder
   ```

3. **Buffer Navigation:**
   ```
   Ctrl + Tab → Should switch between open files
   ```

4. **tmux Navigation:**
   ```
   Ctrl + H/J/K/L → Should move between panes
   ```

5. **Dashboard:**
   ```
   Space + ud → Should open dashboard as a buffer
   ```

---

## 🔧 Manual Configuration (Alternative)

If you prefer to manually configure each piece:

### Configure Bufferline

Edit `~/.config/nvim/lua/plugins/bufferline.lua`:

```lua
return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      mode = "buffers",  -- Show buffers, not tabs
      separator_style = "thin",
      always_show_bufferline = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        }
      },
    }
  }
}
```

### Configure Neo-tree

Edit `~/.config/nvim/lua/plugins/neo-tree.lua`:

```lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = false,
    window = {
      position = "left",
      width = 30,
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
  }
}
```

### Add Windows Keybindings

Edit `~/.config/nvim/lua/config/keymaps.lua`:

```lua
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File operations
keymap('n', '<C-s>', ':w<CR>', opts)
keymap('n', '<C-w>', ':bd<CR>', opts)
keymap('n', '<C-n>', ':enew<CR>', opts)

-- Editing
keymap('v', '<C-c>', '"+y', opts)
keymap('i', '<C-v>', '<C-r>+', opts)
keymap('n', '<C-z>', 'u', opts)
keymap('n', '<C-y>', '<C-r>', opts)

-- Navigation
keymap('n', '<C-Tab>', ':bnext<CR>', opts)
keymap('n', '<C-S-Tab>', ':bprevious<CR>', opts)

-- Panels
keymap('n', '<C-b>', ':Neotree toggle<CR>', opts)
```

---

## 🎨 Customization

### Changing Colors

The default theme is Catppuccin Mocha. To change:

```lua
-- In ~/.config/nvim/lua/config/lazy.lua
return {
  colorscheme = "your-theme-name",
}
```

### Adjusting File Tree Width

Edit neo-tree width in `~/.config/nvim/lua/plugins/neo-tree.lua`:

```lua
window = {
  width = 40,  -- Change from 30 to 40
}
```

### Customize Bufferline Appearance

Edit `~/.config/nvim/lua/plugins/bufferline.lua`:

```lua
options = {
  tab_size = 20,              -- Width of each tab
  max_name_length = 20,       -- Max filename length
  show_buffer_icons = true,   -- Show file icons
}
```

---

## 🐛 Troubleshooting

### Bufferline Not Showing

**Problem:** Top buffer line doesn't appear.

**Solution:**
```vim
:set showtabline=2
```

Or add to `init.lua`:
```lua
vim.opt.showtabline = 2
```

### Neo-tree Opens Multiple Times

**Problem:** File tree appears in multiple buffers.

**Solution:**
1. Close all neo-tree instances: `:Neotree close`
2. Open once: `Ctrl + B`
3. Files should open in the main area, not in new trees

### Dashboard Still Auto-Opens

**Problem:** LazyVim dashboard shows on startup.

**Solution:**

Add to `~/.config/nvim/lua/config/autocmds.lua`:
```lua
vim.g.dashboard_disable_at_vimenter = 1
```

### Keybindings Conflict

**Problem:** Some shortcuts don't work.

**Solution:**
1. Check for conflicts: `:verbose map <C-s>`
2. If LazyVim has the same binding, remove it or override
3. Your custom keymaps should be in `~/.config/nvim/lua/config/keymaps.lua`

---

## 📚 Next Steps

1. **Read the Navigation Guide:** `docs/Navigation-Guide.md`
2. **Explore LazyVim features:** https://www.lazyvim.org/
3. **Customize your setup:** Edit `~/.config/nvim/lua/config/neocode.lua`
4. **Join the community:** Share your NeoCode configurations!

---

## 🔄 Updating

To update the NeoCode configuration:

```bash
# Pull latest changes
cd ~/Code/NeoCode
git pull

# Copy updated files
cp config/nvim-neocode.lua ~/.config/nvim/lua/config/neocode.lua

# Restart Neovim
```

---

**Enjoy your VSCode-like terminal experience! 🚀**
