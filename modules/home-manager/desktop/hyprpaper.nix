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
        wallpaper = {
            monitor = "";
            path = "${../../../.assets/wallpapers/dark-bright-mountains.jpg}";
            fit_mode = "cover";
        };
        splash = false;
      };
    };
  };
}
