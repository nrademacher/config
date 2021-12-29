return require("packer").startup {
  function()
    local use = use

    -- packer self-management
    use "wbthomason/packer.nvim"

    -- themes
    use "gruvbox-community/gruvbox"
    use "folke/tokyonight.nvim"
    use "rebelot/kanagawa.nvim"

    -- UI
    use "tjdevries/express_line.nvim"
    use "tamago324/lir.nvim"
    use 'rhysd/git-messenger.vim'
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- syntax
    use "nvim-treesitter/nvim-treesitter"
    use "pantharshit00/vim-prisma"
    use "chr4/nginx.vim"

    -- lsp setup
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "tami5/lspsaga.nvim"
    use {
      "folke/lsp-trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons"
    }
    use "onsails/lspkind-nvim"

    -- telescope
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-ui-select.nvim"
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope-frecency.nvim", requires = {"tami5/sqlite.lua"} }

    -- text manipulation
    use "b3nj5m1n/kommentary"
    use "tpope/vim-surround"
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"

    -- navigation
    use "ThePrimeagen/harpoon"
    use "phaazon/hop.nvim"

    -- autocompletion
    use "hrsh7th/nvim-compe"

    -- code snippets
    use "hrsh7th/vim-vsnip"
    use "mattn/emmet-vim"
    use "rafamadriz/friendly-snippets"

    -- formatting
    use "mhartington/formatter.nvim"
    use "steelsojka/headwind.nvim"

    -- misc utils
    use "AndrewRadev/sideways.vim"
    use "antonk52/bad-practices.nvim"
    use "norcalli/nvim-colorizer.lua"
  end,
  config = {
    git = {
      clone_timeout = 120 -- Timeout, in seconds, for git clones
    }
  }
}
