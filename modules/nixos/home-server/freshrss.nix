{config, ...}:

{
  services.freshrss = {
    enable = true;
    baseUrl = "/";
    virtualHost = "rss.jacoposoria.qzz.io";
    language = "it";
    #defaultUser = "light3r";
    passwordFile = config.age.secrets."freshrss_key.age".path;
  };

  age.secrets."freshrss_key.age" = {
    file = "/Nixos/secrets/freshrss_key.age";
    owner = "freshrss";
    group = "freshrss";
    mode = "0640";
  };

  services.nginx.virtualHosts."rss.jacoposoria.qzz.io" = {
    serverName = "rss.jacoposoria.qzz.io";
    listen = [ { addr = "127.0.0.1"; port = 80; } ];
    locations."/" = {
      #proxyPass = "http://127.0.0.1:port?";
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
}
