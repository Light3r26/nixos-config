{ lib, config, pkgs, ... }:

let
  cfg = config.virtualization;

in 
{
  options = {
    virtualization.enable = lib.mkEnableOption "Enable virtualisation";
  };

  config = lib.mkIf cfg.enable {
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
  };
}
