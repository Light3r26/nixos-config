{ lib, config, ... }:

let
  cfg = config.forgejo;
  domain = "light3r.dev";

in
{
  options = {
    forgejo.enable = lib.mkEnableOption "Enable Forgejo";
  };

  config = lib.mkIf cfg.enable {
    services.forgejo = {
      enable = true;
      database.type = "postgres";
      lfs.enable = true; # Git Large File Storage
      settings = {
        server = {
          DOMAIN = "git.${domain}";
          ROOT_URL = "https://${domain}/"; 
          HTTP_PORT = 3000;
          SSH_PORT = lib.head config.services.openssh.ports;
        };

        # You can temporarily allow registration to create an admin user.
        service.DISABLE_REGISTRATION = false; 
      };
    };

    services.traefik.dynamicConfigOptions.http = {
      services.forgejo.loadbalancer.servers = [
        {
          url = "http://localhost:3000";
        }
      ];
      
      routers.forgejo = {
        rule = "host(`git.${domain}`)";
        tls.certresolver = "hostinger";
        service = "forgejo";
        entrypoints = [ "websecure" ];
      };
    };
  };
}
