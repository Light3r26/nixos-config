{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];
  
  # Enable QT
  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = {
      package = pkgs.utterly-nord-plasma;
      name = "Utterly Nord Plasma";
    };
  };

  # Enable GTK
  #gtk = {
  #  enable = true;
  #  theme = {
  #    package = pkgs.adw-gtk3;
  #    name = "adw-gtk3-dark";
  #  };
  #};
}
