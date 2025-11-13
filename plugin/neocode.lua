-- Minimal NeoCode plugin installation
-- Copy this file to ~/.config/nvim/lua/plugins/neocode.lua

return {
  "Zapplightforce/NeoCode",
  lazy = false,
  config = function()
    require("neocode").setup()
  end,
}
