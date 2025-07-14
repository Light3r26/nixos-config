{ config, pkgs, ... }:

{
  # Enable QT
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
  };

  # Enable GTK
  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };
  };
}
