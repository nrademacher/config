local o=vim.o
local bo=vim.bo
local wo=vim.wo

o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false
bo.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = true
o.incsearch = true
o.hidden = true
o.completeopt='menuone,noinsert,noselect'
bo.autoindent = true
bo.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
wo.relativenumber = true
wo.signcolumn = 'yes'
wo.wrap = false

o.list = true
wo.number = true
wo.numberwidth = 2
o.laststatus = 2

-- vim.o.background = "dark"
--[[ vim.g['gruvbox_transparent_bg'] = '1'
vim.g['gruvbox_contrast_dark'] = 'hard' ]]


vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = true

vim.g.material_style = "palenight"
vim.g.material_disable_background = true
require('material').set()

vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- vim.cmd([[colorscheme tokyonight]])
vim.cmd[[highlight normal guibg=none]]
vim.cmd[[hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow]]
vim.cmd[[hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE]]

