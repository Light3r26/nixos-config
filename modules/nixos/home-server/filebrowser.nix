{
  services.filebrowser = {
    enable = true;
    settings = {
    	port = 4026;
	root = "/mnt/home-pool/drive";
    };
    openFirewall = true;
  };

  services.nginx.virtualHosts."drive.jacoposoria.qzz.io" = {
    serverName = "drive.jacoposoria.qzz.io";
    listen = [ { addr = "127.0.0.1"; port = 80; } ];
    locations."/" = {
      proxyPass = "http://127.0.0.1:4026";
      proxyWebsockets = true;
    };
  };
}
