{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "eucalyptus-drop";

  };

  environment.systemPackages = let themes = pkgs.callPackage ../../../pkgs/sddm-themes.nix {}; in [ 
    pkgs.libsForQt5.qt5.qtgraphicaleffects
    themes.sddm-eucalyptus-drop 
  ];
}

# Previous configuration with sddm-sugar-candy-nix flake
#Background = lib.cleanSource ../../../wallpapers/dark-bright-mountains.jpg;
#ScreenWidth = 1920;
#ScreenHeight = 1080;
#FormPosition = "center";
#FullBlur = true;
#BlurRadius = 25;
#MainColor = "#999FAB";
#BackgroundColor = "#BBC1CD";#0A101C
#AccentColor = "#343A46";
#DateFormat = "dddd d MMMM";
#HeaderText = "";
#ForceHideCompletePassword = true;
