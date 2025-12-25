{ lib, ... }:

{
  systemd.services.navidrome.serviceConfig.ProtectHome = lib.mkForce "read-only";
  systemd.services.navidrome.serviceConfig.ReadWritePaths = [ "/mnt/home-pool/music" ];

  services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/mnt/home-pool/music";
      Address = "127.0.0.1";
      BaseUrl = "/";
    };

    openFirewall = true;
  }; 	
}
