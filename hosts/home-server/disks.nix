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
        mountpoint = "/storage";
        mountOptions = [
            "defaults"
            "noauto"
            "nofail"
            "x-systemd.automount"
            "x-systemd.mount-timeout=10" 
          ];
        datasets = {
          dataset = {
            type = "zfs_fs";
            mountpoint = "/storage/dataset";
            mountOptions = [
              "defaults"
              "noauto"
              "nofail"
              "x-systemd.automount"
              "x-systemd.mount-timeout=10" 
            ];
            options = {
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
}
