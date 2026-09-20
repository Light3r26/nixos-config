{ config, lib, ... }:

let
  cfg = config.traefik;

in
{
  options = {
    traefik.enable = lib.mkEnableOption "Enable Traefik reverse proxy";
  };

  config = lib.mkIf cfg.enable {
    services.traefik = {
      enable = true;
      environmentFiles = [ config.age.secrets."hostinger-traefik-key.age".path ];
      staticConfigOptions = {
        log.level = "WARN";
        api = {};
        entrypoints = {
          web = {
            address = ":80";
            http.redirections.entryPoint = {
             to = "websecure";
             scheme = "https";
            };
          };
          websecure = {
            address = ":443";
          };
        };
        certificatesResolvers = {
          hostinger = {
            acme = {
              email = "letsencrypt.headband594@silomails.com";
              storage = "/var/lib/traefik/acme.json";
              caServer = "https://acme-v02.api.letsencrypt.org/directory";
              dnsChallenge = {
                provider = "hostinger";
                resolvers = [ "1.1.1.1:53" "8.8.8.8:53" ];
                propagation.delayBeforeChecks = 60;
              };
            };
          };
        };
      };
      dynamicConfigOptions = {
        http = {
          #middlewares = {
          #};
          routers = {
            api = {
              rule = "Host(`traefik.light3r.dev`)";
              service = "api@internal";
              #middlewares = [ "auth" ];
              entrypoints = [ "websecure" ];
              tls.certResolver = "hostinger";
            };
          };
        };
      };
    };

    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}
