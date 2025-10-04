{ config, disko, ... }:

{
  disko.devices = {
    disk = {
      disk1 = {
        device = "/dev/sdb";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "500M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
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

      disk2 = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "zfs";
          pool = "zroot";
        };
      };
      disk3 = {
        type = "disk";
        device = "/dev/sdc";
        content = {
          type = "zfs";
          pool = "zroot";
        };
      };
      disk4 = {
        type = "disk";
        device = "/dev/sdd";
        content = {
          type = "zfs";
          pool = "zroot";
        };
      };
    };
    zpool = {
      zroot = {
        type = "zpool";
        datasets = {
          "root" = {
            type = "zfs_fs";
            options.mountpoint = "none";
          };
          "root/zfs_fs" = {
            type = "zfs_fs";
            mountpoint = "/zfs_fs";
            options."com.sun:auto-snapshot" = "true";
          };
        };
      };
    };
  };
}
