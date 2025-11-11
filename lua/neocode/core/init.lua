-- NeoCode Core Initialization
-- Handles the core setup and module loading

local M = {}

-- Core modules
M.modules = {
  'options',
  'keymaps', 
  'autocmds',
  'commands',
}

-- Initialize core modules
function M.setup()
  for _, module in ipairs(M.modules) do
    local ok, err = pcall(require, 'neocode.core.' .. module)
    if not ok then
      vim.notify('Failed to load core module: ' .. module .. '\n' .. err, vim.log.levels.ERROR)
    end
  end
end

-- Auto-setup on require
M.setup()

return M