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
        #preload = [ "${../../../wallpapers/dark-bright-mountains.jpg}" ];
        #wallpaper = [ ", ${../../../wallpapers/dark-bright-mountains.jpg}" ];
        preload = [ "${./dark-bright-mountains.jpg}" ];
        wallpaper = [ ", ${./dark-bright-mountains.jpg}" ];
      };
    };
  };
}
