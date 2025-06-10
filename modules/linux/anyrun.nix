{ config, pkgs, inputs, ... }: {

  environment.systemPackages =
    [ inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins ];

  home-manager.sharedModules = [{
    programs.anyrun = {
      enable = true;
      config = {
        x = { fraction = 0.5; };
        y = { fraction = 0.3; };
        width = { absolute = 700; };
        height = { absolute = 0; };

        layer = "overlay";

        closeOnClick = true;
        hideIcons = false;
        hidePluginInfo = false;
        ignoreExclusiveZones = false;
        showResultsImmediately = false;
        maxEntries = null;

        plugins = [
          inputs.anyrun.packages.${pkgs.system}.applications
          inputs.anyrun.packages.${pkgs.system}.dictionary
          inputs.anyrun.packages.${pkgs.system}.kidex
          inputs.anyrun.packages.${pkgs.system}.shell
          inputs.anyrun.packages.${pkgs.system}.rink
        ];

      };

      extraCss = ''
        @define-color foreground #ffffff;
        @define-color background #0a0c10;

        * {
          all: unset;
          font-size: 1.2rem;
        }

        #window {
          background: transparent;
        }

        #match,
        #entry,
        #plugin,
        #main {
          color: @foreground;
          background: @background;
        }

        #match.activatable {
          color: @background;
          background: @foreground;
          
          border-radius: 10px;
          padding: .3rem .9rem;
          margin-top: .01rem;
        }

        #match.activatable:first-child {
           margin-top: 9px;
        }

        #match.activatable:last-child {
           margin-bottom: 1px;
        }

        #plugin:hover #match.activatable {
          padding: .3rem;
          margin-top: .01rem;
          margin-bottom: 0;
        }

        #match:selected {
          color: @theme_selected_fg_color;
          background: @theme_selected_bg_color;
          border-radius: 8px;
        }

        #entry {
          border-radius: 8px;
          margin: .3rem;
          padding: .6rem 1.0rem;
          caret-color: white;
          font-size: 26px;
          font-weight: 500;
        }

        list > #plugin {
          border-top: 1px solid rgba(255,255,255,.11);
          margin: 0.3rem;
          padding-top: 4px;
          padding-left: 3px;
          font-weight: 400;
        }

        list > #plugin:first-child { 
          margin-top: .3rem;
        }

        list > #plugin:last-child { 
          margin-bottom: .3rem; 
        }

        list > #plugin:hover { 
          padding: .7rem; 
        }

        box#main {
          border-color: rgba(255,255,255,0.2);    
          color: white;
          border-width: 1px;
          border-style: solid;
          margin-top: 15px;
          background-color: rgba(0,0,0,0.6);
          border-radius: 22px;
          padding: .7rem;
        }

        zlabel#plugin {
          font-size:14px;
        }
      '';
    };
  }];
}
