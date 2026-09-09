{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.ionos-ddns;

in
{
  options = {
    ionos-ddns = {
      enable = lib.mkEnableOption "Enable IONOS Dynamic DNS updater via ddclient";
      domains = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
        description = "Hostnames to keep in sync (must exist in the IONOS zone).";
      };
      interval = lib.mkOption {
        type = lib.types.str;
        default = "15min";
        description = "How often to check and update the DNS records.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.ddclient = {
      enable = true;
      interval = cfg.interval;
      protocol = "ionos";
      passwordFile = config.age.secrets."ionos-ddns-key.age".path;
      domains = cfg.domains;
      package = pkgs.ddclient.overrideAttrs (old: {
        src = inputs.ddclient;
      });
    };

    age.secrets."ionos-ddns-key.age".file = "/Nixos/secrets/ionos-ddns-key.age";
  };
}