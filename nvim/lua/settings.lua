local vim = vim
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

vim.g.material_style = "palenight"
vim.g.material_disable_background = true
-- require("material").set()

vim.g.seoul256_italic_comments = true
vim.g.seoul256_italic_keywords = true
vim.g.seoul256_italic_functions = true
vim.g.seoul256_italic_variables = false
vim.g.seoul256_contrast = true
vim.g.seoul256_borders = false
vim.g.seoul256_disable_background = false
-- require('seoul256').set()

vim.g["seoul256_background"] = 234

vim.cmd [[colorscheme gruvbox]]
vim.cmd [[highlight normal guibg=none]]
vim.cmd [[hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow]]
vim.cmd [[hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE]]
