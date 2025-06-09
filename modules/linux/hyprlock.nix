{ config, lib, pkgs, ... }: {

  security.pam.services.hyprlock = { };

  home-manager.sharedModules = [{
    programs.hyprlock = {
      enable = true;
      settings = {

        general = {
          immediate_render = true;
          disable_loading_bar = false;
          grace = 1;
          hide_cursor = true;
          no_fade_in = true;
          text_trim = true;
          ignore_empty_input = true;
        };

        background = {
          path = "/home/nanobreaker/.config/dotfiles/assets/wallpaper.jpeg";
          blur_passes = 0;
          blur_size = 2;
          noise = 0;
          contrast = 0;
          brightness = 0;
          vibrancy = 0;
          vibrancy_darkness = 0.0;
        };

        input-field = {
          monitor = "DP-3";

          size = "300, 30";
          position = "0, -470";
          halign = "center";
          valign = "center";

          outline_thickness = 0;

          dots_size = 0.25;
          dots_spacing = 0.55;
          dots_center = true;
          dots_rounding = -1;

          outer_color = "rgba(242, 243, 244, 0)";
          inner_color = "rgba(242, 243, 244, 0)";
          font_color = "rgba(242, 243, 244, 1)";
          check_color = "rgba(204, 136, 34, 0)";
          fail_color = "rgba(204, 34, 34, 0)";
          fail_text = "$FAIL <b>($ATTEMPTS)</b>";
          fail_transition = 300;
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1;
          invert_numlock = false;
          swap_font_color = false;
          fade_on_empty = false;
          placeholder_text = "";
          hide_input = false;
        };

        image = [{
          monitor = "DP-3";

          position = "0, -353";
          halign = "center";
          valign = "center";

          path = "/home/nanobreaker/.config/dotfiles/assets/avatar.jpg";

          border_color = "0xffdddddd";
          border_size = "0";
          size = "90";
          rounding = "-1";
          rotate = "0";
          reload_time = "-1";
        }];

        label = [
          {
            position = "0, 405";
            halign = "center";
            valign = "center";

            text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
            color = "rgba(242, 243, 244, 1)";

            font_size = 20;
            font_family = "JetBrainsMono Nerd Font Bold";
          }
          {
            position = "0, 310";
            halign = "center";
            valign = "center";

            text = ''cmd[update:1000] echo "$(date +"%k:%M")"'';
            color = "rgba(242, 243, 244, 1)";

            font_size = 93;
            font_family = "JetBrainsMono Nerd Font Bold";
          }
          {
            monitor = "DP-3";

            position = "0, -438";
            halign = "center";
            valign = "center";

            text = "Egor Dragutan";

            font_size = 13;
            font_family = "JetBrainsMono Nerd Font Bold";

            color = "rgba(242, 243, 244, 1)";
          }
        ];
      };
    };
  }];
}
