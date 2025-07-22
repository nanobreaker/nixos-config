{ config, lib, pkgs, inputs, ... }: {
  nixpkgs.overlays = [ inputs.fenix.overlays.default ];

  environment.systemPackages = [
    pkgs.probe-rs-tools
    (pkgs.fenix.fromToolchainFile {
      file = ./rust-toolchain.toml;
      sha256 = "sha256-KAfZkFntAfbkkdx3RqrdwWrHoXoq5m8mVO23eNDa+C0=";
    })
  ];
}
