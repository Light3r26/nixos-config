{ config , ... }:

{
  # Going to add the NixOS server up here

  fileSystems."/home/light3r/NAS-115J" = {
    device = "192.168.1.42:/NAS-115J";
    fsType = "nfs";
    #options = [ "x-systemd.automount" "noauto" ];
  };
}
