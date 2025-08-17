{ config, pkgs, ... }:

let 
  nord9 = "#81A1C1";
  nord10 = "#5E81AC";
  nord11 = "#BF616A";
  nord13 = "#EBCB8B";
  nord14 = "#A3BE8C";

in {
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;
    settings = {
      "$schema" = "https:#github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
    
      logo = {
        source = "nixos";
        height = 15;
        width = 30;
        padding = {
          top = 10;
          left = 3;
        };
      };

      modules = [
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Hardware──────────────────────┐";
        }
        {
          type = "host";
          key = " PC";
          keyColor = nord14;
        }
        {
          type = "cpu";
          key = "│ ├";
          showPeCoreCount = true;
          keyColor = nord14;
        }
        {
          type = "gpu";
          key = "│ ├󰍛";
          keyColor = nord14;
        } 
        {
          type = "memory";
          key = "│ ├󰍛";
          keyColor = nord14;
        }
        {
          type = "swap";
          key = "│ ├󰓡";
          keyColor = nord14;
        }
        {
          type = "disk";
          key = "│ ├";
          keyColor = nord14;
        }
        {
          type = "display";
          key = "│ ├󰍹";
          keyColor = nord14;
        }
        {
          type = "sound";
          key = "└ └󰓃";
          keyColor = nord14;
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Software──────────────────────┐";
        }
        {
          type = "os";
          key = " OS";
          keyColor = nord13;
        }
        {
          type = "command";
          text = "echo \${USER}@\${HOSTNAME}";
          key = "│ ├";
          keyColor = nord13;
        }
        {
          type = "kernel";
          key = "│ ├";
          keyColor = nord13;
        }
        {
          type = "gpu";
          key = "│ ├󰍛";
          format = "{3}";
          keyColor = nord13;
        }
        {
          type = "packages";
          key = "└ └󰏖";
          keyColor = nord13;
        }  
        "break"
        {
          type = "de";
          key = " DE";
          keyColor = nord9;
        }
        {
          type = "wm";
          key = " WM";
          keyColor = nord9;
        }
        {
          type = "lm";
          key = "│ ├";
          keyColor = nord9;
        }  
        {
          type = "terminal";
          key = "│ ├";
          keyColor = nord9;
        }
        {
          type = "shell";
          key = "└ └";
          keyColor = nord9;
        } 
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌───────────────────────Themes───────────────────────┐";
        }
        
        {
          type = "theme";
          key = "󰉼 Theme";
          keyColor = nord10;
        }
        {
          type = "wmtheme";
          key = "│ ├󰉼";
          keyColor = nord10;
        }
        {
          type = "icons";
          key = "│ ├";
          keyColor = nord10;
        }
        {
          type = "cursor";
          key = "│ ├󰆿";
          keyColor = nord10;
        }
        {
          type = "font";
          key = "│ ├";
          keyColor = nord10;
        }
        {
          type = "terminalfont";
          key = "└ └";
          keyColor = nord10;
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌────────────────────Uptime / Age────────────────────┐";
        }
        {
          type = "command";
          key = "  OS Age";
          keyColor = nord11;
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "uptime";
          key = "  Uptime";
          keyColor = nord11;
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
	    ];
    };
  };
}
