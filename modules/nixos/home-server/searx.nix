{ config, ... }:

{
  services.searx = {
    enable = true;
    settings.server = {
      bind_address = "127.0.0.1";
      port = 5313;
      secret_key = "%d/searx-key";
    };
  };

  age.secrets."searx-key.age".file = "/Nixos/secrets/searx-key.age";
  systemd.services.searx = {
    serviceConfig.LoadCredential = [
      "searx_key:${config.age.secrets.searx-key.path}"
    ];
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
