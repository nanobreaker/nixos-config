{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [

  ];

  home = {
    username = "nanobreaker";
    homeDirectory = "/home/nanobreaker";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
