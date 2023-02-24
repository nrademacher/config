return require("paq") {
        -- paq self-management
        "savq/paq-nvim";

        -- themes
        "junegunn/seoul256.vim";
        "pgdouyon/vim-yin-yang";
        "pgdouyon/vim-alayas";

        -- general ui
        "tjdevries/express_line.nvim"; -- status line
        "tamago324/lir.nvim"; -- file browser

        -- syntax
        "nvim-treesitter/nvim-treesitter";
        "pantharshit00/vim-prisma";

        -- lsp setup
        "williamboman/mason.nvim";
        "williamboman/mason-lspconfig.nvim";
        "neovim/nvim-lspconfig";
        "tami5/lspsaga.nvim";
        "junegunn/fzf";
        "gfanto/fzf-lsp.nvim";
        "onsails/lspkind-nvim";
        "kyazdani42/nvim-web-devicons";
        "folke/lsp-trouble.nvim";

        -- telescope
        "nvim-lua/plenary.nvim";
        "nvim-lua/popup.nvim";
        "nvim-telescope/telescope.nvim";
        {"nvim-telescope/telescope-fzf-native.nvim", run = "make"};
        "tami5/sqlite.lua";
        "nvim-telescope/telescope-frecency.nvim";

        -- git ui
        "rhysd/git-messenger.vim"; -- view commit messages under cursor
        "lewis6991/gitsigns.nvim";

        -- text manipulation
        "b3nj5m1n/kommentary";
        "tpope/vim-surround";
        "windwp/nvim-autopairs";
        "windwp/nvim-ts-autotag";

        -- navigation
        "ThePrimeagen/harpoon";
        "phaazon/hop.nvim";

        -- autocompletion engine
        "hrsh7th/nvim-compe";

        -- code snippets
        "hrsh7th/vim-vsnip";
        "mattn/emmet-vim";
        "rafamadriz/friendly-snippets";

        -- formatting
        "sbdchd/neoformat";

        -- misc utils
        "tpope/vim-repeat";
        "AndrewRadev/sideways.vim";
        "antonk52/bad-practices.nvim";
        "RRethy/vim-illuminate"; -- highlight uses of a word under the cursor
        "norcalli/nvim-colorizer.lua";
}
