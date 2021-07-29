return require("packer").startup {
  function()
    local use = use

    -- packer self-management
    use "wbthomason/packer.nvim"

    -- integrations
    use "ThePrimeagen/git-worktree.nvim"
    use "adelarsq/vim-hackernews"
    use "chr4/nginx.vim"

    -- theme
    use "gruvbox-community/gruvbox"

    -- UI
    use "tjdevries/express_line.nvim"
    use "akinsho/nvim-toggleterm.lua"

    -- syntax
    use "nvim-treesitter/nvim-treesitter" -- UI

    -- lsp setup
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "glepnir/lspsaga.nvim"
    use {
      "folke/lsp-trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons"
    }
    use "onsails/lspkind-nvim"

    -- telescope
    use "jremmen/vim-ripgrep"
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-telescope/telescope-fzy-native.nvim"
    use "nvim-telescope/telescope.nvim"

    -- text manipulation
    use "b3nj5m1n/kommentary"
    use "tpope/vim-surround"
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"

    -- navigation
    use "AndrewRadev/sideways.vim"
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
    use "antonk52/bad-practices.nvim"
    use "dstein64/vim-startuptime"
    use "norcalli/nvim-colorizer.lua"
  end,
  config = {
    git = {
      clone_timeout = 120 -- Timeout, in seconds, for git clones
    }
  }
}
