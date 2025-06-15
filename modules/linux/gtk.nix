{ config, lib, pkgs, ... }: {
  programs.dconf.enable = true;

  home-manager.sharedModules = [{
    gtk = {
      enable = true;
      gtk3.extraCss = ''
        * {
          border-radius: 0px;
        }
      '';
      gtk4.extraCss = ''
        * {
          border-radius: 0px;
        }
      '';
    };
  }];
}
