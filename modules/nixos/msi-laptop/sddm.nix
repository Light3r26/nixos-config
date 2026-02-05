{ pkgs, ... }:

let
  base-eucalyptus-drop = pkgs.callPackage ../../../pkgs/sddm-themes.nix { };
  
  custom-eucalyptus-drop = pkgs.stdenv.mkDerivation {
    name = "eucalyptus-drop-customized";
    src = base-eucalyptus-drop.sddm-eucalyptus-drop;
    installPhase = ''
      mkdir -p $out/share/sddm/themes/eucalyptus-drop
      cp -r $src/share/sddm/themes/eucalyptus-drop/* $out/share/sddm/themes/eucalyptus-drop/
      chmod +w $out/share/sddm/themes/eucalyptus-drop/theme.conf
      
      cat <<EOF > $out/share/sddm/themes/eucalyptus-drop/theme.conf
      Background="/Nixos/wallpapers/dark-bright-mountains.jpg"
      MainColour="#999FAB"
      AccentColour="#343A46"
      BackgroundColour="#BBC1CD"
      FormPosition="center"
      FullBlur="true"
      BlurRadius="25"
      EOF
    '';
  };

in
{
  #environment.systemPackages = let themes = pkgs.callPackage ../../../pkgs/sddm-themes.nix {}; in [ 
  #themes.sddm-eucalyptus-drop 
  #];
  environment.systemPackages = [ custom-eucalyptus-drop ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    extraPackages = [
      pkgs.kdePackages.qt5compat
    ];
    theme = "eucalyptus-drop";
    #settings = {
      #General = {
        #Background = "/Nixos/wallpapers/dark-bright-mountains.jpg";
        #ScreenWidth = 1920;
        #ScreenHeight = 1080;
      #};
    # BlurSettings = {
    #   FullBlur = true;
    #   BlurRadius = 25;
    # };
    # DesignCustomisation = {
    #   FormPosition = "center";
    #   MainColour = "#999FAB";
    #   AccentColour = "#343A46";
    #   BackgroundColour = "#BBC1CD";
    # };
    # InterfaceBehaviour = {
    #   ForceHideCompletePassword = true;
    # };
    # LocaleSettings = {
    #   DateFormat = "dddd d MMMM";
    # };
    # Translations = {
    #   HeaderText = "";
    # };
    #};
  };
}
