{ pkgs, lib, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    extraPackages = [
      pkgs.kdePackages.qt5compat
    ];
    theme = "eucalyptus-drop";
    settings = {
      Background = lib.cleanSource ../../../wallpapers/dark-bright-mountains.jpg;
      ScreenWidth = 1920;
      ScreenHeight = 1080;
      FormPosition = "center";
      FullBlur = true;
      BlurRadius = 25;
      MainColour = "#999FAB";
      BackgroundColour = "#BBC1CD";#0A101C
      AccentColour = "#343A46";
      DateFormat = "dddd d MMMM";
      HeaderText = "";
      ForceHideCompletePassword = true;
    };
  };

  environment.systemPackages = let themes = pkgs.callPackage ../../../pkgs/sddm-themes.nix {}; in [ 
    themes.sddm-eucalyptus-drop 
  ];
}

# Previous configuration with sddm-sugar-candy-nix flake
