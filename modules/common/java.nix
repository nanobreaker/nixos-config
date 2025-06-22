{ pkgs, ... }:
let
  jdk = pkgs.jdk24_headless;
  maven = pkgs.maven.override { jdk_headless = jdk; };
  gradle = (pkgs.callPackage pkgs.gradle-packages.gradle_8 {
    java = pkgs.jetbrains.jdk;
  });
in {
  environment.systemPackages = [ jdk maven gradle ];

  environment.variables = { JAVA_HOME = "${jdk}"; };
}
