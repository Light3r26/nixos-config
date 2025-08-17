{ config, ... } :

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = { 
        layer = "top";
        position = "top";
        height = 50;
        spacing = 0;
      

        modules-left = [ "custom/info" "cpu" "memory" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "network" "battery" "bluetooth" "pulseaudio" "clock" "custom/lock" "custom/power" ];
    
        "custom/info" = {
          format = "     ";
          on-click = "sh -c '\${TERMINAL:-kitty} sh -c \"fastfetch; echo; read -p \\\"Premi invio per uscire...\\\"\"'";
        };
     
        "hyprland/workspaces" = {
          disable-scroll = false;
          all-outputs = true;
          format = "{icon}";
          on-click = "activate";
        };
     
        "custom/lock" = {
          "format" = "<span color='#dcdfe1'>    </span>";
          "on-click" = "hyprlock";
          "tooltip" = true;
        };
             
        "custom/power" = {
          format = "<span color='#FF4040'>    </span>";
          on-click = "wlogout -b 5 -r 1";
          tooltip = true;
        };
     
        network = {
          format-wifi = "<span color='#00FFFF'> 󰖩  </span>{essid} ";
          format-ethernet = "<span color='#7FFF00'>   </span>Wired ";
          tooltip-format = "<span color='#FF1493'> 󰅧  </span>{bandwidthUpBytes}  <span color='#00BFFF'> 󰅢 </span>{bandwidthDownBytes}";
          format-linked = "<span color='#FFA500'> 󱘖  </span>{ifname} (No IP) ";
          format-disconnected = "<span color='#FF4040'>   </span>Disconnected ";
          format-alt = "<span color='#00FFFF'> 󰖩  </span>{signalStrength}% ";
          interval = 1;
        };
     
        battery = {
          states = {
            warning = 30;
            critical = 15;
        };
          format = "<span color='#28CD41'> {icon}  </span>{capacity}% ";
          format-charging = " 󱐋 {capacity}% ";
	        interval = 1;
          format-icons = [ "" "" "" "" "" ];
          tooltip = true;
        };
     
        pulseaudio = {
          format = "<span color='#dcdfe1'>{icon} </span>{volume}% ";
          format-muted = "<span color='#dcdfe1'> 󰖁 </span>0% ";
          format-icons = {
            headphone = "<span color='#dcdfe1'>  </span>";
            hands-free = "<span color='#dcdfe1'>  </span>";
            headset = "<span color='#dcdfe1'>  </span>";
            phone = "<span color='#dcdfe1'>  </span>";
            portable = "<span color='#dcdfe1'>  </span>";
            car = "<span color='#dcdfe1'>  </span>";
            default = [
              "<span color='#dcdfe1'>  </span>"
              "<span color='#dcdfe1'>  </span>"
              "<span color='#dcdfe1'>  </span>"
            ];
          };
          on-click-right = "pavucontrol";
          on-click = "pactl -- set-sink-mute 0 toggle";
          tooltip = true;
        };
     
        "custom/temperature" = {
          exec = "sensors | awk '/^Package id 0:/ {print int($4)}'";
          format = "<span color='#FFA500'> </span>{}°C ";
          interval = 5;
          tooltip = true;
          tooltip-format = "Temperatura CPU : {}°C";
        };
     
        memory = {
          format = "<span color='#dcdfe1'>   </span>{used:0.1f}G/{total:0.1f}G ";
          tooltip = true;
          tooltip-format = "Utilizzo RAM: {used:0.2f}G/{total:0.2f}G";
        };
     
        cpu = {
          format = "<span color='#dcdfe1'>   </span>{usage}% ";
          tooltip = true;
          };
       
        clock = {
          interval = 1;
          timezone = "Europe/Rome";
          format = "<span color='#dcdfe1'>  </span> {:%H:%M} ";
          tooltip = true;
          tooltip-format = "{:L%A %d/%m/%Y}";
        };
     
        tray = {
          icon-size = 17;
          spacing = 6;
        };
     
        backlight = {
          device = "intel_backlight";
          format = "<span color='#FFD700'>{icon}</span>{percent}% ";
          tooltip = true;
          format-icons = [
            "<span color='#696969'> 󰃞 </span>"
            "<span color='#A9A9A9'> 󰃝 </span>"
            "<span color='#FFFF66'> 󰃟 </span>"
            "<span color='#FFD700'> 󰃠 </span>"
          ];
        };
     
        bluetooth = {
          on-click = "blueman-manager";
          format = "<span color='#00BFFF'>  </span>{status} ";
          format-connected = "<span color='#00BFFF'>  </span>{device_alias} ";
          format-connected-battery = "<span color='#00BFFF'>  </span>{device_alias} {device_battery_percentage}% ";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        };
      };
    };

    style = ''
      * {
        font-family: "CaskaydiaCove Nerd Font", "Font Awesome 6 Free", "Font Awesome 6 Free Solid";
        font-weight: bold;
        font-size: 16px;
        color: #dcdfe1;
      }

      /* Waybar */
      #waybar {
        background-color: rgba(0, 0, 0, 0);
        border: none;
        box-shadow: none;
      }

      /* Workspaces */
      #workspaces,
      #window,
      #tray{
        background-color: #323844;
        padding: 4px 6px; 
        margin-top: 6px; 
        margin-left: 6px;
        margin-right: 6px;
        border-radius: 10px;
        border-width: 0px;
      }
      
      #custom-info {
        font-size: 18px;
        color: #5178C4;
      }
      
      #clock,
      #custom-power,
      #memory{
        background-color: #323844;
        margin-top: 6px; 
        margin-right: 6px;
        /*margin-bottom: 4px;*/
        padding: 4px 2px; 
        border-radius: 0 10px 10px 0;
        border-width: 0px;
      }
      
      #network,
      #custom-lock,
      #custom-info{
        background-color: #323844;
        margin-top: 6px; 
        margin-left: 6px;
        /*margin-bottom: 4px;*/
        padding: 4px 2px;
        border-radius: 10px 0 0 10px;
        border-width: 0px;
      }
      
      #custom-reboot,
      #bluetooth,
      #battery,
      #pulseaudio,
      #backlight,
      #custom-temperature,
      #memory,
      #cpu,
      #custom-info{
        background-color: #323844;
        margin-top: 6px; 
        /*margin-bottom: 4px;*/
        padding: 4px 2px; 
        border-width: 0px;
      }
      
      #custom-temperature.critical,
      #pulseaudio.muted {
        color: #FF0000;
        padding-top: 0;
      }
      
      #bluetooth:hover,
      #network:hover,
      /*#tray:hover,*/
      #backlight:hover,
      #battery:hover,
      #pulseaudio:hover,
      #custom-temperature:hover,
      #memory:hover,
      #cpu:hover,
      #clock:hover,
      #custom-lock:hover,
      #custom-reboot:hover,
      #custom-power:hover,
      #custom-info:hover,
      /*#workspaces:hover,*/
      #window:hover {
        background-color: rgba(70, 75, 90, 0.9);
      }
      
      #workspaces button:hover{
        background-color: rgba(97, 175, 239, 0.2);
        padding: 2px 8px;
        margin: 0 2px;
        border-radius: 10px;
      }
      
      #workspaces button.active {
        background-color: #151B27;
        /*background-color: #AEB4C0;*/
        color: #ffffff;
        padding: 2px 8px;
        margin: 0 2px;
        border-radius: 10px;
      }
      
      #workspaces button {
        background: transparent;
        border: none;
        color: #888888;
        padding: 2px 8px;
        margin: 0 2px;
        font-weight: bold;
      }
      
      #window {
        font-weight: 500;
        font-style: italic;
      }
    '';
  };
}
