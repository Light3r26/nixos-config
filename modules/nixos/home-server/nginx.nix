{ config, ... }:

{
  services.nginx = {
    enable = true;
    virtualHosts = {
      "jacoposoria.qzz.io" = {
        serverName = "jacoposoria.qzz.io";
        root = "/var/www/jacoposoria.qzz.io";
        listen = [ { addr = "127.0.0.1"; port = 80; } ];
      };
      "music.jacoposoria.qzz.io" = {
        serverName = "music.jacoposoria.qzz.io";
        listen = [ { addr = "127.0.0.1"; port = 80; } ];
        locations."/" = {
      	  proxyPass = "http://127.0.0.1:4533";
      	  proxyWebsockets = true;
    	    extraConfig = ''
  	        proxy_redirect off;
            proxy_set_header Host $host:$server_port;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Host $server_name;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };
      };
      "photos.jacoposoria.qzz.io" = {
        #enableACME = true;
        #forceSSL = true;
        serverName = "photos.jacoposoria.qzz.io";
        listen = [ { addr = "127.0.0.1"; port = 80; } ];
        locations."/" = {
          proxyPass = "http://127.0.0.1:2283";
          proxyWebsockets = true;
          recommendedProxySettings = true;
          extraConfig = ''
            client_max_body_size 50000M;
            proxy_read_timeout   600s;
            proxy_send_timeout   600s;
            send_timeout         600s;
          '';
        };
      };
    };
  };
}
