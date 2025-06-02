{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = { nanobreaker = import ./home.nix; };
  };

  nix.settings.experimental-features =
    [ "nix-command" "flakes" "pipe-operators" ];

  nixpkgs = {
    overlays = [ ];
    config = { allowUnfree = true; };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Chisinau";

  i18n.defaultLocale = "en_US.UTF-8";

  services.udev.enable = true;
  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", ATTRS{manufacturer}=="Flipper Devices Inc.", TAG+="uaccess"
  '';

  services.dbus.enable = true;
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "hyprland";

  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
    options = "grp:alt_shift_toggle";
  };

  services.printing.enable = true;

  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.nanobreaker = {
    isNormalUser = true;
    description = "egor";
    extraGroups = [ "networkmanager" "wheel" "audio" "input" "dialout" ];
    shell = pkgs.nushell;
    packages = [ ];
  };

  programs.hyprland.enable = true;
  programs.waybar.enable = true;
  programs.yazi.enable = true;

  environment.variables = { TERMINAL = "ghostty"; };

  environment.systemPackages = with pkgs; [
    git
    maven
    jdk24
    google-chrome
    helix
    taplo
    nil
    nixd
    kitty
    ghostty
    wofi
    hyprcursor
    hyprpicker
    hyprpaper
    gfn-electron
    discord
    telegram-desktop
    jetbrains.idea-ultimate
    nixfmt-classic
    vscode-langservers-extracted
    grimblast
    wf-recorder
    qFlipper
    qemu
    usbutils
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "25.05";

}
