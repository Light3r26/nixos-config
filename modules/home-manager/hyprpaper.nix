{ config, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = { 
      preload = "../../wallpapapers/dark-bright-mountains.jpg";
      wallpaper = ", ~/.config/backgrounds/bright-mountains.jpg";
    };
  };
}
