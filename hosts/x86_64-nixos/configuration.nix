{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/home-manager.nix
    ../../modules/anyrun.nix
    ../../modules/boot.nix
    ../../modules/btop.nix
    ../../modules/fonts.nix
    ../../modules/ghostty.nix
    ../../modules/gtk.nix
    ../../modules/git.nix
    ../../modules/helix.nix
    ../../modules/hyprland.nix
    ../../modules/localisation.nix
    ../../modules/nushell.nix
    ../../modules/networking.nix
    ../../modules/pipewire.nix
    ../../modules/time.nix
    ../../modules/udev.nix
    ../../modules/waybar.nix
    ../../modules/xserver.nix
  ];

  nix.settings.experimental-features =
    [ "nix-command" "flakes" "pipe-operators" ];

  nixpkgs.config.allowUnfree = true;

  programs.hyprland.enable = true;

  users.users.nanobreaker = {
    isNormalUser = true;
    name = "nanobreaker";
    home = "/home/nanobreaker";
    extraGroups = [ "networkmanager" "wheel" "audio" "input" "dialout" ];
    shell = pkgs.nushell;
  };

  home-manager.users.nanobreaker.home = {
    homeDirectory = "/home/nanobreaker";
    stateVersion = "25.05";
  };

  environment.systemPackages = [
    inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins
    pkgs.nil
    pkgs.nixd
    pkgs.nixfmt-classic
    pkgs.google-chrome
    pkgs.qFlipper
    pkgs.gfn-electron
    pkgs.discord
    pkgs.telegram-desktop
    pkgs.jetbrains.idea-ultimate
  ];

  system.stateVersion = "25.05";
}
