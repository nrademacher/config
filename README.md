# config (WIP)

My personal system configurations for Darwin/macOS and NixOS, written in Nix.

The goal of this repo is to use and evolve my working environment across all my systems and machines.

## Setup

### NixOS

These setup instructions assume a fresh install of NixOS.

1. Make `git` available to your shell, e.g. by running `nix-shell -p git`
1. Clone this repository and change into its directory
1. Enable nix's command line and flakes features: `export NIX_CONFIG="experimental-features = nix-command flakes"`
1. Bootstrap the system configuration:
   1. For a machine already defined in `meta.nix` and with an entry in `flake.nix`, run `sudo nixos-rebuild switch --flake .#NAME_OF_MACHINE`
   1. For a new machine:
      1. Add an entry for the machine in `meta.nix`
      1. Create a directory for the machine in the `machines` directory, e.g. `johns-laptop`
      1. In the machine's directory, add `hardware-configuration.nix` by running `cp /etc/nixos/hardware-configuration.nix .`
      1. To update the file if the hardware changes, run `sudo nixos-generate-config` and copy over the file again or `echo "$(nixos-generate-config --show-hardware-config)" > hardware-configuration.nix` to update it directly
      1. Create a `configuration.nix` file that imports `hardware-configuration.nix` and `nixos/configuration.nix` (relative path)
      1. In the configuration file, set `networking.hostName` to the hostname defined for the machine in `meta.nix` (you can import the file for that purpose)
      1. In `flake.nix`, create an entry for the machine (e.g. `johns-laptop`) in `nixosConfigurations` that imports the machine's `configuration.nix` as a module (see existing configurations)
      1. From the directory's root, run `sudo nixos-rebuild switch --flake .#NAME_OF_MACHINE`

### Darwin

TODO
