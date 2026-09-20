{ config, ... }:

let
  secretsPath = "/Nixos/secrets";
in 
{
  config.age.secrets = {
    "zfs-key.age".file = "${secretsPath}/zfs-key.age";
    "nextcloud-key.age".file = "${secretsPath}/nextcloud-key.age";
    "borg-immich-key.age".file = "${secretsPath}/borg-immich-key.age";
    "frigate-env.age".file = "${secretsPath}/frigate-env.age";
    "searx-key.age".file = "${secretsPath}/searx-key.age";
    "kitchenowl-jwt-key.age".file = "${secretsPath}/kitchenowl-jwt-key.age";
    #"freshrss-key.age" = {
      #file = "${secretsPath}/freshrss-key.age";
      #owner = "freshrss";
      #group = "freshrss";
      #mode = "0640";
    #};
    "home-server-tailscale-key.age".file = "${secretsPath}/home-server-tailscale-key.age";
    "hostinger-ddns-key.age".file = "${secretsPath}/hostinger-ddns-key.age";
    #"mqtt-frigate-password.age".file = "${secretsPath}/mqtt-frigate-password.age";
    #"mqtt-ha-password.age".file = "${secretsPath}/mqtt-ha-password.age";
  };
}
