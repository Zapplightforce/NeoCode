-- NeoCode main plugin module
-- Provides tmux integration for LazyVim

local M = {}

-- Default configuration
local default_config = {
  -- Default split direction when opening terminal
  terminal_split = "horizontal", -- or "vertical"
  
  -- Default split size (percentage)
  terminal_size = 30,
  
  -- Enable keymaps
  enable_keymaps = true,
  
  -- Custom keybindings
  keymaps = {
    split_vertical = "<leader>tv",
    split_horizontal = "<leader>th",
    terminal = "<leader>tt",
    kill_pane = "<leader>tk",
    zoom = "<leader>tz",
  },
}

-- Plugin state
M.config = {}
M.tmux = nil

-- Setup function called by LazyVim
function M.setup(opts)
  -- Merge user config with defaults
  M.config = vim.tbl_deep_extend("force", default_config, opts or {})
  
  -- Load tmux module
  M.tmux = require("neocode.core.tmux")
  
  -- Check if we're in tmux
  if not M.tmux.is_tmux() then
    vim.notify(
      "NeoCode: Not running inside tmux. Some features will be unavailable.",
      vim.log.levels.WARN
    )
  end
  
  -- Register commands
  M.register_commands()
  
  -- Set up keymaps if enabled
  if M.config.enable_keymaps then
    M.setup_keymaps()
  end
  
  vim.notify("NeoCode loaded successfully!", vim.log.levels.INFO)
end

-- Register user commands
function M.register_commands()
  -- Split pane command
  vim.api.nvim_create_user_command("NeoCodeSplit", function(opts)
    local direction = opts.args
    if direction == "" or direction == "vertical" then
      M.tmux.split_pane("vertical")
    elseif direction == "horizontal" then
      M.tmux.split_pane("horizontal")
    else
      vim.notify("Usage: :NeoCodeSplit [vertical|horizontal]", vim.log.levels.ERROR)
    end
  end, {
    nargs = "?",
    complete = function()
      return { "vertical", "horizontal" }
    end,
    desc = "Split tmux pane (vertical or horizontal)",
  })
  
  -- Terminal command
  vim.api.nvim_create_user_command("NeoCodeTerminal", function()
    M.tmux.open_terminal(M.config.terminal_split, M.config.terminal_size)
  end, {
    desc = "Open terminal in new tmux pane",
  })
  
  -- Kill pane command
  vim.api.nvim_create_user_command("NeoCodeKillPane", function()
    M.tmux.kill_pane()
  end, {
    desc = "Close current tmux pane",
  })
  
  -- Resize command
  vim.api.nvim_create_user_command("NeoCodeResize", function(opts)
    local args = vim.split(opts.args, " ")
    if #args < 2 then
      vim.notify("Usage: :NeoCodeResize <direction> <amount>", vim.log.levels.ERROR)
      return
    end
    
    local direction = args[1]
    local amount = tonumber(args[2])
    
    if not amount then
      vim.notify("Amount must be a number", vim.log.levels.ERROR)
      return
    end
    
    M.tmux.resize_pane(direction, amount)
  end, {
    nargs = "+",
    complete = function()
      return { "left", "right", "up", "down" }
    end,
    desc = "Resize tmux pane",
  })
  
  -- New window command
  vim.api.nvim_create_user_command("NeoCodeNewWindow", function(opts)
    M.tmux.new_window(opts.args ~= "" and opts.args or nil)
  end, {
    nargs = "?",
    desc = "Create new tmux window",
  })
  
  -- Rename window command
  vim.api.nvim_create_user_command("NeoCodeRenameWindow", function(opts)
    if opts.args == "" then
      vim.notify("Please provide a window name", vim.log.levels.ERROR)
      return
    end
    M.tmux.rename_window(opts.args)
  end, {
    nargs = 1,
    desc = "Rename current tmux window",
  })
  
  -- Zoom toggle command
  vim.api.nvim_create_user_command("NeoCodeZoom", function()
    M.tmux.toggle_zoom()
  end, {
    desc = "Toggle zoom on current tmux pane",
  })
  
  -- Status command
  vim.api.nvim_create_user_command("NeoCodeStatus", function()
    if M.tmux.is_tmux() then
      local session = M.tmux.get_session_name()
      vim.notify("NeoCode: Running in tmux session '" .. (session or "unknown") .. "'", vim.log.levels.INFO)
    else
      vim.notify("NeoCode: Not running in tmux", vim.log.levels.WARN)
    end
  end, {
    desc = "Show NeoCode status",
  })
end

-- Setup keymaps
function M.setup_keymaps()
  local keymaps = M.config.keymaps
  
  -- Split vertical
  vim.keymap.set("n", keymaps.split_vertical, function()
    M.tmux.split_pane("vertical")
  end, { desc = "NeoCode: Split tmux pane vertically" })
  
  -- Split horizontal
  vim.keymap.set("n", keymaps.split_horizontal, function()
    M.tmux.split_pane("horizontal")
  end, { desc = "NeoCode: Split tmux pane horizontally" })
  
  -- Open terminal
  vim.keymap.set("n", keymaps.terminal, function()
    M.tmux.open_terminal(M.config.terminal_split, M.config.terminal_size)
  end, { desc = "NeoCode: Open terminal in tmux pane" })
  
  -- Kill pane
  vim.keymap.set("n", keymaps.kill_pane, function()
    M.tmux.kill_pane()
  end, { desc = "NeoCode: Kill current tmux pane" })
  
  -- Zoom toggle
  vim.keymap.set("n", keymaps.zoom, function()
    M.tmux.toggle_zoom()
  end, { desc = "NeoCode: Toggle zoom on tmux pane" })
end

return M
