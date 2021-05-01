local vim = vim

return require('packer').startup(function()
  local use = use

  use 'wbthomason/packer.nvim'

  -- experimental git worktrees integration
  use 'ThePrimeagen/git-worktree.nvim'

  -- themes
  use 'marko-cerovac/material.nvim'
  use 'cxxiii/tokyonight.nvim'

  -- syntax
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'

  -- UI
  use 'tamago324/lir.nvim'
  use {
  'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'ryanoasis/vim-devicons'

  -- lsp package
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'onsails/lspkind-nvim'
  use {
  "folke/lsp-trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  }
  use 'glepnir/lspsaga.nvim'

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

  -- autocomplete
  use 'hrsh7th/nvim-compe'

  -- code snippts
  use 'hrsh7th/vim-vsnip'
  use "rafamadriz/friendly-snippets"

  -- misc utils
  use {'prettier/vim-prettier', run = 'yarn install' }
  use 'mattn/emmet-vim'
  use 'norcalli/nvim-colorizer.lua'

  use 'ThePrimeagen/vim-be-good'
  end
)

