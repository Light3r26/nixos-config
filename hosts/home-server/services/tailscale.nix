{ config, lib, ... }:

let
  cfg = config.tailnet;

in
{
  options = {
    tailnet.enable = lib.mkEnableOption "Enable Tailscale and enter home tailnet";
  };

  config = lib.mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      authKeyFile = config.age.secrets."home-server-tailscale-key.age".path;
      useRoutingFeatures = "client";
      extraUpFlags = [
        "--login-server=${config.services.headscale.settings.server_url}"
        "--accept-routes"
      ];
    };

    config.age.secrets."home-server-tailscale-key.age".file = "/Nixos/secrets/home-server-tailscale-key.age";
  };
}
