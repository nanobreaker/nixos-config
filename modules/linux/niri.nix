{ config, lib, pkgs, inputs, ... }: {
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  environment.systemPackages = with pkgs; [
    kitty
    hyprcursor
    hyprpicker
    hyprpaper
    grimblast
    wf-recorder
    wl-clipboard
    gnome-control-center
    xwayland-satellite
  ];

  programs.xwayland.enable = true;

  home-manager.sharedModules = [{
    imports = [ inputs.niri.homeModules.niri ];
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
      settings = {
        prefer-no-csd = true;
        environment = {
          CLUTTER_BACKEND = "wayland";
          GDK_BACKEND = "wayland,x11";
          MOZ_ENABLE_WAYLAND = "1";
          NIXOS_OZONE_WL = "1";
          QT_QPA_PLATFORM = "wayland;xcb";
          QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
          SDL_VIDEODRIVER = "wayland";
        };
        input = {
          keyboard.xkb.layout = "us,ru";
          keyboard.xkb.options = "grp:alt_shift_toggle";
          touchpad = {
            click-method = "button-areas";
            dwt = true;
            dwtp = true;
            natural-scroll = true;
            scroll-method = "two-finger";
            tap = true;
            tap-button-map = "left-right-middle";
            middle-emulation = true;
            accel-profile = "adaptive";
          };
          focus-follows-mouse.enable = true;
          warp-mouse-to-focus = true;
          workspace-auto-back-and-forth = true;
        };
        screenshot-path =
          "~/Pictures/Screenshots/screenshot-%Y-%m-%d-%H-%M-%S.png";
        outputs = {
          "eDP-1" = {
            scale = 1.0;
            position = {
              x = 0;
              y = 0;
            };
          };
          "DP-3" = {
            mode = {
              width = 2560;
              height = 1440;
              refresh = 144.0;
            };
            scale = 1.0;
            position = {
              x = 1920;
              y = 0;
            };
          };
        };

        overview = { backdrop-color = "transparent"; };
        gestures = { hot-corners.enable = false; };
        cursor = {
          size = 9;
          hide-when-typing = true;
        };
        layout = {
          focus-ring = {
            enable = false;
            width = 1;
            active.color = "#818181";
            inactive.color = "#0a0c10";
          };
          border = {
            enable = true;
            width = 1;
            active.color = "#818181";
            inactive.color = "#0a0c10";
          };
          shadow = { enable = false; };
          preset-column-widths = [
            { proportion = 0.25; }
            { proportion = 0.5; }
            { proportion = 0.75; }
            { proportion = 1.0; }
          ];
          default-column-width = { proportion = 0.5; };

          gaps = 0;
          struts = {
            left = 0;
            right = 0;
            top = 0;
            bottom = 0;
          };

          tab-indicator = {
            hide-when-single-tab = true;
            place-within-column = true;
            position = "left";
            corner-radius = 0.0;
            gap = -12.0;
            gaps-between-tabs = 10.0;
            width = 4.0;
            length.total-proportion = 0.1;
          };
        };
        window-rules = [{
          draw-border-with-background = false;
          geometry-corner-radius = {
            top-left = 0.0;
            top-right = 0.0;
            bottom-left = 0.0;
            bottom-right = 0.0;
          };
          clip-to-geometry = true;
        }];
        binds = {
          "Mod+D".action.spawn = "anyrun";
          "Mod+Return".action.spawn = "ghostty";
          "Mod+Q".action.close-window = { };
          "Mod+S".action.switch-preset-column-width = { };
          "Mod+F".action.maximize-column = { };
          "Mod+Shift+F".action.fullscreen-window = { };

          "Mod+Space".action.toggle-window-floating = { };
          "Mod+W".action.toggle-column-tabbed-display = { };

          "Mod+Comma".action.consume-window-into-column = { };
          "Mod+Period".action.expel-window-from-column = { };
          "Mod+C".action.center-visible-columns = { };
          "Mod+Tab".action.switch-focus-between-floating-and-tiling = { };

          "Mod+Left".action.focus-column-left = { };
          "Mod+Right".action.focus-column-right = { };
          "Mod+Down".action.focus-workspace-down = { };
          "Mod+Up".action.focus-workspace-up = { };

          "Mod+Shift+Left".action.move-column-left = { };
          "Mod+Shift+Right".action.move-column-right = { };
          "Mod+Shift+Up".action.move-column-to-workspace-up = { };
          "Mod+Shift+Down".action.move-column-to-workspace-down = { };

          "Mod+Ctrl+Left".action.focus-monitor-left = { };
          "Mod+Ctrl+Right".action.focus-monitor-right = { };

          "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = { };
          "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = { };
        };
      };
    };
  }];
}
