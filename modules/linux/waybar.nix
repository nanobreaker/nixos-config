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

      style = ''
        @define-color foreground #ffffff;
        @define-color foreground-focused #e7c547;
        @define-color background #212124;

        * {
          font-family: JetBrainsMono Nerd Font;
          font-size: 16px;
          min-height: 0;
          padding: 0.1rem;
        }

        window#waybar {
          color: @foreground;
          background-color: @background;
        }

        tooltip {
          background: #000000;
        }

        tooltip label {
          color: white;
        }

        #workspaces button {
          padding: 0 5px;
          color: @foreground;
        }

        #workspaces button.focused {
          color: @background;
          background-color: @foreground;
        }

        #workspaces button.active {
          color: @foreground-focused;
        }

        #mode,
        #clock,
        #battery {
          padding: 0 10px;
        }

        #mode {
          background: #64727d;
          border-bottom: 3px solid white;
        }

        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #wireplumber,
        #custom-media,
        #tray,
        #mode,
        #idle_inhibitor,
        #scratchpad,
        #mpd {
          margin: 2px;
          padding-left: 4px;
          padding-right: 4px;
          color: #ffffff;
        }

        #clock {
          font-size: 16px;
        }

        #battery icon {
          color: red;
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

        #custom-os_button {
          font-size: 32px;
          transition: all 0.25s cubic-bezier(0.165, 0.84, 0.44, 1);
        }

        #custom-os_button:hover {
          background: white;
          color: black;
        }
      '';
    };
  }];
}
