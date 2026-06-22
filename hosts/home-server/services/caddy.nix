{ pkgs, config, ... }:

{
  #networking.firewall.allowedTCPPorts = [ 80 443 ];
  
  services.caddy = {
    enable = true;
    virtualHosts."localhost".extraConfig = ''
      respond "OK"
    '';
  };
}
