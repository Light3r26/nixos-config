{ config, pkgs, ... }:

{
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
    guest = {
      enable = true;
      dragAndDrop = true;
      clipboard = true;
    };
  };

  users.extraGroups.vboxusers.members = [ "light3r" ];
}
