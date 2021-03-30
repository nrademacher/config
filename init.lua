local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

--------------- PLUGINS START ---------------
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

packer.startup(function()
  local use = use

  use 'kassio/neoterm'

  -- theme
  use 'tjdevries/colorbuddy.nvim'
  use 'bkegley/gloombuddy'

  -- syntax highlighting
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'

  -- UI
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use 'tjdevries/express_line.nvim'
  use 'kyazdani42/nvim-tree.lua'

  -- lsp package
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'

  -- telescope package
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
  use 'jremmen/vim-ripgrep'

  -- text manipulation & navigation
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'
  use 'AndrewRadev/sideways.vim'
  use 'phaazon/hop.nvim'

  -- utils
  use 'hrsh7th/nvim-compe'
  use 'SirVer/ultisnips' -- Snippet Engine
  use 'honza/vim-snippets' -- Snippets (Premade snippet files)
  use {'prettier/vim-prettier', run = 'yarn install' }
  use 'mattn/emmet-vim'
  use 'norcalli/nvim-colorizer.lua'

  use 'ThePrimeagen/vim-be-good'
  end
)
---------------- PLUGINS END ----------------

---------------- GENERAL SETTINGS START ----------------
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

vim.cmd[[colorscheme gloombuddy]]
vim.cmd[[highlight normal guibg=none]]
vim.cmd[[hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow]]
vim.cmd[[hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE]]
---------------- GENERAL SETTINGS END ----------------

---------------- MAPPINGS START ----------------
vim.g.mapleader = ' '
vim.g.user_emmet_leader_key = ','

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.cmd[[inoremap <silent><expr> <C-Space> compe#complete()]]
vim.cmd[[inoremap <silent><expr> <C-y>      compe#confirm('<CR>') ]]
vim.cmd[[inoremap <silent><expr> <C-e>     compe#close('<C-e>') ]]
vim.cmd[[inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 }) ]]
vim.cmd[[inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 }) ]]

local map = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

map('n', '<leader>.', ':PrettierAsync<CR>')

-- lspsaga
map('n', '<leader>ca', ':Lspsaga code_action<CR>')
map('v', '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>')
map('n', '<leader>gh', ':Lspsaga lsp_finder<CR>') -- find the cursor word definition and reference
map('n', '<leader>gk', ':Lspsaga hover_doc<CR>')
map('n', '<leader>gs', ':Lspsaga signature_help<CR>')
map('n', '<leader>gr', ':Lspsaga rename<CR>')
map('n', '<leader>gd', ':Lspsaga preview_definition<CR>')
map('n', '[e', ':Lspsaga diagnostic_jump_next<CR>')
map('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>')

-- unmap arrow keys
map('n', '<up>', '<nop>')
map('i', '<up>', '<nop>')
map('n', '<down>', '<nop>')
map('i', '<down>', '<nop>')
map('n', '<left>', '<nop>')
map('i', '<left>', '<nop>')
map('n', '<right>', '<nop>')
map('i', '<right>', '<nop>')

-- movement in insert mode
map('i', '<C-h>', '<C-o>h')
map('i', '<C-l>', '<C-o>a')
map('i', '<C-j>', '<C-o>j')
map('i', '<C-k>', '<C-o>k')
map('i', '<C-^>', '<C-o><C-^>')

-- telescope
map('n', '<leader>s', ':lua require"telescope.builtin".find_files({hidden = true})<CR>')
map('n', '<leader>f', ':lua require"telescope.builtin".live_grep()<CR>')
map('n', '<leader>b', ':lua require"telescope.builtin".buffers()<CR>')
map('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')

-- nvimtree
map('n', '<C-n>', ':NvimTreeToggle<CR>')
map('n', '<leader>r', ':NvimTreeRefresh<CR>')
map('n', '<leader>n', ':NvimTreeFindFile<CR>')

-- buffer management
map('n', 'm', ':BufferLinePick<CR>')
map('n', '<leader>x', ':bd<CR>')
map('n', '<leader>xx', ':%bd<CR>')

-- quicker saving and quitting
map('n', '<leader>w', ':update<cr>')
map('i', '<C-q>', '<esc>:q<cr>')
map('n', '<C-q>', ':q<cr>')
map('v', '<C-q>', '<esc>')
map('n', '<leader>q', ':q<cr>')
map('n', '<leader>Q', ':qa!<cr>')

-- moving lines up and down
map('n', '<leader>j', ':move+<cr>')
map('n', '<leader>k', ':move-2<cr>')

-- moving props sideways
map('n', '<leader>h', ':SidewaysLeft<cr>')
map('n', '<leader>l', ':SidewaysRight<cr>')
map('n', '<c-h>', ':SidewaysJumpRight<cr>')
map('n', '<c-l>', ':SidewaysJumpLeft<cr>')

-- hopping around
map('n', '<leader>hw', ':HopWord<cr>')
map('n', '<leader>hp', ':HopPattern<cr>')
map('n', '<leader>hc', ':HopChar1<cr>')
map('n', '<leader>h2c', ':HopChar2<cr>')
map('n', '<leader>hl', ':HopLine<cr>')

-- Open new line below and above current line
map('n', '<leader>o', 'o<esc>')
map('n', '<leader>O', 'O<esc>')

-- terminal shortcuts
map('n', '<ESC>', ':Topen<cr><c-w>wi') -- in normal mode, open term and switch to it in insert mode
map('t', '<ESC>', '<C-\\><C-n> :Ttoggle<cr>') -- from term in insert mode, exit insert mode and switch back

-- Copy/pasting from/to system clipboard
map('n', '<leader>y', '"*y')
map('n', '<leader>p', '"*p')
map('n', '<leader>Y', '"+y')
map('n', '<leader>P', '"+p')
---------------- MAPPINGS END ----------------

---------------- PLUGINS SETUP/CONFIG START ----------------
vim.g.neoterm_default_mod = ":botright"

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  }
}

local telescope = require 'telescope'
local telescope_actions = require 'telescope.actions'
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-k>'] = telescope_actions.move_selection_previous,
        ['<C-j>'] = telescope_actions.move_selection_next
      }
    }
  }
}

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = false;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

require'nvim-autopairs'.setup()
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils= {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      vim.fn["compe#confirm"]()
      return npairs.esc("<c-y>")
    else
      vim.defer_fn(function()
        vim.fn["compe#confirm"]("<cr>")
      end, 20)
      return npairs.esc("<c-n>")
    end
  else
    return npairs.check_break_line_char()
  end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

require'colorizer'.setup{
  css = { css = true; }
}
require'bufferline'.setup{
  options = {
    show_buffer_close_icons = false,
    show_close_icon = false,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      return " " .. icon .. count
    end,
    custom_filter = function(buf_number)
      if vim.bo[buf_number].filetype ~= "neoterm" then
        return true
      end
    end,
    separator_style = { '', '' },
    always_show_bufferline = false
  }
}

require'el'.setup{}
require'lspsaga'.init_lsp_saga()
require'lspkind'.init()

local function setup_diagnostics()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = true,
      signs = true,
      update_in_insert = true,
    }
  )
end
-- add setup_diagnostics() to our custom_on_attach

local lspconfig = require'lspconfig'
local function custom_on_attach(client)
  print('Attaching to ' .. client.name)
  setup_diagnostics()
end
local default_config = {
  on_attach = custom_on_attach,
}

-- setup language servers here
lspconfig.tsserver.setup(default_config)
lspconfig.html.setup({})
lspconfig.cssls.setup({})
lspconfig.jsonls.setup({})

---------------- PLUGINS SETUP/CONFIG END ----------------

