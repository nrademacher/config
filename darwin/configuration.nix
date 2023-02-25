{ config, pkgs, ... }:

let mainUser = "nrademacher";
in {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  imports = [ <home-manager/nix-darwin> ./homebrew.nix ];

  environment.darwinConfig = "/Users/nrademacher/dotfiles/darwin/configuration.nix";

  users.users.${mainUser} = {
    name = mainUser;
    home = "/Users/${mainUser}";
  };

  home-manager = {
    users.${mainUser} = import ./home.nix;
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
