{ pkgs, config, ... }:

{
  imports = [
    ../../programs/zsh
    ../../programs/starship
    ../../programs/git
    ../../programs/neovim
    ../../programs/kitty
  ];

  home = {
    packages = with pkgs;
      [
        eza
        bat
        gh
        shellcheck
        cmake
        php # Required for Alfred 
        nodejs
        jdk17
        awscli
      ] ++ (with nodePackages; [ aws-cdk pnpm ]);

    file.".hammerspoon" =
      {
        source = ./.hammerspoon;
        recursive = true;
      };

    stateVersion = "23.05";
  };

  xdg.configFile.karabiner = {
    source = ./.config/karabiner;
    recursive = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
