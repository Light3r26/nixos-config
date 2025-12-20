{
  fileSystems."/home/light3r/Home-Server" = {
   device = "192.168.1.56:/home-pool";
   fsType = "nfs";
   options = [ 
     "_netdev"
     "nofail"
     "rw"
   ];
  };

  fileSystems."/home/light3r/NAS-115J" = {
    device = "192.168.1.42:/volume1";
    fsType = "nfs";
    options = [ 
      "_netdev"
      "nofail"
      "rw"
    ];
  };
}
