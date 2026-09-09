{ lib, config, pkgs, ... }:

let
  cfg = config.podman;

in
{
  options = {
    podman.enable = lib.mkEnableOption "Enable Podman";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
        flags = [
    "--filter=until=24h"
    "--filter=label!=important"
        ];
      };
      defaultNetwork.settings.dns_enabled = true;
    };
      
    environment.systemPackages = [ pkgs.podman-compose ];
  };
}
