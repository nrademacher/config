{ pkgs, config, ... }:

{
  imports = [ ./zsh/zsh.nix ];

  # Here goes your home-manager config, eg home.packages = [ foo ];
  home.packages = with pkgs;
    [
      nasm
      neovim
      ripgrep
      fzf
      gh
      bat
      jq
      git
      zsh
      zplug
      nixfmt
      shfmt
      shellcheck
      fd
      rustup
      cmake
      php
      nodejs-16_x
      jdk17
      awscli
    ] ++ (with nodePackages; [ aws-cdk pnpm ]);

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.stateVersion = "22.11";
}
