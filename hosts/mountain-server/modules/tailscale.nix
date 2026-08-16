{ config, ... }:

{
  services.tailscale = {
    enable = true;
    authKeyFile = config.age.secrets."mountain-server-tailscale-key.age".path;
    extraUpFlags = [
      "--login-server=https://headscale.jacoposoria.it"
      "--accept-routes"
    ];
  };
  config.age.secrets."mountain-server-tailscale-key.age".file = "/Nixos/secrets/mountain-server-tailscale-key.age";
} 
