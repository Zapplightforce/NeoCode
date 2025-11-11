-- NeoCode Plugin Manager
-- Handles plugin installation and configuration

local M = {}

-- Plugin specifications
M.plugins = {
  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("neocode.plugins.nvim-tree")
    end,
  },

  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neocode.plugins.telescope")
    end,
  },

  -- LSP Support
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("neocode.plugins.lsp")
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("neocode.plugins.cmp")
    end,
  },

  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("neocode.plugins.treesitter")
    end,
  },

  -- Git Integration
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("neocode.plugins.gitsigns")
    end,
  },

  -- Status Line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("neocode.plugins.lualine")
    end,
  },

  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("neocode.plugins.colorscheme")
    end,
  },
}

-- Initialize plugin manager (lazy.nvim)
function M.setup()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup(M.plugins, {
    install = {
      colorscheme = { "catppuccin" }
    },
    ui = {
      border = "rounded"
    }
  })
end

return M