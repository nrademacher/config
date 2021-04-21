local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

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

  use 'ThePrimeagen/git-worktree.nvim'

  -- themes
  use 'tjdevries/colorbuddy.nvim'
  use 'bkegley/gloombuddy'
  use 'marko-cerovac/material.nvim'
  use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

  -- syntax highlighting
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'

  -- UI
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- lsp package
  use 'neovim/nvim-lspconfig'
  use 'anott03/nvim-lspinstall'
  use 'onsails/lspkind-nvim'

  -- telescope package
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'jremmen/vim-ripgrep'

  -- text manipulation & navigation
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'

  -- navigation
  use 'AndrewRadev/sideways.vim'
  use 'phaazon/hop.nvim'
  use 'ThePrimeagen/harpoon'

  -- utils
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use "rafamadriz/friendly-snippets"
  use {'prettier/vim-prettier', run = 'yarn install' }
  use 'mattn/emmet-vim'
  use 'norcalli/nvim-colorizer.lua'

  use 'ThePrimeagen/vim-be-good'
  end
)

