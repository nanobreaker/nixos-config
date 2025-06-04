{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common/home-manager.nix
    ../../modules/common/fonts.nix
    ../../modules/common/ghostty.nix
    ../../modules/common/git.nix
    ../../modules/common/helix.nix
    ../../modules/common/btop.nix
    ../../modules/common/nushell.nix
    ../../modules/linux/anyrun.nix
    ../../modules/linux/boot.nix
    ../../modules/linux/gtk.nix
    ../../modules/linux/hyprland.nix
    ../../modules/linux/localisation.nix
    ../../modules/linux/networking.nix
    ../../modules/linux/pipewire.nix
    ../../modules/linux/time.nix
    ../../modules/linux/udev.nix
    ../../modules/linux/waybar.nix
    ../../modules/linux/xserver.nix
  ];

  nix.settings.experimental-features =
    [ "nix-command" "flakes" "pipe-operators" ];

  nixpkgs.config.allowUnfree = true;

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

  system.stateVersion = "25.05";
}
