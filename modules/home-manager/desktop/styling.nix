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
  };
}
