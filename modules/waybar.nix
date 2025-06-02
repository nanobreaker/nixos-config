{ config, lib, ... }: {
  home-manager.sharedModules = [{
    programs.waybar = {
      enable = true;
      systemd = { enable = true; };
      settings = [{
        layer = "top";
        position = "top";
        height = 24;
        spacing = 5;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "tray"
          "pulseaudio"
          "backlight"
          "hyprland/language"
          "battery"
          "clock"
        ];

        "hyprland/workspaces" = {
          on-click = "activate";
          sort-by-number = true;
        };

        "hyprland/window" = {
          format = "{class}";
          max-length = 40;
        };

        "tray" = { spacing = 10; };

        "clock" = {
          format = "{:%a %B %d %H:%M}";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };

        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [ "" "" "" "" "" ];
        };

        "hyprland/language" = { "format" = "{short}"; };

        "pulseaudio" = {
          "scroll-step" = 5;
          "format" = "{icon}  {volume}% {format_source}";
          "format-bluetooth" = " {icon} {volume}% {format_source}";
          "format-bluetooth-muted" = "  {icon} {format_source}";
          "format-muted" = "  {format_source}";
          "format-source" = " {volume}%";
          "format-source-muted" = "";
          "format-icons" = { "default" = [ "" "" "" ]; };
          "on-click" = "pavucontrol";
          "on-click-right" = "foot -a pw-top pw-top";
        };

      }];
    };
  }];
}
