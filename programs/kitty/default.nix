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
      name = "FiraCode Nerd Font Regular";
      size = 12;
    };

    settings = {
      enable_audio_bell = false;
    };

    extraConfig = ''
      	# seoul256 by Junegunn Choi, https://github.com/junegunn
      	# This work is licensed under the terms of the MIT license.
      	# For a copy, see https://opensource.org/licenses/MIT.

      	foreground           #d8d8d8
      	# background         #4a4a4a
      	background           #3F3F3F

      	# black
      	color0               #606060
      	color8               #757575

      	# red
      	color1               #df9a98
      	color9               #e07798

      	# green
      	color2               #719672
      	color10              #97bb98

      	# yellow
      	color3               #e0bb71
      	color11              #ffdd98 

      	# blue
      	color4               #96bbdc 
      	color12              #badcfb

      	# magenta
      	color5               #dfbdbc
      	color13              #ffbebc

      	# cyan
      	color6               #97bcbc
      	color14              #96ddde

      	# white
      	color7               #d8d8d8
      	color15              #e9e9e9

      	# cursor colors
      	cursor               #d8d8d8
      	cursor_text_color    #4a4a4a
    '';
  };
}
