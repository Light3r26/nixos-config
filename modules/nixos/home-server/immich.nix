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
      extraConfig = ''
    	client_max_body_size 50000M;
    	proxy_read_timeout   600s;
    	proxy_send_timeout   600s;
    	send_timeout         600s;

    	proxy_redirect off;
    	proxy_set_header Host $host:$server_port;
    	proxy_set_header X-Real-IP $remote_addr;
    	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    	proxy_set_header X-Forwarded-Host $server_name;
    	proxy_set_header X-Forwarded-Proto $scheme;
      '';
    };
  };
}
