{ config , ... }:

{
  # Going to add the NixOS server up here

  fileSystems."/home/light3r/NAS-115J" = {
    device = "192.168.1.42:/volume1";
    fsType = "nfs";
    options = [ 
      "_netdev"
      "nofail"
      "uid=1000" 
      "gid=100" 
      "fmask=133" 
      "dmask=022"
    ];
  };
}
