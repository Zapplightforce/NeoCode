-- NeoCode Main Configuration
-- Entry point for the NeoCode editor

require('neocode.core.init')
require('neocode.core.options')
require('neocode.core.keymaps')
require('neocode.core.autocmds')
require('neocode.plugins.init')

-- Initialize NeoCode
vim.g.neocode_version = "0.1.0"
print("NeoCode v" .. vim.g.neocode_version .. " initialized")