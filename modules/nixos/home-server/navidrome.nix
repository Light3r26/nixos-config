{ lib, ... }:

{
  systemd.services.navidrome.serviceConfig.ProtectHome = lib.mkForce "read-only";
  systemd.services.navidrome.serviceConfig.ReadWritePaths = [ "/mnt/home-pool/music" ];

  services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/mnt/home-pool/music";
      Address = "127.0.0.1";
      BaseUrl = "/";
    };

    openFirewall = true;
  }; 	

  services.nginx.virtualHosts."music.jacoposoria.qzz.io" = {
    serverName = "music.jacoposoria.qzz.io";
    listen = [ { addr = "127.0.0.1"; port = 80; } ];
    locations."/" = {
      proxyPass = "http://127.0.0.1:4533";
      proxyWebsockets = true;
    };
  };
}
