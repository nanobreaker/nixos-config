{ config, inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    uutils-coreutils-noprefix
    usbutils
    nil
    nixd
    nixfmt-classic
    p7zip
    pstree
    pcmanfm
    pavucontrol
    obsidian
    google-chrome
    qFlipper
    gfn-electron
    discord
    telegram-desktop
    element-desktop
    zed-editor
    gimp3
    neofetch
    rpi-imager
    gdlauncher-carbon
    wpaperd
    ripgrep
    scooter
    dua
    systemctl-tui
    spotify
  ];
}
