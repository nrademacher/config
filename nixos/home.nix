{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    ../programs/zsh
    ../programs/starship
    ../programs/git
    ../programs/i3
    ../programs/kitty
    ../programs/neovim
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "nrademacher";
    homeDirectory = "/home/nrademacher";

    packages = with pkgs;
      [
        # Core utils
        bat
        exa

        # Web browser
        brave

        # Misc
        xclip
        gh
        shellcheck
        cmake

        # Media/Entertainment
        spotify
      ];

    sessionVariables = {
      BROWSER = "brave";
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.05";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Enable Xorg; disable if using Wayland
  xsession.enable = true;

  # Wayland currently disabled due to issues with multiple apps I use
  wayland.windowManager.sway = {
    enable = false;
    wrapperFeatures.gtk = true;
    xwayland = true;
    config = rec {
      modifier = "Mod4";
      startup = [{ command = "alacritty"; }];
    };
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="0"
      export WLR_NO_HARDWARE_CURSORS="1"
    '';
  };
}
