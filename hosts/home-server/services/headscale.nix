{
  services.headscale = {
    enable = true;
    port = 3492;
    settings = {
      server_url = "https://headscale.jacoposoria.it";
      dns = {
        base_domain = "local";
      };
      logtail.enabled = true;
    };
  };

  services.traefik.dynamicConfigOptions.http = {
    services.headscale.loadBalancer.servers = [
      {
        url = "http://localhost:3492";
      }
    ];
    
    routers.headscale = {
      rule = "Host(`headscale.jacoposoria.it`)";
      tls = {
	certResolver = "ionos";
      };
      service = "headscale";
      entrypoints = [ "websecure" ];
    };
  };
}
