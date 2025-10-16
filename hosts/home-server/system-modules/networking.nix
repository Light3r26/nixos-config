{ config, ... }:

{
  networking.networkmanager.enable = true;
  networking.hostName = "home-server";
  networking.hostId = "007f0200";

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 443 2049 ];
  networking.firewall.allowedUDPPorts = [ 2049 ];

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
