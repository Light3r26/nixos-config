{ config, ... }:

{
  # Define user accounts.
  users.users.light3r = {
    isNormalUser = true;
    description = "Jacopo Soria";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Sets trusted users
  nix.settings.trusted-users = [ "root" "light3r"];
}
