{ config, pkgs, lib, ... }:

{
  # Enable GTK
  gtk = {
    enable = true;
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
    iconTheme = {
      package = pkgs.whitesur-icon-theme;
      name = "WhiteSur";
    };
    cursorTheme = {
      package = pkgs.whitesur-cursors;
      name = "WhiteSurCursors";
    };
    
  };

  # Enable QT
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      package = pkgs.nordic;
      name = "Nordic";
    };
  };
}
