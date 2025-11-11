-- NeoCode Core Options
-- Vim options and editor settings

local opt = vim.opt
local g = vim.g

-- Leader key
g.mapleader = " "
g.maplocalleader = " "

-- Editor options
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.cursorline = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- Search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- File handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.updatetime = 50

-- UI enhancements
opt.termguicolors = true
opt.showmode = false
opt.pumheight = 10
opt.conceallevel = 0
opt.cmdheight = 1

-- Performance
opt.lazyredraw = true
opt.ttyfast = true

-- NeoCode specific settings
g.neocode_theme = "dark"
g.neocode_statusline = true
g.neocode_tabline = true