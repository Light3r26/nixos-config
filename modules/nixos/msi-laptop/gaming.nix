{ lib, config, pkgs, ... }:

let
  cfg = config.gaming;

in
{
  options = {
    gaming.enable = lib.mkEnableOption "Enable gaming module";
  };

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };

    environment.systemPackages = with pkgs; [
      r2modman
    ];
  };
}
