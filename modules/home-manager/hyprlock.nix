{ lib, config, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
      };

      background = {
        monitor = "";
        #path = "${../../wallpapers/dark-bright-mountains.jpg}";
        path = "screenshot";
        blur_passes = 1;
        blur_size = 8;
        contrast = 0.8916;
        brightness = 0.8916;
        vibrancy = 0.8916;
        vibrancy_darkness = 0.0;
      };

      label = [
        # Time
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<span>$(date +"%H:%M")</span>"'';
          color = "rgba(216, 222, 233, 0.80)";
          font_size = 60;
          font_family = "SF Pro Display Bold";
          position = "35, 80";
          valign = "center";
          halign = "center";
        } 
        # Day-Month-Date
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
          color = "rgba(216, 222, 233, .80)";
          font_size = 19;
          font_family = "SF Pro Display Bold";
          position = "35, 30";
          halign = "center";
          valign = "center";
        }
        # USER
        {
          monitor = "";
          text = "    $USER";
          color = "rgba(216, 222, 233, 0.80)";
          outline_thickness = 0;
          dots_size = 0.2 ;
          dots_spacing = 0.2 ;
          dots_center = true;
          font_size = 16;
          font_family = "SF Pro Display Bold";
          position = "38, -60";
          halign = "center";
          valign = "center";
        }
      ];
      
      # USER-BOX
      shape = {
        monitor = "";
        size = "320, 55";
        color = "rgba(255, 255, 255, 0.1)";
        rounding = -1;
        border_size = 0;
        border_color = "rgba(255, 255, 255, 1)";
        rotate = 0;
        xray = false;
        position = "34, -60";
        halign = "center";
        valign = "center";
      };
      
      # INPUT FIELD
      input-field = {
        monitor = "";
        size = "320, 55";
        outline_thickness = 0;
        dots_size = 0.2 ;
        dots_spacing = 0.2 ;
        dots_center = true;
        outer_color = "rgba(255, 255, 255, 0)";
        inner_color = "rgba(255, 255, 255, 0.1)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = false;
        font_family = "SF Pro Display Bold";
        placeholder_text = ''<i><span foreground="##ffffff99"> Inserisci Password </span></i>'';
        hide_input = false;
        position = "34, -130";
        halign = "center";
        valign = "center";
      };
    };
  };
}
