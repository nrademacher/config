local o = vim.o
local bo = vim.bo
local wo = vim.wo

o.termguicolors = true
o.syntax = "on"
o.errorbells = false
o.smartcase = true
o.showmode = false
bo.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath("config") .. "/undodir"
o.undofile = true
o.incsearch = true
o.hidden = true
o.completeopt = "menuone,noinsert,noselect"
bo.autoindent = true
bo.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
wo.relativenumber = true
wo.signcolumn = "yes"
wo.wrap = false

o.list = true
wo.number = true
wo.numberwidth = 2
o.laststatus = 2

vim.g.gruvbox_contrast_dark = "hard"
vim.cmd([[colorscheme gruvbox]])

vim.cmd([[set noswapfile]])
