{ config, ... }:

{
  networking.networkmanager.enable = true;
  networking.hostName = "home-server";
  networking.hostId = "007f0200";

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 2049 4000 4001 4002 ];
  networking.firewall.allowedUDPPorts = [ 2049 4000 4001 4002 ];

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
