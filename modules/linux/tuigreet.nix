{ pkgs, ... }: {

  environment.systemPackages = [ pkgs.greetd.tuigreet ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "nanobreaker";
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
