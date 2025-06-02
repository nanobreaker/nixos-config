{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];

  nixpkgs = {
    overlays = [ ];
    config = { allowUnfree = true; };
  };

  home = {
    username = "nanobreaker";
    homeDirectory = "/home/nanobreaker";
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.05";
}
