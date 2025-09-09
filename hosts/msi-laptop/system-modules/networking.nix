{ config, ... }:

{
  networking.hostName = "msi-laptop"; # Define your hostname.
  networking.networkmanager.enable = true; # Enable networking

  networking.firewall = {
    enable = true;
    allowPing = true;
  };

  networking.interfaces.wlo1.ipv4.addresses = [
    {
      address = "192.168.1.34";
      prefixLength = 24;
    }
  ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
