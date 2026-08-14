{ config, ... }:

let
  dashboard-password = "$(cat ${config.age.secrets."traefik-dashboard-password.age".path})";

in
{
  services.traefik = {
    enable = true;
    environmentFiles = [ config.age.secrets."ionos-traefik-key.age".path ];
    staticConfigOptions = {
      log = {
        #level = "WARN";
        level = "DEBUG";
      };
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
        ionos = {
	  acme = {
	    email = "letsencrypt.stumbling188@silomails.com";
	    storage = "/var/lib/traefik/acme.json";
	    caServer = "https://acme-v02.api.letsencrypt.org/directory";
	    dnsChallenge = {
	      provider = "ionos";
	      resolvers = [ "1.1.1.1:53" "8.8.8.8:53" ];
	      propagation.delayBeforeChecks = 60;
	    };
	  };
	};
      };
    };
    dynamicConfigOptions = {
      http = {
	middlewares = {
	  auth = {
	    basicAuth = {
	      users = [ "light3r:${dashboard-password}" ];
	    };
	  };
	};
        routers = {
	  api = {
	    rule = "Host(`traefik.jacoposoria.it`)";
	    service = "api@internal";
	    middlewares = [ auth ];
	    entrypoints = [ "websecure" ];
	    tls.certResolver = "ionos";
	  };
        };
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
  age.secrets."ionos-traefik-key.age".file = "/Nixos/secrets/ionos-traefik-key.age";
  age.secrets."traefik-dashboard-password.age".file = "/Nixos/secrets/traefik-dashboard-password.age";
}
