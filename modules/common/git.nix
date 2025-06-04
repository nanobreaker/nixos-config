{ self, config, lib, pkgs, ... }: {
  home-manager.sharedModules = [{
    programs.git = {
      enable = true;
      userName = "nanobreaker";
      userEmail = "nan0br3aker@gmail.com";
      extraConfig = { core.editor = "hx"; };
    };
  }];
}
