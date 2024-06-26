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
      nvim-treesitter.withAllGrammars

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

      # GitHub Copilot
      copilot-vim

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
      nodejs # required for npm package downloads
      unzip # required for unzipping packages downloaded by e.g. Mason

      # Code formatters
      shfmt
      nixpkgs-fmt
      stylua

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
