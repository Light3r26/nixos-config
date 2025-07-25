{ lib, config, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = { 
      preload = [ "../../wallpapapers/dark-bright-mountains.jpg" ];
      wallpaper = [ ", ../../wallpapers/dark-bright-mountains.jpg" ];
    };
  };
}
