{ config, pkgs, ... }:

{
  age.secrets.light3r-user-secrets.file = ../../../secrets/light3r-user-secrets.age;
  # Define user accounts.
  users.users.light3r = {
    isNormalUser = true;
    description = config.age.secrets.light3r-user-secrets.path;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Sets trusted users
  nix.settings.trusted-users = [ "root" "light3r"];
}
