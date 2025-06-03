{ config, lib, pkgs, ... }: {
  environment = {
    variables.EDITOR = "hx";
    shellAliases.x = "hx";
  };

  nixpkgs.overlays = [
    (self: super: {
      helix = super.helix.overrideAttrs (old: {
        src = self.fetchzip {
          url =
            "https://github.com/cull-os/helix/releases/download/ci-release-25.01.1/helix-ci-release-25.01.1-source.tar.xz";
          hash = "sha256-bvlzXRAdPvz8P49KENSw9gupQNaUm/+3eZZ1q7+fTsw=";
          stripRoot = false;
        };

        cargoDeps = self.rustPlatform.fetchCargoVendor {
          inherit (self.helix) src;
          hash = "sha256-soOnSRvWO7OzxYENFUBGmgSAk1Oy9Av+wDDLKkcuIbs=";
        };
      });
    })
  ];

  home-manager.sharedModules = [{

    programs.helix = {
      enable = true;
      settings.theme = "github_dark_high_contrast";
      settings.editor = {
        auto-completion = false;
        bufferline = "multiple";
        color-modes = false;
        cursorline = true;
        file-picker.hidden = false;
        idle-timeout = 0;
        line-number = "relative";
        text-width = 100;
      };

      settings.editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };

      settings.editor.statusline.mode = {
        insert = "INSERT";
        normal = "NORMAL";
        select = "SELECT";
      };

      settings.editor.indent-guides = {
        character = "▏";
        render = false;
      };

      settings.editor.whitespace = {
        characters.tab = "·";
        render.tab = "all";
      };
    };
  }];
}
