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
        PartialBlur = true;
        BlurRadius = 50;
        MainColor = "#3B414D";
        BackgroundColor = "#8D939F";
        AccentColor = "#999FAB";
      };
    };
  };
}
