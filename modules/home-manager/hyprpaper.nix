{ lib, config, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = { 
      preload = [ "/Nixos/wallpapers/dark-bright-mountains.jpg" ];
      wallpaper = [ ", /Nixos/wallpapers/dark-bright-mountains.jpg" ];
    };
  };
}
