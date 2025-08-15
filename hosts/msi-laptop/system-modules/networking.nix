{ config, ... }:

{
  networking.hostName = "msi-laptop"; # Define your hostname.
  networking.networkmanager.enable = true; # Enable networking

  networking.firewall = {
    enable = true;
    allowPing = true;
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
