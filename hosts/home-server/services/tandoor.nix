{ config, lib, ... }:

let
  cfg = config.tandoor;

in
{
  options = {
    tandoor.enable = lib.mkEnableOption "Enable Tandoor Recipes";
  };

  config = lib.mkIf cfg.enable {
    services.tandoor-recipes = {
      enable = true;
      address = "0.0.0.0";
      port = 3301;
      extraConfig = {
        MEDIA_ROOT = "/var/lib/tandoor-recipes/media";
        ALLOWED_HOSTS = "localhost,home-server.local";
        ENABLE_SIGNUP = "1";
      };
    };
  };
}
