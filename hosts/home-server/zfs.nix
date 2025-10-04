{ config, pkgs, ... }:

{
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false; 

  age.secrets."zfs_key.age".file = "/Nixos/secrets/zfs_key.age";

  services.zfs.autoScrub = {
    enable = true;
    interval = "weekly";
  };

  services.sanoid = {
    enable = true;
    templates.backup = {
      hourly = 36;
      daily = 30;
      monthly = 3;
      autoprune = true;
      autosnap = true;
    };

    datasets."taskpool/services" = {
      useTemplate = [ "backup" ];
    };
  };
}
