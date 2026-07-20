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
      heroic
      lutris
      r2modman
      vulkan-tools
      vulkan-loader
      steam-run
    ];

    programs.nix-ld.libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      openssl
      curl
      expat
      vulkan-loader
      libGL
      libx11
      libxext
      libxrandr
      libxi
      libxcursor
      libxrender
      libxfixes
      libxcb
      alsa-lib
      dbus
      gtk3
    ];
  };
}
