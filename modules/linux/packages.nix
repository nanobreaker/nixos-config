{ config, inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    uutils-coreutils-noprefix
    clang_16
    clang-tools_16
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
    jetbrains.idea-ultimate
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
  ];
}
