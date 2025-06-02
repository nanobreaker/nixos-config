{ config, pkgs, ... }: {
  services.dbus.enable = true;
  services.xserver.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
    options = "grp:alt_shift_toggle";
  };
}
