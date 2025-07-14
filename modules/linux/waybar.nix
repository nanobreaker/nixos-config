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
      systemd = { enable = true; };
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
          "persistent-workspaces" = {
            "DP-3" = [ "1" "2" "3" "4" ];
            "eDP-1" = [ "5" "6" "7" "8" "9" ];
          };
        };

        "niri/language" = {
          "format-us" = "EN";
          "format-en" = "EN";
          "format-ru" = "RU";
        };

        "tray" = { spacing = 10; };

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
          font-size: 17px;
        }

        #waybar {
          color: @foreground;
          background-color: @background;
          border: none;
          box-shadow: none;
        }

        tooltip {
          background: @background;
        }

        tooltip label {
          color: white;
        }

        #workspaces {
          background-color: transparent;
          padding: 0.3em;
        }

        #workspaces button {
          border-style: solid;
          border-radius: 4px;
          color: @foreground;
        }

        #workspaces button.focused {
          color: @background;
          background-color: @foreground;
        }

        #workspaces button.active {
          color: @background;
          background-color: @foreground;
        }

        .modules-center {
          
        }

        #window {
          padding: 0px 4px;
        }

        .modules-right {
          font-size: 18px;
        }

        #tray,
        #pulseaudio {
          padding: 0px 5px;
        }

        #battery,
        #network {
          padding: 0px 7px;
        }

        #language {
          padding: 0px 5px;
          margin: 7px 0px;
          color: @background;
          background-color: @foreground;
          border-radius: 4px;
        }

        #clock {
          padding: 0px 4px;
        }

        #battery.charging,
        #battery.plugged {
          color: #ffffff;
          background-color: #26a65b;
        }

        @keyframes blink {
          to {
            background-color: #ffffff;
            color: #000000;
          }
        }

        #battery.warning:not(.charging) {
          background-color: #f53c3c;
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }

        #battery.critical:not(.charging) {
          background-color: #f53c3c;
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }

        label:focus {
          background-color: #000000;
        }

        #network.disconnected {
          background-color: #f53c3c;
        }

        #temperature.critical {
          background-color: #eb4d4b;
        }

        #idle_inhibitor.activated {
          background-color: #ecf0f1;
          color: #2d3436;
        }

        #tray>.passive {
          -gtk-icon-effect: dim;
        }

        #tray>.needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #eb4d4b;
        }
      '';
    };
  }];
}
