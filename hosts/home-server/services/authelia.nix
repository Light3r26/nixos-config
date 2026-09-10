{ lib, config, pkgs, ... }:

let
  cfg = config.authelia;

in
{
  options.authelia = {
    enable = lib.mkEnableOption "Enable Authelia";
  };

  config = lib.mkIf cfg.enable {
    #services.authelia.instances.main = {
    #enable = true;
      #secrets = {
        #jwtSecretFile = "";#path to agenix secret
      #};
    #};
    environment.systemPackages = [
      pkgs.authelia
    ];
  };
}
