{ config, pkgs, ... }:

{
  # Define user accounts.
  users.users.light3r = {
    isNormalUser = true;
    description = "Jacopo";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  # Sets trusted users
  nix.settings.trusted-users = [ "root" "light3r"];
}
