{
  description = "Configurations for my NixOS and Darwin development machines";

  inputs = {
    # Package sets
    nixpkgs.url = "github:nixos/nixpkgs/master";
    /* nixpkgs-stable.url = "github:nixos/nixpkgs/master";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable"; */

    # Darwin support
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # hardware.url = "github:nixos/nixos-hardware";

    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { nixpkgs, darwin, home-manager, ... }@inputs: {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      t15 = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [ ./machines/t15/configuration.nix ];
      };
      vd-t480 = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [ ./machines/vd-t480/configuration.nix ];
      };
    };
    darwinConfigurations = {
      mbp17 = darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        system = "x86_64-darwin";
        modules = [ ./machines/mbp17/configuration.nix ];
      };
    };

    formatter = {
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
      x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.nixpkgs-fmt;
    };
  };
}
