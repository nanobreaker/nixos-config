{ pkgs, inputs, ... }: {
  environment.systemPackages =
    [ pkgs.upower pkgs.bluez inputs.ashell.defaultPackage.${pkgs.system} ];

  services.upower = { enable = true; };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    package = pkgs.bluez;
  };

  home-manager.sharedModules = [
    ../home/ashell.nix
    {
      programs.ashell = {
        enable = true;
        systemd = { enable = true; };
        package = inputs.ashell.defaultPackage.${pkgs.system};
        settings = {
          log_level = "warn";
          outputs = "All";
          position = "Top";
          app_launcher_cmd = "anyrun";
          clipboard_cmd = "cliphist-rofi-img | wl-copy";
          truncate_title_after_length = 150;

          modules = {
            left = [ "SystemInfo" "Workspaces" ];
            center = [ "WindowTitle" ];
            right = [ "Tray" "KeyboardLayout" "Settings" "Clock" ];
          };

          updates = {
            check_cmd = "checkupdates; paru -Qua";
            update_cmd = ''
              alacritty -e bash -c "paru; echo Done - Press enter to exit; read" &'';
          };

          workspaces = {
            visibility_mode = "All";
            enable_workspace_filling = false;
          };

          keyboard_layout = {
            labels = {
              "English (US)" = "us";
              "Russian" = "ru";
            };
          };

          system = {
            indicators = [ "Cpu" "Memory" "Temperature" ];

            cpu = {
              warn_threshold = 60;
              alert_threshold = 80;
            };

            memory = {
              warn_threshold = 70;
              alert_threshold = 85;
            };

            temperature = {
              warn_threshold = 60;
              alert_threshold = 80;
            };

            disk = {
              warn_threshold = 80;
              alert_threshold = 90;
            };
          };

          clock = { format = "%a %b %d %R"; };

          media_player = { max_title_length = 100; };

          settings = {
            lock_cmd = "hyprlock &";
            audio_sinks_more_cmd = "pavucontrol -t 3";
            audio_sources_more_cmd = "pavucontrol -t 4";
            wifi_more_cmd = "nm-connection-editor";
            vpn_more_cmd = "nm-connection-editor";
            bluetooth_more_cmd = "blueman-manager";
          };

          appearance = {
            font_name = "JetBrainsMono Nerd Font";
            style = "Solid";
            opacity = 1.0;
            background_color = "#0a0c10";
            primary_color = "#f0f3f6";
            secondary_color = "#0a0c10";
            success_color = "#00a651";
            danger_color = "#ed1c24";
            text_color = "#f0f3f6";
            workspace_colors = [ "#ffffff" "#ffffff" ];
            special_workspace_colors = [ "#a6e3a1" "#f38ba8" ];

            menu = {
              opacity = 0.7;
              backdrop = 0.3;
            };
          };
        };
      };
    }
  ];

}
