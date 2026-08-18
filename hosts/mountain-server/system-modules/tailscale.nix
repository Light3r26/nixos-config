{ config, ... }:

{
  config.services.tailscale = {
    enable = true;
    authKeyFile = config.age.secrets."mountain-server-tailscale-key.age".path;
    useRoutingFeatures = "server";
    extraUpFlags = [
      "--login-server=https://headscale.jacoposoria.it"
      "--accept-routes"
      "--advertise-routes=192.168.1.102/32" # Reolink camera
    ];
  };
  config.age.secrets."mountain-server-tailscale-key.age".file = "/Nixos/secrets/mountain-server-tailscale-key.age";
} 
