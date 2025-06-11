{ config, lib, pkgs, inputs, ... }:
let
  cfg = config.programs.ashell;
  inherit (lib) types mkOption mkEnableOption mkIf getExe literalExpression;
in {
  options.programs.ashell = {
    enable = mkEnableOption "Ashell";

    package = mkOption {
      type = types.package;
      default = inputs.ashell.defaultPackage.${pkgs.system};
    };

    settings = mkOption {
      type = types.attrs;
      default = { };
    };

    systemd = mkOption {
      type = types.submodule {
        options = {
          enable = mkEnableOption "Ashell systemd integration";

          target = mkOption {
            type = types.str;
            default = config.wayland.systemd.target;
            defaultText = literalExpression "config.wayland.systemd.target";
            example = "sway-session.target";
            description = ''
              The systemd target that will automatically start the Ashell service.
            '';
          };
        };
      };
      default = { };
    };

  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile = {
      "ashell/config.toml" = mkIf (cfg.settings != { }) {
        onChange = "${getExe cfg.package} reload";
        source =
          (pkgs.formats.toml { }).generate "ashell-config.toml" cfg.settings;
      };
    };

    systemd.user.services.ashell = mkIf cfg.systemd.enable {
      Unit = {
        Description = "systemd service for ashell";
        Documentation = "https://github.com/MalpenZibo/ashell";
        PartOf = [ cfg.systemd.target "tray.target" ];
        After = [ cfg.systemd.target ];
        ConditionEnvironment = "WAYLAND_DISPLAY";
      };

      Service = {
        ExecReload = "${getExe cfg.package} reload";
        ExecStart = "${getExe cfg.package}";
        KillMode = "mixed";
        Restart = "on-failure";
      };

      Install.WantedBy = [ cfg.systemd.target "tray.target" ];
    };
  };
}
