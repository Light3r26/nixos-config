{ config, pkgs-unstable, ... }:

{
  services.immich = {
    enable = true;
    package = pkgs-unstable.immich;
    host = "localhost";
    port = 2283;
    mediaLocation = "/storage/photos";
    openFirewall = true;
    database.createDB = true;
    redis.enable = true;
  };
}
