{ config, pkgs, ... }:

{
  # Enable GTK
  gtk = {
    enable = true;
    theme = {
      package = pkgs.nordic;
      name = "nordic";
    };
  };

  # Enable QT
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      package = pkgs.nordic;
      name = "nordic";
    };
  };
}
