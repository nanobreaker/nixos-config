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

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-unstable.url = "github:YaLTer/niri";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.niri-unstable.follows = "niri-unstable";
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    uwu-colors = {
      url = "github:q60/uwu_colors";
      inputs = { nixpkgs.follows = "nixpkgs"; };
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
        sha256 = "sha256-KAfZkFntAfbkkdx3RqrdwWrHoXoq5m8mVO23eNDa+C0=";
      };
    in {
      devShells.${system}.default =
        pkgs.mkShell { packages = [ toolchain pkgs.probe-rs-tools ]; };

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            { nixpkgs.overlays = [ fenix.overlays.default ]; }
            inputs.stylix.nixosModules.stylix
            ./hosts/x86_64-nixos/configuration.nix
          ];
        };
      };

      darwinConfigurations = {
        darwin = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit inputs outputs; };
          modules = [
            { nixpkgs.overlays = [ fenix.overlays.default ]; }
            inputs.stylix.darwinModules.stylix
            ./hosts/aarch64-darwin/configuration.nix
          ];
        };
      };

    };
}
