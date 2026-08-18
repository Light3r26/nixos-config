{ config, ... }:

{
  services.mosquitto = {
    enable = true;
    listeners = [
      {
        port = 1883;
        users.frigate = {
          acl = [ "readwrite #" ];
          passwordFile = config.age.secrets."mqtt-frigate-password.age".path;
        };

        users.homeassistant = {
          acl = [ "readwrite #" ];
          passwordFile = config.age.secrets."mqtt-ha-password.age".path;
        };
      }
    ];
  };

  networking.firewall.allowedTCPPorts = [ 1883 ];

  age.secrets."mqtt-frigate-password.age".file = "/Nixos/secrets/mqtt-frigate-password.age";
  age.secrets."mqtt-ha-password.age".file = "/Nixos/secrets/mqtt-ha-password.age";
}
