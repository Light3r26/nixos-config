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
    systemd.services.navidrome.after = [ "zfs-mount-storage.service" ];
    systemd.services.navidrome.wants = [ "zfs-mount-storage.service" ];

    services.navidrome = {
      enable = true;
      settings = {
      	Port = 6981;
        MusicFolder = "/storage/music";
        #Address = "127.0.0.1";
        Address = "0.0.0.0";
        BaseUrl = "/";
      };
      openFirewall = true;
    }; 	 
  };
}
