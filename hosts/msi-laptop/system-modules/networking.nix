{ config, ... }:

{
  networking = {
    hostName = "msi-laptop"; # Define your hostname.
    networkmanager.enable = true; # Enable networking

    firewall = {
      enable = true;
      allowPing = true;
    };

    #dhcpcd.enable = false;
    #interfaces.wlo1.ipv4.addresses = [
    #  {
    #    address = "192.168.1.34";
    #    prefixLength = 24;
    #  }
    #];

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/"; 
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };
}
