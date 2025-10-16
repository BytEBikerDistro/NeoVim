-- ~/.config/nvim/lua/core/options.lua

local opt = vim.opt
local g = vim.g

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 5
opt.shiftwidth = 5
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Mouse support
opt.mouse = "a"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI
opt.cursorline = true
opt.showmatch = true
opt.wrap = true
opt.linebreak = true
opt.termguicolors = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Other settings
opt.hidden = true
opt.updatetime = 300
opt.shortmess = "filnxtToOFc"

-- Leader key
g.mapleader = " "

-- Enable syntax and filetype
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
