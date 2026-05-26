{ lib, config, pkgs, ... }:

let
  cfg = config.virtualisation;

in 
{
  options = {
    virtualisation.enable = lib.mkEnableOption "Enable virtualisation";
  };

  config = lib.mkIf cfg.enable {

    virtualisation.libvirtd = {
      enable = true;
      qemu.vhostUserPackages = [ pkgs.virtiofsd ];
    };
    programs.virt-manager.enable = true;

    environment.systemPackages = [
      pkgs.dnsmasq
    ];

    users.users.light3r.extraGroups = [ pkgs.libvirtd ];

    environment.sessionVariables = {
      GDK_BACKEND = "x11 virt-manager";
    };


    virtualisation.virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
      };
    };

    users.extraGroups.vboxusers.members = [ "light3r" ];
  };
}
