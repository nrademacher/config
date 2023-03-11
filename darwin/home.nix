{ pkgs, config, ... }:

{
  imports = [
    ../programs/zsh
    ../programs/starship
    ../programs/git
    ../programs/neovim
    ../programs/kitty
  ];

  home = {
    packages = with pkgs;
      [
        exa
        bat
        gh
        shellcheck
        cmake
        php # Required for Alfred 
        nodejs
        jdk17
        awscli
      ] ++ (with nodePackages; [ aws-cdk pnpm ]);

    stateVersion = "23.05";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
