{ pkgs, ... }:
let
  jdk = pkgs.jdk24_headless;
  maven = pkgs.maven.override { jdk_headless = jdk; };
  jetbrains = pkgs.jetbrains.idea-ultimate.override { jdk = jdk; };
in {
  environment.systemPackages =
    [ jdk jetbrains maven pkgs.graalvmPackages.graalvm-ce ];

  environment.variables = { JAVA_HOME = "${jdk}"; };
}
