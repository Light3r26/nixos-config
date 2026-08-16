{ config, ... }:

{
  users.users.nixos = {
    isNormalUser = true;
    description = "NixOS Server";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [];
    initialPassword = "prova";
  };

  # Sets trusted users
  nix.settings.trusted-users = [ "root" "nixos"];
}
