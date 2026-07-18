{ lib, config, pkgs, pkgs-unstable, ... }:

let
  cfg = config.immich;

in
{
  options = {
    immich.enable = lib.mkEnableOption "Enable Immich";
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

    fileSystems."/mnt/backup-drive" = {
      device = "/dev/disk/by-uuid/5cb23849-92f4-4b68-864a-85cb238e74f4";
      fsType = "ext4";
      options = [ "nofail" "noauto" "x-systemd.automount" "x-systemd.device-timeout=10" ];
    };

    age.secrets."borg-immich-key.age".file = "/Nixos/secrets/borg-immich-key.age";

    services.borgbackup.jobs."immich" = {
      paths = [
        "/storage/photos"
	"/mnt/backup-drive/staging/immich-db"
      ];

      #exclude = [
        #"/storage/photos/thumbs"
        #"/storage/photos/encoded-video"
      #]; # regenerable caches — drop this list if you want full 1:1 restores

      repo = "/mnt/backup-drive/borg/immich";
      doInit = false; #Keep disabled if drive may not always be connected

      encryption = {
        mode = "repokey-blake2";
        passCommand = "cat ${config.age.secrets."borg-immich-key.age".path}";
      };

      compression = "auto,zstd";
      startAt = "daily";

      prune.keep = {
        within = "1d";
        daily = 7;
        weekly = 4;
        monthly = 6;
      };

      preHook = ''
	mkdir -p /mnt/backup-drive/staging/immich-db
  	${pkgs.util-linux}/bin/runuser -u immich -- \
    	${config.services.postgresql.package}/bin/pg_dump -d immich -F c -f /mnt/backup-drive/staging/immich-db/immich.dump
      '';
    };

    systemd.services."borgbackup-job-immich" = {
      unitConfig = {
        RequiresMountsFor = [ "/mnt/backup-drive" ];
	#OnFailure = [ "notify-backup-failure@%n.service" ];
      };
      serviceConfig = {
	ReadWritePaths = [ "/mnt/backup-drive" ];
      };
    };
  };
}
