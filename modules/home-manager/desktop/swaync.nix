{ pkgs, ... }:

{
  services.swaync = {
    enable = true;
    package = pkgs.swaynotificationcenter;
  };
}
