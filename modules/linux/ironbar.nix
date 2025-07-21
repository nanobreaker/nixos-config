{ config, inputs, pkgs, lib, ... }: {

  environment.systemPackages = [ pkgs.upower pkgs.bluez ];

  services.upower = { enable = true; };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    package = pkgs.bluez;
  };

  home-manager.sharedModules = [
    inputs.ironbar.homeManagerModules.default
    {
      programs.ironbar = {
        enable = true;
        systemd = false;
        package = inputs.ironbar.packages.${pkgs.system}.default;
        config = {
          anchor_to_edges = true;
          position = "top";
          height = 13;
          margin.top = 9;
          margin.bottom = 0;
          margin.left = 9;
          margin.right = 9;
          autohide = null;
          start_hidden = false;
          # icon_theme = "Symbols Nerd Font Mono";

          start = [
            { type = "workspaces"; }
            {
              type = "focused";
              show_icon = false;
              show_title = true;
              truncate = {
                mode = "end";
                max_length = 40;
              };
            }
          ];

          center = [ ];

          end = [
            {
              type = "music";
              icon_size = 13;
              justify = "center";
              truncate = {
                mode = "end";
                max_length = 40;
              };
            }
            {
              type = "tray";
              icon_size = 13;
              justify = "center";
            }
            {
              type = "volume";
              format = "{icon} {percentage}%";
              justify = "center";
            }
            {
              type = "upower";
              icon_size = 13;
              format = "{percentage}%";
              justify = "center";
            }
            {
              type = "network_manager";
              icon_size = 13;
              justify = "center";
            }
            {
              type = "clock";
              format = "%d/%m/%Y %H:%M";
              justify = "center";
            }
          ];
        };

        style = ''
          @define-color foreground #ffffff;
          @define-color background #0a0c10;

          * {
            font-family: Berkeley Mono Bold;
            font-size: 13px;

            padding: 0px;
            margin: 0px;

            border: 0px;
            border-radius: 4px;
          }

          .background {
            background-color: rgba(0,0,0,0);
          }

          .workspaces {
            color: @foreground;
            background-color: @background;
          }

          .workspaces .item {
            color: @foreground;
            background-color: @background;
            padding: 0px 4px;
            margin: 0px;
          }

          .workspaces .item.focused {
            color: @background;
            background-color: @foreground;
            padding: 0px 4px;
            margin: 0px;
          }

          .focused {
            color: @foreground;
            background-color: @background;
            padding: 0px 4px;
            margin: 0px 4px;
          }

          .music {
            color: @foreground;
            background-color: @background;
            padding-right: 8px;
            margin: 0px 4px;
          }

          .music .contents {
            color: @foreground;
            background-color: @background;
          }

          .popup-music {
            color: @foreground;
            background-color: @background;
          }

          .tray {
            color: @foreground;
            background-color: @background;
            padding: 0px 4px;
            margin: 0px 4px;
          }

          .volume {
            background-color: @background;
            padding: 0px 4px;
            margin: 0px 4px;
          }

          .upower {
            color: @foreground;
            background-color: @background;
            padding: 0px 4px;
            margin: 0px 4px;
          }

          .upower .icon {
            color: @foreground;
          }

          .upower .label {
            color: @foreground;
          }

          .network_manager {
            color: @foreground;
            background-color: @background;
            padding: 0px 4px;
            margin: 0px 4px;
          }

          .network_manager .icon {
            color: @foreground;
          }

          .network_manager .label {
            color: @foreground;
          }

          .clock {
            padding: 0px 4px;
            margin-left: 4px;
            background-color: @background;
          }
        '';
      };
    }
  ];

}
