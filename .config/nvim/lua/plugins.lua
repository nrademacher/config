return require("packer").startup {
    function()
        local use = use

        -- packer self-management
        use "wbthomason/packer.nvim"

        -- themes
        use "junegunn/seoul256.vim"
        use "gruvbox-community/gruvbox"
        use "pgdouyon/vim-yin-yang"

        -- general ui
        use "tjdevries/express_line.nvim"
        use "tamago324/lir.nvim"

        -- git ui
        use "rhysd/git-messenger.vim"
        use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}

        -- syntax
        use "nvim-treesitter/nvim-treesitter"
        use "pantharshit00/vim-prisma"

        -- lsp setup
        use "neovim/nvim-lspconfig"
        use "williamboman/nvim-lsp-installer"
        use "tami5/lspsaga.nvim"
        use {"gfanto/fzf-lsp.nvim", requires = {"junegunn/fzf"}}
        use "onsails/lspkind-nvim"
        use {
            "folke/lsp-trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons"
        }

        -- telescope
        use "nvim-lua/plenary.nvim"
        use "nvim-lua/popup.nvim"
        use {
            "nvim-telescope/telescope.nvim",
            requires = {{"nvim-lua/plenary.nvim"}}
        }
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
        use {"nvim-telescope/telescope-frecency.nvim", requires = {"tami5/sqlite.lua"}}

        -- text manipulation
        use "b3nj5m1n/kommentary"
        use "tpope/vim-surround"
        use "windwp/nvim-autopairs"
        use "windwp/nvim-ts-autotag"

        -- navigation
        use "ThePrimeagen/harpoon"
        use "phaazon/hop.nvim"

        -- autocompletion engine
        use "hrsh7th/nvim-compe"

        -- code snippets
        use "hrsh7th/vim-vsnip"
        use "mattn/emmet-vim"
        use "rafamadriz/friendly-snippets"

        -- formatting
        use "sbdchd/neoformat"

        -- misc utils
        use {
            "tjdevries/sg.nvim",
            commit = "76354e9f0b6de39134ec9efcd022f079ae0ce02b"
        }
        use "tpope/vim-repeat"
        use "AndrewRadev/sideways.vim"
        use "antonk52/bad-practices.nvim"
        use "RRethy/vim-illuminate"
        use "norcalli/nvim-colorizer.lua"
    end,
    config = {
        git = {
            clone_timeout = 120 -- Timeout, in seconds, for git clones
        }
    }
}
