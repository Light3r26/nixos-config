{ lib, config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    sugarCandyNix = {
      enable = true;
      settings = {
        Background = lib.cleanSource ./bright-mountains.jpg;
        ScreenWidth = 1920;
        ScreenHeight = 1080;
        FormPosition = "center";
        FullBlur = true;
        BlurRadius = 25;
        MainColor = "#0A101C";
        BackgroundColor = "#222834";
        AccentColor = "#999FAB";
      };
    };
  };
}
