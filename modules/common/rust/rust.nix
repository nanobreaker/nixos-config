{ config, lib, pkgs, inputs, ... }: {
  nixpkgs.overlays = [ inputs.fenix.overlays.default ];

  environment.systemPackages = [
    pkgs.probe-rs-tools
    (pkgs.fenix.fromToolchainFile {
      file = ./rust-toolchain.toml;
      sha256 = "sha256-O0LDBSOe/ggTpAS4AyjoRcR/83UOLOzDrzF+D9A8fRo=";
    })
  ];
}
