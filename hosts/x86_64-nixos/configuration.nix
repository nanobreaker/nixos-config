{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.nanobreaker = import ./home.nix;
    }
    ../../modules/boot.nix
    ../../modules/btop.nix
    ../../modules/fonts.nix
    ../../modules/ghostty.nix
    ../../modules/gtk.nix
    ../../modules/git.nix
    ../../modules/helix.nix
    ../../modules/home-manager.nix
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

  users.users.nanobreaker = {
    isNormalUser = true;
    name = "nanobreaker";
    home = "/home/nanobreaker";
    extraGroups = [ "networkmanager" "wheel" "audio" "input" "dialout" ];
    shell = pkgs.nushell;
  };

  programs.hyprland.enable = true;

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

  system.stateVersion = "25.05";
}
