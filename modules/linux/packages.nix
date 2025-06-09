{ config, inputs, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    pcmanfm
    clang_16
    clang-tools_16
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
