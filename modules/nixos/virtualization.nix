{ config, pkgs, ... }:

{
  boot.extraModulePackages = with config.boot.kernelPackages; [ virtualbox ];

  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
    guest = {
      enable = true;
      dragAndDrop = true;
      seamless = true;
      clipboard = true;
    };
  };

  users.extraGroups.vboxusers.members = [ "light3r" ];
}
