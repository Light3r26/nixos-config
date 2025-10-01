{ lib, config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    extraPackages = with pkgs; [ qt5.qtgraphicaleffects ];
    sugarCandyNix = {
      enable = true;
      settings = {
        Background = lib.cleanSource ../../wallpapers/dark-bright-mountains.jpg;
        ScreenWidth = 1920;
        ScreenHeight = 1080;
        FormPosition = "center";
        FullBlur = true;
        BlurRadius = 25;
        MainColor = "#999FAB";
        BackgroundColor = "#BBC1CD";#0A101C
        AccentColor = "#343A46";
        DateFormat = "dddd d MMMM";
        HeaderText = "";
        ForceHideCompletePassword = true;
      };
    };
  };
}
