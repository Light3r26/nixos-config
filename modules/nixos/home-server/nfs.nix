{ config, ... }:

{
  fileSystems."/export/photos" = {
    device = "/mnt/home-pool/photos";
    options = [ "bind" ];
  };

  services.nfs.server = {
    enable = true;
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
    exports = ''
      /export/home-pool 192.168.1.33(rw,fsid=0,no_subtree_check)
    '';
  };
}
