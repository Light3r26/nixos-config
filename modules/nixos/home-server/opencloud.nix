{ lib, config, ... }:

let
  cfg = config.opencloud;

in
{
  options = {
    opencloud.enable = lib.mkEnableOption "Enable opencloud";
  };

  config = lib.mkIf cfg.enable {
    services.opencloud = {
      enable = true;
      url = "https://drive.jacoposoria.qzz.io";
      address = 127.0.0.1;
      port = 9200;
      environment = {
	PROXY_TLS = "false"; # Disables https when behind reverse proxy
	INITIAL_ADMIN_PASSWORD = "password";
      };
    };

    services.nginx.virtualHosts."drive.jacoposoria.qzz.io" = {
      serverName = "cloud.jacoposoria.qzz.io";
      listen = [ { addr = "127.0.0.1"; port = 80; } ];
      locations."/" = {
        proxyPass = "http://127.0.0.1:9200";
        proxyWebsockets = true;
      };
    };
  };
}
