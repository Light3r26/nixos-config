{ lib, config, pkgs-unstable, ... }:

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
      #"d /storage/photos 0750 immich immich -"
      "d /var/backup/immich-db 0700 immich immich -" # DB dump staging dir
    ];

    fileSystems."/mnt/backup-drive" = {
      device = "/dev/disk/by-uuid/5cb23849-92f4-4b68-864a-85cb238e74f4";
      fsType = "ext4";
      options = [ "nofail" "noauto" "x-systemd.automount" "x-systemd.device-timeout=10" ];
    };

    #age.secrets."borg-immich-key.age".file = "Nixos/secrets/borg-immich-key.age";

    #services.borgbackup.jobs."immich" = {
    # paths = [
    #   "/storage/photos"
    #   "/var/backup/immich-db"
    # ];

      #exclude = [
        #"/storage/photos/thumbs"
        #"/storage/photos/encoded-video"
      #]; # regenerable caches — drop this list if you want full 1:1 restores

    # repo = "/mnt/backup-drive/borg/immich";
    # doInit = false; #Keep disabled if drive may not always be connected

    # encryption = {
    #   mode = "repokey-blake2";
    #   passCommand = "cat ${config.age.secrets.borg-immich-pass.path}";
    # };

    # compression = "auto,zstd";
    # startAt = "daily";

    # prune.keep = {
    #   within = "1d";
    #   daily = 7;
    #   weekly = 4;
    #   monthly = 6;
    # };

    # preHook = ''
    #   ${pkgs.util-linux}/bin/runuser -u immich -- \
    #	${pkgs.postgresql}/bin/pg_dump -d immich -F c -f /var/backup/immich-db/immich.dump
    # '';
    #};
  };
}
