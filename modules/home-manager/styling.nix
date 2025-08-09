{ config, pkgs, ... }:

{
  # Enable GTK
  gtk = {
    enable = true;
    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
  };

  # Enable QT
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      package = pkgs.utterly-nord-plasma;
      name = "Utterly Nord Plasma";
    };
  };
}
