{ lib, config, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = { 
      preload = [ "${../../../wallpapers/dark-bright-mountains.jpg}" ];
      wallpaper = [ ", ${../../../wallpapers/dark-bright-mountains.jpg}" ];
    };
  };
}
