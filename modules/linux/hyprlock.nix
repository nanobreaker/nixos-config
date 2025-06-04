{ config, lib, pkgs, ... }: {

  security.pam.services.hyprlock = { };

  home-manager.sharedModules = [{ programs.hyprlock = { enable = true; }; }];
}
