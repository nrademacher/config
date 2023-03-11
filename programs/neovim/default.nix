{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      # Themes
      seoul256-vim

      # Syntax highlighting
      (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))

      # UI
      lualine-nvim
      lir-nvim

      # Navigation
      harpoon
      hop-nvim

      # LSP
      mason-nvim
      mason-lspconfig-nvim
      nvim-lspconfig
      fzf-vim
      fzf-lsp-nvim
      lspkind-nvim
      nvim-web-devicons
      trouble-nvim

      # Telescope
      plenary-nvim
      popup-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      sqlite-lua
      telescope-frecency-nvim

      # Git helpers
      git-messenger-vim
      gitsigns-nvim

      # Text manipulation
      kommentary
      vim-surround
      nvim-autopairs
      nvim-ts-autotag

      # Autocomplete engine
      nvim-compe

      # Code snippets
      vim-vsnip
      emmet-vim
      friendly-snippets

      # Code formatting
      neoformat

      # Misc utils
      vim-repeat
      sideways-vim
      vim-illuminate
      nvim-colorizer-lua
    ];

    extraPackages = with pkgs; [
      nodejs
      tree-sitter

      # Code formatters
      shfmt
      asmfmt
      nixpkgs-fmt

      # Telescope tools
      ripgrep
      fd
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
