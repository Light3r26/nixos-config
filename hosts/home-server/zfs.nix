{ config, pkgs, ... }:

{
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false; 

  age.secrets."zfs_key.age".file = "../../secrets/zfs_key.age";
}
