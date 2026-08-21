{ config, lib, pkgs, ... }:

let
  cfg = config.ionos-ddns;

in
{
  options = {
    ionos-ddns.enable = lib.mkEnableOption "Enable Ionos Dynamic DNS updater";
  };

  config = lib.mkIf cfg.enable {
    systemd.services.ionos-ddns = {
      description = "Update IONOS DDNS record";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.curl}/bin/curl -fsS \"$(cat ${config.age.secrets."ionos-ddns-url.age".path})\"'";
      };
    };

    systemd.timers.ionos-ddns = {
      description = "Periodically update IONOS DDNS record";
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "2min";
        OnUnitActiveSec = "15min";
      };
    };

    age.secrets."ionos-ddns-url.age".file = "/Nixos/secrets/ionos-ddns-url.age";
  };
}
