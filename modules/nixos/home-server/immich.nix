{ config, pkgs-unstable, ... }:

{
  services.immich = {
    enable = true;
    package = pkgs-unstable.immich;
    port = 2283;
    mediaLocation = "/mnt/home-pool/photos";
    openFirewall = true;
    database.createDB = true;
    redis.enable = true;
  };

  services.nginx.virtualHosts."photos.jacoposoria.qzz.io" = {
    serverName = "photos.jacoposoria.qzz.io";
    listen = [ { addr = "127.0.0.1"; port = 80; } ];
    locations."/" = {
      proxyPass = "http://[::1]:${toString config.services.immich.port}";
      proxyWebsockets = true;
      #recommendedProxySettings = true;
    };
  };
}
