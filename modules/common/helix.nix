{ config, lib, pkgs, ... }: {
  environment = {
    variables.EDITOR = "hx";
    shellAliases.x = "hx";
  };

  environment.systemPackages = with pkgs; [
    vscode-langservers-extracted
    markdown-oxide
    nixfmt-rfc-style
    nil
    rust-analyzer-nightly
    lldb
    yaml-language-server
    zls
    jdt-language-server
  ];

  home-manager.sharedModules = [{

    programs.helix = {
      enable = true;

      settings.theme = "github_dark_high_contrast";

      settings.editor = {
        auto-format = true;
        auto-completion = true;
        bufferline = "never";
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

      languages = {
        language-server = {
          rust-analyzer = {
            config = {
              cargo.features = "all";
              check.command = "clippy";
              completion.callable.snippets = "add_parentheses";
            };
          };
          roc-ls = { command = "roc_language_server"; };
        };

        language = [
          {
            name = "rust";
            auto-format = true;
          }
          {
            name = "java";
            auto-format = true;
          }
          {
            name = "html";
            auto-format = true;
          }
          {
            name = "css";
            auto-format = true;
          }
          {
            name = "markdown";
            auto-format = true;
          }
          {
            name = "yaml";
            auto-format = true;
          }
          {
            name = "nix";
            auto-format = true;
            formatter.command = "nixfmt";
          }
          {
            name = "roc";
            scope = "source.roc";
            injection-regex = "roc";
            file-types = [ "roc" ];
            shebangs = [ "roc" ];
            auto-format = true;
            comment-token = "#";
            roots = [ ];
            indent = {
              tab-width = 2;
              unit = "  ";
            };
            language-servers = [ "roc-ls" ];
            formatter.command = "roc";
            formatter.args = [ "format" "--stdin" "--stdout" ];
          }
        ];

        grammar = [{
          name = "roc";
          source = {
            git = "https://github.com/faldor20/tree-sitter-roc.git";
            rev = "0b1afe88161cbd81f5ddea1bb4fa786314ed49a7";
          };
        }];
      };
    };
  }];
}
