{ inputs, pkgs, ... }: {

  environment.systemPackages = [
    inputs.roc.packages.${pkgs.system}.cli
    inputs.roc.packages.${pkgs.system}.lang-server
  ];
}
