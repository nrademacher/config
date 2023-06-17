{ inputs, config, pkgs, ... }:

let
  meta = import ../meta.nix;
in
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    inputs.home-manager.darwinModules.home-manager
    ./homebrew.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.${meta.user.username} = {
    name = meta.user.username;
    home = "/Users/${meta.user.username}";
  };

  home-manager = {
    users.${meta.user.username} = import ./home.nix;
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nixUnstable;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
