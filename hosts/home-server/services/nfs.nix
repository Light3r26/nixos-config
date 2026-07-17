{ lib, config, ...}:

let
  cfg = config.nfs;

in
{
  options = {
    nfs.enable = lib.mkEnableOption "Enable NFS server";
  };

  config = lib.mkIf cfg.enable {
    fileSystems."/export/storage" = {
      device = "/storage";
      options = [ "bind" ];
    };

    services.nfs.server = {
      enable = true;
      exports = ''
        /export 192.168.1.33(rw,fsid=0,no_subtree_check)
        /export/storage 192.168.1.33(rw,insecure,no_subtree_check)
      '';
    };

    networking.firewall.allowedTCPPorts = [ 2049 ];
    networking.firewall.allowedUDPPorts = [ 2049 ];

    boot.supportedFilesystems = [ "nfs" ];
  };
}
