{ config, pkgs, inputs, lib, ... }: {

  home-manager.sharedModules = [{
    programs.fuzzel = {
      enable = true;
      settings.main = {
        layer = "overlay";
        prompt = ''"|> "'';

        terminal = "ghostty -e";
        horizonal-pad = 4;
        font = lib.mkForce "Berkeley Mono:size=19";
        tabs = 4;
      };

      settings.border = {
        width = 1;
        radius = 0;
      };
    };
  }];

}
