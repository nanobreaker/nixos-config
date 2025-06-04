{ config, inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    nil
    nixd
    nixfmt-classic
    google-chrome
    qFlipper
    gfn-electron
    discord
    telegram-desktop
    jetbrains.idea-ultimate
  ];
}
