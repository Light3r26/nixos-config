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
      hostName = "192.168.1.57";
      config = {
        dbtype = "sqlite";
	adminuser = "home-server";
        adminpassFile = config.age.secrets."nextcloud-key.age".path;
      };
    };

    networking.firewall.allowedTCPPorts = [ 80 443 ];

    age.secrets."nextcloud-key.age".file = "/Nixos/secrets/nextcloud-key.age";
  };
}
