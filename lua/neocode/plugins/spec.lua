-- NeoCode plugin specification for LazyVim
-- This file shows users how to integrate NeoCode with their LazyVim setup

return {
  -- Main NeoCode plugin
  {
    "Zapplightforce/NeoCode",
    lazy = false, -- Load on startup
    priority = 1000, -- Load early
    config = function()
      require("neocode").setup({
        -- Customize your settings here
        terminal_split = "horizontal", -- or "vertical"
        terminal_size = 30, -- percentage
        
        -- Enable/disable default keymaps
        enable_keymaps = true,
        
        -- Custom keybindings (optional)
        -- keymaps = {
        --   split_vertical = "<leader>tv",
        --   split_horizontal = "<leader>th",
        --   terminal = "<leader>tt",
        --   kill_pane = "<leader>tk",
        --   zoom = "<leader>tz",
        -- },
      })
    end,
  },

  -- Smart navigation between tmux and Neovim
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")
      nvim_tmux_nav.setup({
        disable_when_zoomed = true, -- Don't navigate when tmux pane is zoomed
      })

      -- Override default navigation keys
      vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = "Navigate left (Neovim/tmux)" })
      vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, { desc = "Navigate down (Neovim/tmux)" })
      vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, { desc = "Navigate up (Neovim/tmux)" })
      vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, { desc = "Navigate right (Neovim/tmux)" })
      vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive, { desc = "Navigate to last active (Neovim/tmux)" })
    end,
  },

  -- Advanced tmux integration with Lua API
  {
    "aserowy/tmux.nvim",
    lazy = false,
    config = function()
      require("tmux").setup({
        -- Sync clipboard between Neovim and tmux
        copy_sync = {
          enable = true,
          sync_clipboard = true,
          sync_registers = true,
        },
        
        -- Navigation settings
        navigation = {
          enable_default_keybindings = false, -- We use nvim-tmux-navigation instead
        },
        
        -- Resize settings
        resize = {
          enable_default_keybindings = true,
          resize_step_x = 2,
          resize_step_y = 2,
        },
      })
    end,
  },
}
