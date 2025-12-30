{ config, ... }:

{
  services.searx = {
    enable = true;
    redisCreateLocally = true;
    settings.server = {
      bind_address = "127.0.0.1";
      port = 5313;
      secret_key = builtins.readFile config.age.secrets."searx-key.age".path;
    };
  };

  age.secrets."searx-key.age" = {
    file = "/Nixos/secrets/searx-key.age";
    mode = "0640";
  };


  services.nginx.virtualHosts."search.jacoposoria.qzz.io" = {
    serverName = "search.jacoposoria.qzz.io";
    listen = [ { addr = "127.0.0.1"; port = 80; } ];
    locations."/" = {
      proxyPass = "http://127.0.0.1:5313";
      proxyWebsockets = true;
    };
  };
}
