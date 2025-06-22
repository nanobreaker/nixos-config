{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "berkeley-mono";
  version = "1.009";

  src = builtins.path {
    path = ../../assets/berkeley-mono.zip;
    name = "berkeley-mono.zip";
  };

  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    install -Dm644 berkeley-mono/*.otf -t $out/share/fonts

    runHook postInstall
  '';
}
