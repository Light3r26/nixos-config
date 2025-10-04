{ config, pkgs, ... }:

{
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false; 

  age.secrets."zfs_key.age".file = "/Nixos/secrets/zfs_key.age";
}
