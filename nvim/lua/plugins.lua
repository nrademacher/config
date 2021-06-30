return require("packer").startup {
  function()
    local use = use

    use "wbthomason/packer.nvim"

    -- experimental git worktrees integration
    use "ThePrimeagen/git-worktree.nvim"

    -- themes
    use "marko-cerovac/material.nvim"
    use "eddyekofo94/gruvbox-flat.nvim"
    use "shaunsingh/seoul256.nvim"
    use "kyazdani42/blue-moon"

    -- syntax
    use "nvim-treesitter/nvim-treesitter"

    -- UI
    use "tamago324/lir.nvim"
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use "ryanoasis/vim-devicons"

    -- lsp setup
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "onsails/lspkind-nvim"
    use {
      "folke/lsp-trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons"
    }
    use "glepnir/lspsaga.nvim"

    -- telescope setup
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "jremmen/vim-ripgrep"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-fzy-native.nvim"

    -- text manipulation
    use "b3nj5m1n/kommentary"
    use "tpope/vim-surround"
    use "windwp/nvim-autopairs"

    -- navigation
    use "AndrewRadev/sideways.vim"
    use "phaazon/hop.nvim"
    use "ThePrimeagen/harpoon"
    use "karb94/neoscroll.nvim"

    -- autocompletion
    use "hrsh7th/nvim-compe"

    -- code snippets
    use "hrsh7th/vim-vsnip"
    use "rafamadriz/friendly-snippets"
    use "mattn/emmet-vim"

    -- formatting
    use "mhartington/formatter.nvim"
    use "steelsojka/headwind.nvim"

    -- misc utils
    use "norcalli/nvim-colorizer.lua"
    use "antonk52/bad-practices.nvim"
  end,
  config = {
    git = {
      clone_timeout = 120 -- Timeout, in seconds, for git clones
    }
  }
}
