{ config, lib, pkgs, inputs, ... }:

# Add this to flake.nix before using
#ddclient = {
  #url = "git+https://github.com/ddclient/ddclient?ref=main";
  #flake = false;
#};

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
        description = "List of domains to keep in sync";
      };
      interval = lib.mkOption {
        type = lib.types.str;
        default = "15min";
        description = "DNS records update interval";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.ddclient = {
      enable = true;
      interval = cfg.interval;
      protocol = "ionos";
      passwordFile = config.age.secrets."ionos-ddns-key.age".path; # Generate before using
      domains = cfg.domains;
      package = pkgs.ddclient.overrideAttrs (old: {
        src = inputs.ddclient;
      });
    };

  };
}
