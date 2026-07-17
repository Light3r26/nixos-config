{ lib, config, pkgs-unstable, ... }:

let
  cfg = config.immich;

in
{
  options = {
    immich.enable = true;
  };

  config = lib.mkIf cfg.enable {
    services.immich = {
      enable = true;
      package = pkgs-unstable.immich;
      host = "0.0.0.0";
      port = 2283;
      mediaLocation = "/storage/photos";
      openFirewall = true;
      database.createDB = true;
      redis.enable = true;
    };

    systemd.tmpfiles.rules = [
      "d /storage/photos 0750 immich immich -"
    ];
  };
}
