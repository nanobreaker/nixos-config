{ pkgs, ... }: {

  environment.systemPackages = [ pkgs.upower pkgs.bluez ];

  services.upower = { enable = true; };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    package = pkgs.bluez;
  };

  home-manager.sharedModules = [{
    programs.waybar = {
      enable = true;
      settings = [{
        layer = "top";
        position = "top";
        height = 22;
        spacing = 5;

        modules-left = [ "niri/workspaces" ];
        modules-center = [ "niri/window" ];
        modules-right =
          [ "tray" "pulseaudio" "battery" "network" "niri/language" "clock" ];

        "niri/workspaces" = {
          format = "<span size='larger'>{icon}</span>";
          format-icons = {
            "active" = "";
            "default" = "";
          };
        };

        "niri/language" = {
          "format-us" = "EN";
          "format-en" = "EN";
          "format-ru" = "RU";
        };

        "tray" = {
          spacing = 16;
          icon-size = 16;
        };

        "clock" = {
          format = "{:%a %B %d %H:%M}";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };

        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          format = "{icon}";
          format-charging = "";
          format-plugged = " ";
          format-alt = "{capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };

        "network" = {
          "format-wifi" = "";
          "format-ethernet" = "󰈀";
          "tooltip-format" = "󰈀 {ifname} via {gwaddr}";
          "format-linked" = "󰈀 {ifname} (No IP)";
          "format-disconnected" = "Disconnected ⚠ {ifname}";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          "scroll-step" = 5;
          "format" = "{icon}  {format_source}";
          "format-muted" = "  {format_source}";
          "format-source" = "";
          "format-source-muted" = "";
          "format-bluetooth" = " {icon}";
          "format-bluetooth-muted" = "󰂲 {icon}";
          "format-icons" = { "default" = [ "" "" "" ]; };
          "on-click" = "pavucontrol";
          "on-click-right" = "foot -a pw-top pw-top";
        };

      }];

      style = ''
        @define-color foreground #ffffff;
        @define-color background #0a0c10;

        * {
          font-family: Berkeley Mono Bold;
          font-size: 16px;
          min-height: 0;
        }

        #waybar {
          color: @foreground;
          background-color: @background;
        }

        #workspaces {
          background-color: transparent;
        }

        #workspaces button {
          padding-left: 0.7em;
        }

        #tray,
        #pulseaudio,
        #battery,
        #network,
        #language, 
        #clock {
          padding-right: 1em;
        }
      '';
    };
  }];
}
