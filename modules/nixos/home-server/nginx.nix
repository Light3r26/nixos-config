{
  services.nginx = {
    enable = true;
    virtualHosts = {
      "jacoposoria.qzz.io" = {
        serverName = "jacoposoria.qzz.io";
        root = "/var/www/jacoposoria.qzz.io";
        listen = [ { addr = "127.0.0.1"; port = 80; } ];
      };
    };
  };
}
