{config, ...}:

{
  services.freshrss = {
    enable = true;
    baseUrl = "/";
    virtualHost = "rss.jacoposoria.qzz.io";
    language = "it";
    #defaultUser = "light3r";
    passwordFile = config.age.secrets."freshrss-key.age".path;
  };

  age.secrets."freshrss-key.age" = {
    file = "/Nixos/secrets/freshrss-key.age";
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
    };
  };
}
