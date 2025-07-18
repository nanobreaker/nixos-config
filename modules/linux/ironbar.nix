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
        systemd = true;
        package = inputs.ironbar.packages.${pkgs.system}.default;
        config = {
          anchor_to_edges = true;
          position = "top";
          height = 10;
          autohide = 1000;
          start_hidden = false;

          start = [{
            type = "workspaces";
            icon_size = 16;
            name_map = {
              "0" = "";
              "1" = "";
              "2" = "";
              "3" = "";
              "4" = "";
              "5" = "";
              "6" = "";
              "7" = "";
              "8" = "";
              "9" = "";
            };
          }];

          center = [{
            type = "focused";
            show_icon = false;
            show_title = true;
            justify = "center";
          }];

          end = [
            {
              type = "tray";
              icon_size = 16;
              justify = "center";
            }
            {
              type = "volume";
              format = "{icon}";
              justify = "center";
            }
            {
              type = "upower";
              icon_size = 16;
              format = "{percentage}";
              justify = "center";
            }
            {
              type = "network_manager";
              icon_size = 16;
              justify = "center";
            }
            {
              type = "clock";
              justify = "center";
            }
          ];
        };

        style = ''
          @define-color foreground #ffffff;
          @define-color background #0a0c10;

          * {
            font-family: Berkeley Mono Bold;
            font-size: 16px;

            border: none;
            border-radius: 0;
          }

          .workspaces {
            color: @foreground;
            background-color: @background;
          }

          .workspaces .item {
            color: @foreground;
            background-color: @background;
          }

          .workspaces .item.focused {
            color: @background;      
            background-color: @foreground;
          }

          .upower {
            color: @foreground;      
            background-color: @background;
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
          }

          .network_manager .icon {
            color: @foreground;      
          }

          .network_manager .label {
            color: @foreground;      
          }

          .volume {
            background-color: @background;
          }

          .clock {
            background-color: @background;
          }
        '';
      };
    }
  ];

}
