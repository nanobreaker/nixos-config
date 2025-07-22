{
  description = "nanobreaker's personalized nixos configuration";

  nixConfig = { experimental-features = [ "flakes" "nix-command" ]; };

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

    ironbar = {
      url = "github:JakeStanger/ironbar";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = { url = "github:sodiboo/niri-flake"; };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    roc.url = "github:roc-lang/roc";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, fenix, ... }:
    let inherit (self) outputs;
    in {
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
