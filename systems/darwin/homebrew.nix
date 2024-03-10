{
  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "zap";
  homebrew.global.brewfile = true;
  homebrew.global.lockfiles = false;
  homebrew.onActivation.upgrade = true;

  homebrew.taps =
    [ "homebrew/cask-versions" "homebrew/cask-fonts" ];

  homebrew.casks = [
    # terminal
    "kitty"

    # browsers
    "brave-browser"
    "google-chrome"
    "google-chrome-canary"
    "firefox-developer-edition"
    "arc"

    # information systems
    "anki"
    "obsidian"

    # for keyboard setup
    "hammerspoon"
    "karabiner-elements"

    # misc
    "postman"
    "keka"
    "docker"
    "coconutbattery"
    "font-fira-code-nerd-font"
    "alfred4"
    "spotify"
  ];
}
