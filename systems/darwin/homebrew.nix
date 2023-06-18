{
  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "zap";
  homebrew.global.brewfile = true;
  homebrew.global.lockfiles = false;
  homebrew.onActivation.upgrade = true;

  homebrew.taps =
    [ "homebrew/cask" "homebrew/cask-versions" "homebrew/cask-fonts" ];

  homebrew.casks = [
    "brave-browser"
    "google-chrome"
    "google-chrome-canary"
    "firefox-developer-edition"
    "anki"
    "postman"
    "keka"
    "docker"
    "coconutbattery"
    "font-fira-code-nerd-font"
    "alfred4"
    "obsidian"
    "hammerspoon"
    "karabiner-elements"
    "kitty"
    "spotify"
  ];
}
