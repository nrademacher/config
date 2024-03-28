{ config, pkgs, ... }:

let
  kitty-xterm = pkgs.writeShellScriptBin "xterm" ''
    ${config.programs.kitty.package}/bin/kitty -1 "$@"
  '';
in
{
  home = {
    packages = [ kitty-xterm ];
    sessionVariables = {
      TERMINAL = "kitty -1";
    };
  };

  programs.kitty = {
    enable = true;

    darwinLaunchOptions = [
      "--listen-on=unix:/tmp/mykitty"
      "--single-instance"
    ];

    font = {
      package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
      name = "FiraCode Nerd Font Mono";
      size = 13.5;
    };

    settings = {
      enable_audio_bell = false;
      hide_window_decorations = "titlebar-only";
    };

    extraConfig = builtins.readFile ./themes/seoul256.conf;
  };
}
