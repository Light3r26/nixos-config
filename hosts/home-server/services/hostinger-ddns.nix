{ config, lib, ... }:

let
  cfg = config.hostinger-ddns;
  hostingerConfig = {
    settings = [{
      provider = "hostinger";
      domain = "*.light3r.dev";
      token = "$(cat ${config.age.secrets."hostinger-ddns-key.age".path})";
      ttl = 300;
      ip_version = "ipv4";
    }];
  };
in
{
  options.hostinger-ddns = {
    enable = lib.mkEnableOption "Enable Hostinger Dynamic DNS updater via ddns-updater";
  };

  config = lib.mkIf cfg.enable {
    services.ddns-updater = {
      enable = true;
      environment = {
        PERIOD = cfg.interval;
        CONFIG = builtins.toJSON hostingerConfig;
      };
    };
  };
}
