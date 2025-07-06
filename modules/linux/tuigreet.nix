{ pkgs, ... }: {

  environment.systemPackages = [ pkgs.greetd.tuigreet ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "nanobreaker";
        command = "${pkgs.niri}/bin/niri-session";
      };
    };
  };
}
