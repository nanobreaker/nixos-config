{
  description = "nanobreaker's config";

  nixConfig = {
    experimental-features = [ "flakes" "nix-command" "pipe-operators" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix.url = "github:nix-community/fenix";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let inherit (self) outputs;
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/x86_64-nixos/configuration.nix ];
        };
      };

    };
}
