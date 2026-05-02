{ lib, config, pkgs, ... }:

let
  cfg = config.styling;

in
{
  options = {
    styling.enable = lib.mkEnableOption "Enable GTK and QT styling";
  };

  config = lib.mkIf cfg.enable {
    # Enable GTK
    gtk = {
      enable = true;
      gtk4.theme = null;
      theme = {
        package = pkgs.nordic;
        name = "Nordic";
      };
      iconTheme = {
        package = pkgs.kora-icon-theme;
        name = "kora-pgrey";
      };
      cursorTheme = {
        package = pkgs.whitesur-cursors;
        name = "WhiteSur-cursors";
        size = 24;
      };
      
    };

    # Enable QT
    qt = {
      enable = true;
      platformTheme.name = "qtct";
      #style = {
      #  name = "kvantum";
      #};
    };
  };
}
