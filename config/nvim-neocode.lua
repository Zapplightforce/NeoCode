-- NeoCode LazyVim Custom Configuration
-- This file should be placed in ~/.config/nvim/lua/config/neocode.lua
-- and sourced from your LazyVim init.lua

local M = {}

-- Disable LazyVim dashboard on startup (we'll use it as a tab instead)
M.setup_dashboard = function()
  -- Prevent dashboard from auto-opening
  vim.g.dashboard_disable_at_vimenter = 1
  
  -- Create a command to open dashboard in current buffer
  vim.api.nvim_create_user_command('Dashboard', function()
    require('alpha').start(true)
  end, {})
end

-- Setup Windows-style keybindings
M.setup_keymaps = function()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  
  -- ============================================
  -- WINDOWS-STYLE KEYBINDINGS
  -- ============================================
  
  -- File Operations
  keymap('n', '<C-s>', ':w<CR>', opts)           -- Ctrl+S: Save
  keymap('i', '<C-s>', '<Esc>:w<CR>a', opts)     -- Ctrl+S: Save (insert mode)
  keymap('n', '<C-S-s>', ':wa<CR>', opts)        -- Ctrl+Shift+S: Save All
  keymap('n', '<C-w>', ':bd<CR>', opts)          -- Ctrl+W: Close buffer
  keymap('n', '<C-S-w>', ':qa<CR>', opts)        -- Ctrl+Shift+W: Close all
  keymap('n', '<C-n>', ':enew<CR>', opts)        -- Ctrl+N: New file
  keymap('n', '<C-o>', ':Telescope find_files<CR>', opts) -- Ctrl+O: Open file
  
  -- Editing
  keymap('v', '<C-c>', '"+y', opts)              -- Ctrl+C: Copy
  keymap('n', '<C-c>', '"+yy', opts)             -- Ctrl+C: Copy line
  keymap('v', '<C-x>', '"+d', opts)              -- Ctrl+X: Cut
  keymap('n', '<C-x>', '"+dd', opts)             -- Ctrl+X: Cut line
  keymap('i', '<C-v>', '<C-r>+', opts)           -- Ctrl+V: Paste (insert mode)
  keymap('n', '<C-v>', '"+p', opts)              -- Ctrl+V: Paste (normal mode)
  keymap('n', '<C-z>', 'u', opts)                -- Ctrl+Z: Undo
  keymap('n', '<C-y>', '<C-r>', opts)            -- Ctrl+Y: Redo
  keymap('n', '<C-a>', 'ggVG', opts)             -- Ctrl+A: Select all
  keymap('i', '<C-a>', '<Esc>ggVG', opts)        -- Ctrl+A: Select all (insert)
  
  -- Search and Replace
  keymap('n', '<C-f>', '/', { noremap = true })  -- Ctrl+F: Find
  keymap('n', '<C-h>', ':%s/', { noremap = true }) -- Ctrl+H: Replace
  keymap('n', '<C-S-f>', ':Telescope live_grep<CR>', opts) -- Ctrl+Shift+F: Find in files
  
  -- Navigation
  keymap('n', '<C-p>', ':Telescope find_files<CR>', opts) -- Ctrl+P: Quick Open
  keymap('n', '<C-Tab>', ':bnext<CR>', opts)     -- Ctrl+Tab: Next buffer
  keymap('n', '<C-S-Tab>', ':bprevious<CR>', opts) -- Ctrl+Shift+Tab: Previous buffer
  keymap('n', '<C-PageDown>', ':bnext<CR>', opts)
  keymap('n', '<C-PageUp>', ':bprevious<CR>', opts)
  
  -- Panels and Views
  keymap('n', '<C-b>', ':Neotree toggle<CR>', opts) -- Ctrl+B: Toggle sidebar
  keymap('n', '<C-S-e>', ':Neotree toggle<CR>', opts) -- Ctrl+Shift+E: Explorer
  keymap('n', '<C-`>', ':ToggleTerm<CR>', opts)  -- Ctrl+`: Toggle terminal
  
  -- Comments (using LazyVim's comment plugin)
  keymap('n', '<C-/>', 'gcc', { remap = true })  -- Ctrl+/: Toggle comment
  keymap('v', '<C-/>', 'gc', { remap = true })   -- Ctrl+/: Toggle comment (visual)
  
  -- Line manipulation
  keymap('n', '<A-Up>', ':m .-2<CR>==', opts)    -- Alt+Up: Move line up
  keymap('n', '<A-Down>', ':m .+1<CR>==', opts)  -- Alt+Down: Move line down
  keymap('v', '<A-Up>', ":m '<-2<CR>gv=gv", opts)
  keymap('v', '<A-Down>', ":m '>+1<CR>gv=gv", opts)
  keymap('n', '<C-d>', 'yyp', opts)              -- Ctrl+D: Duplicate line
  
  -- Multi-cursor simulation (using visual block mode)
  keymap('n', '<C-S-l>', '<C-v>j', opts)         -- Ctrl+Shift+L: Add cursor below
  
  -- Zoom
  keymap('n', '<C-=>', ':lua vim.g.gui_font_size = (vim.g.gui_font_size or 12) + 1<CR>', opts)
  keymap('n', '<C-->', ':lua vim.g.gui_font_size = math.max((vim.g.gui_font_size or 12) - 1, 6)<CR>', opts)
  
  -- Go to definition (LSP)
  keymap('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  keymap('n', '<C-F12>', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  keymap('n', '<S-F12>', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  
  -- Command Palette
  keymap('n', '<C-S-p>', ':Telescope commands<CR>', opts)
  
  -- ============================================
  -- CUSTOM NEOCODE COMMANDS
  -- ============================================
  
  -- Open Dashboard in new buffer
  keymap('n', '<leader>ud', ':Dashboard<CR>', opts)
  
  -- Buffer management (like VSCode tabs)
  keymap('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
  keymap('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
  keymap('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
  keymap('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', opts)
  keymap('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', opts)
  keymap('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', opts)
  keymap('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', opts)
  keymap('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', opts)
  keymap('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', opts)
end

-- Setup UI to be VSCode-like
M.setup_ui = function()
  -- Show buffers as tabs in the tabline
  vim.opt.showtabline = 2  -- Always show tabline
  
  -- Disable neovim tabs (we use tmux windows instead)
  -- Buffers will act as "tabs"
  
  -- Setup neo-tree to only show in one pane
  vim.g.neo_tree_remove_legacy_commands = 1
  
  -- Ensure file explorer doesn't open on startup
  vim.g.neo_tree_auto_open = 0
end

-- Setup buffer line to look like VSCode tabs
M.setup_bufferline = function()
  -- This will be called from LazyVim plugin config
  return {
    options = {
      mode = "buffers", -- Show buffers, not tabs
      numbers = "none",
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      indicator = {
        icon = '▎',
        style = 'icon',
      },
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 15,
      tab_size = 18,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        }
      },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      sort_by = 'insert_after_current',
    }
  }
end

-- Setup neo-tree configuration
M.setup_neotree = function()
  return {
    close_if_last_window = false, -- Don't close if it's the last window
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        default = "",
      },
      git_status = {
        symbols = {
          added     = "",
          modified  = "",
          deleted   = "✖",
          renamed   = "",
          untracked = "",
          ignored   = "",
          unstaged  = "",
          staged    = "",
          conflict  = "",
        }
      },
    },
    window = {
      position = "left",
      width = 30,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<space>"] = "none",
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["<esc>"] = "revert_preview",
        ["P"] = { "toggle_preview", config = { use_float = true } },
        ["l"] = "focus_preview",
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        ["t"] = "open_tabnew",
        ["C"] = "close_node",
        ["z"] = "close_all_nodes",
        ["a"] = {
          "add",
          config = {
            show_path = "none"
          }
        },
        ["A"] = "add_directory",
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy",
        ["m"] = "move",
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
      }
    },
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
        hide_by_name = {
          ".git",
          "node_modules"
        },
        never_show = {
          ".DS_Store",
        },
      },
      follow_current_file = {
        enabled = true,
      },
      group_empty_dirs = false,
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
    },
  }
end

-- Initialize everything
M.setup = function()
  M.setup_ui()
  M.setup_keymaps()
  M.setup_dashboard()
end

return M
