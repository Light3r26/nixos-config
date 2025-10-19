{ config, ... }:

{
  services.immich = {
    enable = true;
    port = 2283;
    mediaLocation = "/mnt/home-pool/photos";
    openFirewall = true;
  };
}
