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
    # Required for the Kvantum style engine.
    libsForQt5.qtstyleplugin-kvantum
  ];

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Nordic-Darker-Solid
    '';

    "Kvantum/Nordic".source = "${pkgs.nordic}/share/Kvantum/Nordic";
  };
}
