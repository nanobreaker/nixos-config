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

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    roc.url = "github:roc-lang/roc";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, fenix, ... }:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ fenix.overlays.default ];
      };
      toolchain = pkgs.fenix.fromToolchainFile {
        file = ./rust-toolchain.toml;
        sha256 = "sha256-tJJr8oqX3YD+ohhPK7jlt/7kvKBnBqJVjYtoFr520d4=";
      };
    in {
      devShells.${system}.default =
        pkgs.mkShell { packages = [ toolchain pkgs.probe-rs-tools ]; };

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/x86_64-nixos/configuration.nix
            { nixpkgs.overlays = [ fenix.overlays.default ]; }
          ];
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
