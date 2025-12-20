{ config, ... }:

{
  networking = {
    hostName = "msi-laptop"; # Define your hostname.
    networkmanager.enable = true; # Enable networking

    firewall = {
      enable = true;
      allowPing = true;
    };

    hosts = {
      "192.168.1.56" = ["home-server"];
    };

    # Needed to have faster boot with NixOS virtualbox module active
    networkmanager.unmanaged = [ "interface-name:vboxnet*" ];

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/"; 
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };
}
