{ config, pkgs, inputs, ... }: {

  environment.systemPackages = with pkgs; [ upower ];

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
          height = 42;
          autohide = null;
          start_hidden = false;

          start = [{ type = "workspaces"; }];

          center = [{
            type = "focused";
            show_icon = false;
            show_title = true;
          }];

          end = [
            {
              type = "tray";
              icon_size = 16;
            }
            {
              type = "volume";
              format = "{icon}";
            }
            {
              type = "upower";
              format = "{icon}";
            }
            { type = "network_manager"; }
            { type = "keyboard"; }
            { type = "clock"; }
          ];
        };

        style = ''
          * {
            font-family: JetBrainsMono Nerd Font;
            font-size: 16px;
            border: none;
            border-radius: 0;
          }
        '';
      };
    }
  ];
}
