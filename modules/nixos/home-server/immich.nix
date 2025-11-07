{ config, pkgs, ... }:

{
  services.immich = {
    enable = true;
    package = pkgs.immich;
    port = 2283;
    mediaLocation = "/mnt/home-pool/photos";
    openFirewall = true;
    database.createDB = true;
    redis.enable = true;
  };
}
