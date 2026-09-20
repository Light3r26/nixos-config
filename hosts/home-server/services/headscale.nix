{ config, lib, ... }:

let
  cfg = config.headscale;

in
{
  options = {
    headscale.enable = lib.mkEnableOption "Enable Headscale";
  };

  config = lib.mkIf cfg.enable {
    services.headscale = {
      enable = true;
      port = 3492;
      settings = {
        server_url = "https://headscale.light3r.dev";
        dns = {
          base_domain = "local";
          override_local_dns = false;
        };
        logtail.enabled = true;
      };
    };

    services.traefik.dynamicConfigOptions.http = {
      services.headscale.loadbalancer.servers = [
        {
          url = "http://localhost:3492";
        }
      ];
      
      routers.headscale = {
        rule = "host(`headscale.light3r.dev`)";
        tls.certresolver = "hostinger";
	      service = "headscale";
        entrypoints = [ "websecure" ];
      };
    };
  };
}
