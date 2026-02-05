{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    extraPackages = [
      pkgs.kdePackages.qt5compat
    ];
    theme = "eucalyptus-drop";
    settings = {
      General = {
        Background = "/Nixos/wallpapers/dark-bright-mountains.jpg";
        ScreenWidth = 1920;
        ScreenHeight = 1080;
      };
      BlurSettings = {
        FullBlur = true;
        BlurRadius = 25;
      };
      DesignCustomisation = {
        FormPosition = "center";
        MainColour = "#999FAB";
        AccentColour = "#343A46";
        BackgroundColour = "#BBC1CD";
      };
      InterfaceBehaviour = {
        ForceHideCompletePassword = true;
      };
      LocaleSettings = {
        DateFormat = "dddd d MMMM";
      };
      Translations = {
        HeaderText = "";
      };
    };
  };

  environment.systemPackages = let themes = pkgs.callPackage ../../../pkgs/sddm-themes.nix {}; in [ 
    themes.sddm-eucalyptus-drop 
  ];
}

# Previous configuration with sddm-sugar-candy-nix flake
