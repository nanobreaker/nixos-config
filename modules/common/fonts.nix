{ config, pkgs, ... }:
let berkeley-mono = pkgs.callPackage ./berkeley-mono.nix { inherit pkgs; };
in {
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    berkeley-mono
  ];
}
