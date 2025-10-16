{ config, ... }:

{
  fileSystems."/export/home-pool" = {
    device = "/mnt/home-pool";
    options = [ "bind" ];
  };

  services.nfs.server = {
    enable = true;
    exports = ''
      /export 192.168.1.33(rw,fsid=0,no_subtree_check)
      /export/home-pool 192.168.1.33(rw,fsid=0,no_subtree_check)
    '';
  };

  boot.supportedFilesystems = [ "nfs" ];
}
