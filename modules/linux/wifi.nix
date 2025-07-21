{ inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [ impala ];

  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

}
