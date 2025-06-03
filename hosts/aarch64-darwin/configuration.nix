{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "bkp";
      home-manager.users.nanobreaker = import ./home.nix;
    }
    ../../modules/ghostty.nix
  ];

  networking.hostName = "CI00372133";

  users.users.nanobreaker = {
    name = "nanobreaker";
    home = "/Home/nanobreaker";
  };

  system.stateVersion = 6;
}
