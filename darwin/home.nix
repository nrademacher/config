{ pkgs, config, ... }:

{
  imports = [ ../zsh ];

  # Here goes your home-manager config, eg home.packages = [ foo ];
  home.packages = with pkgs;
    [
      exa
      ripgrep
      gh
      bat
      jq
      git
      nixfmt
      asmfmt
      shellcheck
      fd
      cmake
      php # Required for Alfred nodejs
      jdk17
      awscli
    ] ++ (with nodePackages; [ aws-cdk pnpm ]);

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = [ pkgs.shfmt ];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.sessionVariables = {
    DOTFILES = "$HOME/dotfiles";
    PROJECTS_DIR = "$HOME/projects";
    VISUAL = "nvim";
    EDITOR = "nvim";
    USE_EDITOR = "$EDITOR";
  };

  home.stateVersion = "22.11";
}
