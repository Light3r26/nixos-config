{ config, ... }:

{
  networking.networkmanager.enable = true;
  networking.hostName = "mountain-server";

  networking.firewall.enable = true;

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
