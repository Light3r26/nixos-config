{ config, ... }:

{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };

      disk1 = {
        type = "disk";
        device = "/dev/sdb";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "storage";
              };
            };
          };
        };
      };

      disk2 = {
        type = "disk";
        device = "/dev/sdc";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "storage";
              };
            };
          };
        };
      };

      disk3 = {
        type = "disk";
        device = "/dev/sdd";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "storage";
              };
            };
          };
        };
      };
    };

    zpool = {
      storage = {
        type = "zpool";
        mode = "raidz";
        rootFsOptions = {
          mountpoint = "none";
        };
        datasets = {
          dataset = {
            type = "zfs_fs";
            options = {
              mountpoint = "none";
              encryption = "aes-256-gcm";
              keyformat = "passphrase";
              keylocation = config.age.secrets."zfs-key.age".path;
            };
          };
        };
      };
    };
  };

  age.secrets."zfs-key.age".file = "/Nixos/secrets/zfs-key.age";


  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;
  boot.zfs.extraPools = [ "storage" ];

  services.zfs = {
    autoScrub = {
      enable = true;
      interval = "daily";
    };
    autoSnapshot = {
      enable = true;
      # Defaults to keeping 24 hourly, 7 daily, 4 weekly and 12 monthly snapshots
    };
  };

  systemd.services."zfs-mount-storage" = {
    description = "Load ZFS encryption key and mount storage dataset";
    after = [ "nixos-activation.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      ${config.boot.zfs.package}/sbin/zfs load-key -L ${config.age.secrets."zfs-key.age".path} storage/dataset || true
      ${config.boot.zfs.package}/sbin/zfs mount storage/dataset || true
    '';
  };
}
