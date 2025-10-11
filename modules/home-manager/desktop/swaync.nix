{ pkgs, ... }:

{
  services.swaync = {
    enable = false;
    package = pkgs.swaynotificationcenter;
  };

  home.packages = [
    pkgs.swaynotificationcenter
    pkgs.libnotify
  ];
}
