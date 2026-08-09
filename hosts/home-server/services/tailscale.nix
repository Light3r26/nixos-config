{ config, ... }:

{
  services.tailscale = {
    enable = true;
    authKeyFile = config.age.secrets."home-server-tailscale-key.age".path;
    extraUpFlags = [
      "--login-server=${config.services.headscale.settings.server_url}"
      "--accept-routes"
    ];
  };

  config.age.secrets."home-server-tailscale-key.age".file = "/Nixos/secrets/home-server-tailscale-key.age";
}
