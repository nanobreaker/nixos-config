{ self, config, lib, pkgs, ... }: {
  home-manager.sharedModules = [{
    programs.nushell = {
      enable = true;
      configFile.text = ''
        $env.config.show_banner = false
        $env.config.buffer_editor = 'hx'
        $env.config.table.mode = 'none'

        $env.PROMPT_INDICATOR = " |> "
        $env.PROMPT_COMMAND = {
          let path = ($env.PWD | path split)
          let prompt = (
            match $path {
              ['/'] => {
                $"/"
              },
              ['/', $y] => {
                $"/($y)"
              },
              ['/', $x, $y] => {
                $"/($x)/($y)"
              },
              _ => {
                let xy = ($path | last 2)
                let x = ($xy | first)
                let y = ($xy | last)
                $"~/($x)/($y)"
              }
            }
          )

          $"(ansi yellow)($prompt)"
        }

        alias ll = ls -la
        alias fg = job unfreeze
      '';

      envFile.text = "\n";
    };
  }];
}
