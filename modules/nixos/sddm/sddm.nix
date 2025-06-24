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
        BlurRadius = 50;
        MainColor = "#343A46";
        BackgroundColor = "#BBC1CD";#0A101C
        AccentColor = "#999FAB";
        HourFormat = "long";
        DateFormat = "dddd d MMMM";
        HeaderText = "";
      };
    };
  };
}
