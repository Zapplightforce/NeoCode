-- NeoCode Auto Commands
-- Event handlers and automatic behaviors

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- NeoCode augroup
local neocode_group = augroup("NeoCode", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  group = neocode_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Auto format on save
autocmd("BufWritePre", {
  group = neocode_group,
  pattern = "*",
  callback = function()
    -- Format code if LSP is available
    if vim.lsp.buf.format then
      vim.lsp.buf.format({ async = false })
    end
  end,
})

-- Restore cursor position
autocmd("BufReadPost", {
  group = neocode_group,
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto create directories
autocmd("BufWritePre", {
  group = neocode_group,
  pattern = "*",
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Terminal settings
autocmd("TermOpen", {
  group = neocode_group,
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})