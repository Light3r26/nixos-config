{ config, pkgs-unstable, ... }:

{
  services.immich = {
    enable = true;
    package = pkgs-unstable.immich;
    host = "0.0.0.0";
    port = 2283;
    mediaLocation = "/storage/photos";
    openFirewall = true;
    database.createDB = true;
    redis.enable = true;
  };
}
