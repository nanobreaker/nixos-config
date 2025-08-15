{ pkgs, ... }:
let
  jdk = pkgs.jdk24;
  # idea-jdk = pkgs.jdk21;
  maven = pkgs.maven.override { jdk_headless = jdk; };
  # idea = pkgs.jetbrains.idea-ultimate.override { jdk = idea-jdk; };
in {
  environment.systemPackages =
    [ jdk maven pkgs.jetbrains.idea-ultimate pkgs.graalvmPackages.graalvm-ce ];

  environment.variables = { JAVA_HOME = "${jdk}"; };
}
