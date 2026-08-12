{ config, ... }:

{
  networking = {
    hostName = "nixbook-pro"; # Define your hostname.
    networkmanager.enable = true; # Enable networking

    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 
        1433
        37955
      ];
    };

    hosts = {
      "192.168.1.57" = ["home-server" "traefik.jacoposoria.it"];
      "192.168.1.101" = [ "mountain-server" ];
    };

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/"; 
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };
}
