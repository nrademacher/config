{ lib, ... }:

let
  mod = "Mod4";
in
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;
      defaultWorkspace = "workspace number 1";
      terminal = "kitty";
      bars = [ ]; # disables all bars
      keybindings = lib.mkOptionDefault {
        # Focus
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+h" = "focus left";

        # Move
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+Shift+h" = "move left";
      };
    };
    extraConfig = ''
      # Set background image
      exec --no-startup-id feh --bg-scale ~/Downloads/1674010659131953.jpg

      # Disable window borders
      for_window [all] border pixel 0

      # Moving workspaces between screens
      bindsym ${mod}+p move workspace to output right
    '';
  };
}
