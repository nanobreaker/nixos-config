{ pkgs, ... }:
let
  jdk = pkgs.jdk24_headless;
  maven = pkgs.maven.override { jdk_headless = jdk; };
  idea = pkgs.jetbrains.idea-ultimate.override { jdk = pkgs.openjdk21; };
in {
  environment.systemPackages =
    [ jdk maven idea pkgs.graalvmPackages.graalvm-ce ];

  environment.variables = { JAVA_HOME = "${jdk}"; };
}
