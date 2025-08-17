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
      name = "White Sur";
      #package = pkgs.nordzy-icon-theme;
      #name = "Nordzy";
    };
    cursorTheme = {
      package = pkgs.nordzy;
      name = "Nordzy";
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
