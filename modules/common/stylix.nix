{ config, lib, inputs, pkgs, ... }: {

  programs.dconf.enable = true;

  home-manager.sharedModules = [{
    imports = [ inputs.stylix.homeModules.stylix ];

    stylix = {
      enable = true;
      targets.gtk = {
        enable = true;
        extraCss = ''
          * {
            border-radius: 0px;
          };
          window.background { border-radius: 0px; }
        '';
      };
      cursor = {
        name = "apple-cursor";
        package = pkgs.apple-cursor;
        size = 17;
      };
      fonts = {
        serif = { name = "Berkeley Mono"; };
        sansSerif = { name = "Berkeley Mono"; };
        monospace = { name = "Berkeley Mono"; };
        emoji = {
          name = "Symbols Nerd Font";
          package = pkgs.nerd-fonts.symbols-only;
        };
      };
      polarity = "dark";
      base16Scheme = {
        base00 = "#0a0c10"; # default background
        base01 = "#0a0c10"; # ligher background
        base02 = "#2672f3"; # selection background - fix
        base03 = "#6e7681"; # comments, invisibles, line highlighting
        base04 = "#f0f6fc"; # dark foreground, caret, delimiters, operators
        base05 = "#f0f6fc"; # default foreground
        base06 = "#f0f6fc"; # light foreground
        base07 = "#eeeeee"; # light background
        base08 = "#f0f3f6"; # variables
        base09 = "#ffb757"; # integers, booleans, constants, xml attributes
        base0A = "#ffb757"; # classes, markup bold, search text background
        base0B =
          "#addcff"; # strings, inherited class, markup code, diff inserted
        base0C = "#ffb757"; # support, regular, escape characters
        base0D = "#ddb7ff"; # functions, methods
        base0E = "#ff9492"; # keywords, storage, selector
        base0F = "#3D2F00"; # deprecated, opening/closing tags
      };
    };
  }];
}
