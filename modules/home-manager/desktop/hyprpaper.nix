{ lib, config, ... }:

let
  cfg = config.hyprpaper;

in
{
  options = {
    hyprpaper.enable = lib.mkEnableOption "Enable hyprpaper";
  };

  config = lib.mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;
      settings = { 
        preload = [ "${../../../.assets/wallpapers/dark-bright-mountains.jpg}" ];
        wallpaper = [ ", ${../../../.assets/wallpapers/dark-bright-mountains.jpg}" ];
        #preload = [ "${./dark-bright-mountains.jpg}" ];
        #wallpaper = [ ", ${./dark-bright-mountains.jpg}" ];
      };
    };
  };
}
