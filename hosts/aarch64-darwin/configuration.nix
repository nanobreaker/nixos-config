{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common/home-manager.nix
    ../../modules/common/ghostty.nix
  ];

  networking.hostName = "CI00372133";

  users.users.nanobreaker = {
    name = "nanobreaker";
    home = "/Home/nanobreaker";
  };

  home-manager.users.nanobreaker.home = {
    homeDirectory = "/Users/nanobreaker";
    stateVersion = "25.05";
  };

  system.stateVersion = 6;
}
