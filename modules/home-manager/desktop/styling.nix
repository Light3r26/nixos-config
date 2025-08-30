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
    style = {
      name = "kvantum";
    };
  };

  home.packages = with pkgs; [
    # Kvantum and its tools
    qt5.qtstyleplugin-kvantum
    qt5ct
    # Nordic QT theme package
    nordic-kde-theme
  ];

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=Nordic-Darker-Solid
  '';
}
