{ config, lib, pkgs, ...}: {
  programs.dconf.enable = true;

  home-manager.sharedModules = [{
    gtk = {
      enable = true;
    };
  }];
}
