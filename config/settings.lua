-- NeoCode Configuration Schema
-- JSON schema for NeoCode settings

return {
  -- Editor settings
  editor = {
    theme = "catppuccin-mocha",
    font_size = 14,
    line_numbers = true,
    relative_numbers = true,
    wrap = false,
    tab_size = 2,
    indent_size = 2,
    auto_save = true,
    format_on_save = true,
  },

  -- UI settings
  ui = {
    statusline = {
      enabled = true,
      style = "neocode",
      components = {
        "mode",
        "branch", 
        "filename",
        "filetype",
        "progress",
        "location",
      }
    },
    tabline = {
      enabled = true,
      show_numbers = true,
      show_modified = true,
    },
    sidebar = {
      width = 30,
      auto_close = false,
    },
  },

  -- LSP settings
  lsp = {
    enabled = true,
    auto_install = true,
    servers = {
      "lua_ls",
      "pyright", 
      "tsserver",
      "rust_analyzer",
      "gopls",
      "clangd",
    },
    diagnostics = {
      virtual_text = true,
      signs = true,
      update_in_insert = false,
    }
  },

  -- Keymaps
  keymaps = {
    leader = " ",
    local_leader = ",",
    custom = {
      ["<leader>ff"] = "telescope.find_files",
      ["<leader>fg"] = "telescope.live_grep",
      ["<leader>fb"] = "telescope.buffers",
      ["<leader>e"] = "nvim_tree.toggle",
      ["<leader>gg"] = "lazygit.toggle",
    }
  },

  -- Terminal settings
  terminal = {
    shell = "bash",
    size = {
      horizontal = 15,
      vertical = 40,
    },
    auto_insert = true,
  },

  -- Session settings
  session = {
    auto_save = true,
    auto_restore = true,
    save_winpos = true,
    save_tabpages = true,
  },

  -- Performance settings
  performance = {
    lazy_loading = true,
    startup_time_limit = 100, -- ms
    max_file_size = 1024 * 1024, -- 1MB
  },

  -- Integration settings
  tmux = {
    enabled = true,
    socket = "/tmp/tmux-neocode",
    pane_navigation = true,
    window_titles = true,
  },

  -- Plugin settings
  plugins = {
    auto_update = false,
    lazy_loading = true,
    dev_mode = false,
  }
}