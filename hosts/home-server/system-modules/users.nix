{ config, ... }:

{
  users.users.nixos = {
    isNormalUser = true;
    description = "NixOS Server";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [];
  };
}
