{ config , ... }:

{
  # Going to add the NixOS server up here

  fileSystems."/home/light3r/NAS-115J" = {
    device = "192.168.1.42:/volume1";
    fsType = "nfs";
    options = [ "noauto" ];
  };
}
