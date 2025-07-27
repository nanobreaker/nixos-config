{ inputs, config, lib, pkgs, ... }: {
  environment = { shellAliases.x = "hx"; };

  home-manager.sharedModules = [{

    programs.helix = {
      enable = true;
      defaultEditor = true;

      extraPackages = [
        pkgs.vscode-langservers-extracted
        pkgs.markdown-oxide
        pkgs.nixfmt-rfc-style
        pkgs.nil
        pkgs.rust-analyzer-nightly
        pkgs.lldb
        pkgs.yaml-language-server
        pkgs.zls
        pkgs.deno
        pkgs.jdt-language-server
        pkgs.taplo
      ];

      settings = {
        theme = lib.mkForce "stylix-custom";
        editor = {
          auto-format = true;
          auto-completion = true;
          bufferline = "never";
          color-modes = false;
          cursorline = true;
          file-picker.hidden = false;
          idle-timeout = 0;
          line-number = "relative";
          text-width = 140;

          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };

          statusline.mode = {
            insert = "INSERT";
            normal = "NORMAL";
            select = "SELECT";
          };

          indent-guides = {
            character = "▏";
            render = false;
          };

          whitespace.render = {
            tab = "all";
            space = "all";
          };

          whitespace.characters = {
            tab = "·";
            space = "·";
          };
        };

        keys.normal = {
          C-c = ":clipboard-yank";
          C-v = ":clipboard-paste-after";
          "C-/" = "toggle_comments";
        };
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
          jdtls = { command = "jdtls"; };
        };

        language = [
          {
            name = "rust";
            auto-format = true;
          }
          {
            name = "java";
            auto-format = true;
            language-servers = [ "jdtls" ];
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
            name = "scss";
            auto-format = true;
          }
          {
            name = "javascript";
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
            name = "json";
            auto-format = true;
          }
          {
            name = "jsonc";
            auto-format = true;
          }
          {
            name = "toml";
            auto-format = true;
          }
          {
            name = "nix";
            auto-format = true;
            formatter.command = "nixfmt";
            language-servers = [ "nil" ];
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

      themes = {
        stylix-custom = {
          inherits = "stylix";

          "ui.linenr" = "#ffb757";
          "ui.virtual.whitespace" = "#231f20";
        };
      };
    };
  }];
}
