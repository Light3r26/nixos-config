{ lib, config, ... }:

let
  cfg = config.navidrome;

in
{
  options = {
    navidrome.enable = lib.mkEnableOption "Enable navidrome";
  };

  config = lib.mkIf cfg.enable {
    systemd.services.navidrome.serviceConfig.ProtectHome = lib.mkForce "read-only";
    systemd.services.navidrome.serviceConfig.ReadWritePaths = [ "/storage/music" ];

    services.navidrome = {
      enable = true;
      settings = {
      	Port = 6981;
        MusicFolder = "/storage/music";
        Address = "127.0.0.1";
        BaseUrl = "/";
      };
      openFirewall = true;
    }; 	 
  };
}
