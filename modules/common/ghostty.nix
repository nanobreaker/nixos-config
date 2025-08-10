{ config, lib, pkgs, ... }: {
  environment.variables = { TERMINAL = "ghostty"; };

  home-manager.sharedModules = [{
    programs.ghostty = {
      enable = true;
      settings = {
        font-size = 18;
        font-family = "Berkeley Mono";

        background = "0a0c0f";
        foreground = "ffffff";

        cursor-style = "block";
        cursor-style-blink = false;

        mouse-hide-while-typing = true;

        gtk-titlebar = false;
      };
    };
  }];
}
