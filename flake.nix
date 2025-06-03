{
  description = "nanobreaker's config";

  nixConfig = {
    experimental-features = [ "flakes" "nix-command" "pipe-operators" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix.url = "github:nix-community/fenix";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, ... }:
    let inherit (self) outputs;
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/x86_64-nixos/configuration.nix ];
        };
      };

      darwinConfigurations = {
        darwin = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/aarch64-darwin/configuration.nix ];
        };
      };

    };
}
