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
    };
  }
}
