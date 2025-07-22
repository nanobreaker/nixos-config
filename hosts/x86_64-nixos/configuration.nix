{ inputs, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/common/stylix.nix
    ../../modules/common/home-manager.nix
    ../../modules/common/fonts.nix
    ../../modules/common/ghostty.nix
    ../../modules/common/git.nix
    ../../modules/common/helix.nix
    ../../modules/common/btop.nix
    ../../modules/common/nushell.nix
    ../../modules/common/java.nix
    ../../modules/common/rust/rust.nix
    ../../modules/common/roc.nix
    ../../modules/common/yazi.nix
    ../../modules/common/starship.nix
    ../../modules/linux/wifi.nix
    ../../modules/linux/nh.nix
    ../../modules/linux/packages.nix
    ../../modules/linux/fuzzel.nix
    ../../modules/linux/boot.nix
    ../../modules/linux/tuigreet.nix
    ../../modules/linux/niri.nix
    ../../modules/linux/ironbar.nix
    ../../modules/linux/localisation.nix
    ../../modules/linux/networking.nix
    ../../modules/linux/pipewire.nix
    ../../modules/linux/time.nix
    ../../modules/linux/udev.nix
    ../../modules/linux/xserver.nix
  ];

  nix.settings.experimental-features =
    [ "nix-command" "flakes" "pipe-operators" ];

  nixpkgs.config.allowUnfree = true;

  virtualisation.docker = { enable = true; };

  users.users.nanobreaker = {
    isNormalUser = true;
    name = "nanobreaker";
    home = "/home/nanobreaker";
    extraGroups =
      [ "networkmanager" "wheel" "audio" "input" "dialout" "docker" "plugdev" ];
    shell = pkgs.nushell;
  };

  home-manager.users.nanobreaker.home = {
    homeDirectory = "/home/nanobreaker";
    stateVersion = "25.05";
  };

  system.stateVersion = "25.05";
}
