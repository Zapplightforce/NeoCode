-- NeoCode Status Line
-- Custom status line component

local M = {}

-- Status line colors (Catppuccin Mocha)
local colors = {
  bg = "#1e1e2e",
  fg = "#cdd6f4", 
  yellow = "#f9e2af",
  cyan = "#89dceb",
  darkblue = "#081633",
  green = "#a6e3a1",
  orange = "#fab387",
  violet = "#cba6f7",
  magenta = "#f5c2e7",
  blue = "#89b4fa",
  red = "#f38ba8",
}

-- Get current mode
function M.mode()
  local modes = {
    n = "NORMAL",
    i = "INSERT", 
    v = "VISUAL",
    V = "V-LINE",
    c = "COMMAND",
    s = "SELECT",
    S = "S-LINE",
    t = "TERMINAL",
    r = "REPLACE",
    R = "V-REPLACE",
  }
  
  local mode = vim.fn.mode()
  return modes[mode] or mode:upper()
end

-- Get mode highlight
function M.mode_hl()
  local mode = vim.fn.mode()
  local mode_colors = {
    n = colors.blue,
    i = colors.green,
    v = colors.violet,
    V = colors.violet,
    c = colors.yellow,
    s = colors.orange,
    S = colors.orange,
    t = colors.red,
    r = colors.magenta,
    R = colors.magenta,
  }
  
  return { fg = colors.bg, bg = mode_colors[mode] or colors.blue }
end

-- Get git branch
function M.git_branch()
  local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
  if vim.v.shell_error ~= 0 then
    return ""
  end
  return string.len(branch) > 0 and "  " .. branch or ""
end

-- Get file info
function M.file_info()
  local filename = vim.fn.expand("%:t")
  if filename == "" then
    filename = "[No Name]"
  end
  
  local modified = vim.bo.modified and " ●" or ""
  local readonly = vim.bo.readonly and " " or ""
  
  return filename .. modified .. readonly
end

-- Get file type
function M.filetype()
  local ft = vim.bo.filetype
  return string.len(ft) > 0 and ft or "text"
end

-- Get LSP status
function M.lsp_status()
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return "No LSP"
  end
  
  local client_names = {}
  for _, client in pairs(clients) do
    table.insert(client_names, client.name)
  end
  
  return " LSP: " .. table.concat(client_names, ", ")
end

-- Get diagnostics count
function M.diagnostics()
  local diagnostics = vim.diagnostic.get(0)
  local count = { error = 0, warn = 0, info = 0, hint = 0 }
  
  for _, diagnostic in pairs(diagnostics) do
    if diagnostic.severity == vim.diagnostic.severity.ERROR then
      count.error = count.error + 1
    elseif diagnostic.severity == vim.diagnostic.severity.WARN then
      count.warn = count.warn + 1
    elseif diagnostic.severity == vim.diagnostic.severity.INFO then
      count.info = count.info + 1
    elseif diagnostic.severity == vim.diagnostic.severity.HINT then
      count.hint = count.hint + 1
    end
  end
  
  local parts = {}
  if count.error > 0 then
    table.insert(parts, " " .. count.error)
  end
  if count.warn > 0 then
    table.insert(parts, " " .. count.warn)
  end
  
  return table.concat(parts, " ")
end

-- Get cursor position
function M.location()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  local total_lines = vim.fn.line("$")
  return string.format("%d:%d/%d", line, col, total_lines)
end

-- Get progress percentage
function M.progress()
  local line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local percentage = math.floor((line / total_lines) * 100)
  return percentage .. "%%"
end

-- Build status line
function M.build()
  local components = {
    -- Left side
    string.format("%%#StatusLineMode#%s%%*", " " .. M.mode() .. " "),
    "%#StatusLine#",
    M.git_branch(),
    " ",
    M.file_info(),
    "%=", -- Right align
    
    -- Right side
    M.diagnostics(),
    " ",
    M.lsp_status(), 
    " ",
    M.filetype(),
    " ",
    M.location(),
    " ",
    string.format("%%#StatusLineProgress#%s%%*", " " .. M.progress() .. " "),
  }
  
  return table.concat(components, "")
end

-- Setup status line
function M.setup()
  -- Set custom status line
  vim.opt.statusline = "%{v:lua.require('neocode.ui.statusline').build()}"
  
  -- Create highlight groups
  local mode_hl = M.mode_hl()
  vim.api.nvim_set_hl(0, "StatusLineMode", mode_hl)
  vim.api.nvim_set_hl(0, "StatusLineProgress", { fg = colors.bg, bg = colors.cyan })
  vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.fg, bg = colors.bg })
  
  -- Update highlights on mode change
  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*",
    callback = function()
      local mode_hl = M.mode_hl()
      vim.api.nvim_set_hl(0, "StatusLineMode", mode_hl)
    end,
  })
end

return M