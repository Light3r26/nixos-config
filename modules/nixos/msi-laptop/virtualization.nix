{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.qemu
  ];
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
  };

  users.extraGroups.vboxusers.members = [ "light3r" ];
}
