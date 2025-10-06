{ config, ... }:

{
  services.immich = {
    enable = true;
    port = 2283;
    accelerationDevices = null;
  };
}
