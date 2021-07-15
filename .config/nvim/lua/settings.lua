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

--[[ require("github-theme").setup(
  {
    themeStyle = "light"
  }
) ]]
-- o.background = "dark" -- or "light" for light mode

vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_invert_selextion = 0

vim.cmd([[colorscheme gruvbox]])
vim.cmd([[highlight ColorColumn ctermbg=0 guibg=grey]])
vim.cmd([[hi SignColumn guibg=none]])
vim.cmd([[hi CursorLineNR guibg=None]])
vim.cmd([[highlight Normal guibg=none]])
vim.cmd([[highlight LineNr guifg=#5eacd3]])
vim.cmd([[highlight netrwDir guifg=#5eacd3]])
vim.cmd([[highlight qfFileName guifg=#aed75f]])
vim.cmd([[hi TelescopeBorder guifg=#5eacd]])
