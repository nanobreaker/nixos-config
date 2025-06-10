{ config, inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    clang_16
    clang-tools_16
    nil
    nixd
    nixfmt-classic
    pcmanfm
    pavucontrol
    obsidian
    google-chrome
    qFlipper
    gfn-electron
    discord
    telegram-desktop
    jetbrains.idea-ultimate
  ];
}
