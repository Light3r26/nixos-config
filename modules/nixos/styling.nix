{ config, pkgs, ... }:

{
  #environment.systemPackages = with pkgs; [
  #  libsForQt6.qtstyleplugin-kvantum
  #  libsForQt6.qt6ct
  #];

  # Enable QT
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style = {
      package = pkgs.utterly-nord-plasma;
      name = "Utterly Nord Plasma";
    };
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
