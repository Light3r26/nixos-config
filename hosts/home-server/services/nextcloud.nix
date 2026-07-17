{ lib, config, ...}:

let
  cfg = config.nextcloud;

in
{
  options = {
    nextcloud.enable = lib.mkEnableOption "Enable Nextcloud";
  };

  config = lib.mkIf cfg.enable {
    services.nextcloud = {
      enable = true;
      hostName = "0.0.0.0";
      config.adminpassFile = config.age.secrets."nextcloud-key.age".path;
      config.dbtype = "sqlite";
    };

    age.secrets."nextcloud-key.age".file = "/Nixos/secrets/nextcloud-key.age";
  };
}
