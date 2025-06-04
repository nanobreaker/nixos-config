{ config, lib, pkgs, ... }: {

  home-manager.sharedModules = [{
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ "/home/nanobreaker/Wallpapers/wallpaper.jpeg" ];
        wallpaper = [ ", /home/nanobreaker/Wallpapers/wallpaper.jpeg" ];
      };
    };
  }];
}
