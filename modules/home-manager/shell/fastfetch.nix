{ config, ... } =

{
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https:#github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    
      logo = {
        source = "nixos";
        height = 15;
        width = 30;
        padding = {
          top = 10;
          left = 3;
        }
    }

    modules = [
        "break"
        {
            type = "custom";
            format = "┌──────────────────────Hardware──────────────────────┐";
        }
        {
            type = "host";
            key = " PC";
            keyColor = "#A3BE8C"; #nord14
        }
        {
            type = "cpu";
            key = "│ ├";
            showPeCoreCount = true;
            keyColor = "#A3BE8C"; #nord14
        }
        {
            type = "gpu";
            key = "│ ├󰍛";
            keyColor = "#A3BE8C"; #nord14
        } 
        {
            type = "memory";
            key = "│ ├󰍛";
            keyColor = "#A3BE8C"; #nord14
        }
        {
            type = "swap";
            key = "│ ├󰓡";
            keyColor = "#A3BE8C"; #nord14
        }
        {
            type = "disk";
            key = "│ ├";
            keyColor = "#A3BE8C"; #nord14
        }
        {
            type = "display";
            key = "│ ├󰍹";
            keyColor = "#A3BE8C"; #nord14
        }
        {
            type = "sound";
            key = "└ └󰓃";
            keyColor = "#A3BE8C"; #nord14
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
            keyColor = "#EBCB8B"; #nord13
        }
        {
            type = "command";
            text = "echo ${USER}@${HOSTNAME}";
            key = "│ ├";
            keyColor = "#EBCB8B"; #nord13
        }
        {
            type = "kernel";
            key = "│ ├";
            keyColor = "#EBCB8B"; #nord13
        }
        {
            type = "gpu";
            key = "│ ├󰍛";
            format = "{3}";
            keyColor = "#EBCB8B"; #nord13
        }
        {
            type = "packages";
            key = "└ └󰏖";
            keyColor = "#EBCB8B"; #nord13
        }  
        "break"
        {
            type = "de";
            key = " DE";
            keyColor = "#81A1C1"; #nord9
        }
        {
            type = "wm";
            key = " WM";
            keyColor = "#81A1C1"; #nord9
        }
        {
            type = "lm";
            key = "│ ├";
            keyColor = "#81A1C1"; #nord9
        }  
        {
            type = "terminal";
            key = "│ ├";
            keyColor = "#81A1C1"; #nord9
        }
        {
            type = "shell";
            key = "└ └";
            keyColor = "#81A1C1"; #nord9
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
            keyColor = "#5E81AC"; #nord10
        }
        {
            type = "wmtheme";
            key = "│ ├󰉼";
            keyColor = "#5E81AC"; #nord10
        }
        {
            type = "icons";
            key = "│ ├";
            keyColor = "#5E81AC"; #nord10
        }
        {
            type = "cursor";
            key = "│ ├󰆿";
            keyColor = "#5E81AC"; #nord10
        }
        {
            type = "font";
            key = "│ ├";
            keyColor = "#5E81AC"; #nord10
        }
        {
            type = "terminalfont";
            key = "└ └";
            keyColor = "#5E81AC"; #nord10
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
            keyColor = "#BF616A"; #nord11
            text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
            type = "uptime";
            key = "  Uptime";
            keyColor = "#BF616A"; #nord11
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
