{ config, ... }:

{
  boot.loader.grub = {
    enable = true;
    device = "/dev/disk/by-id/ata-Lexar_SSD_NS100_256GB_QFJ505R0159490S340";
    useOSProber = false;
  };  
}
