{ lib, config, ... }:
  
let
  cfg = config.kitchenowl;
  jwt-key = "$(cat ${config.age.secrets."kitchenowl-jwt-key.age".path})";

in
{
  options.kitchenowl = {
    enable = lib.mkEnableOption "Enable KitchenOwl";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.oci-containers = {
      backend = "podman";
      containers = {
        front = {
          image = "tombursch/kitchenowl-web:latest";
          ports = [ "5316:5316" ];
          dependsOn = [ "back" ];
        };
        back = {
          image = "tombursch/kitchenowl-backend:latest";
          environment = {
            JWT_SECRET_KEY = jwt-key;
          };
          volumes = [
            "kitchenowl_data:/data"
          ];
        };
      };
    };
    age.secrets."kitchenowl-jwt-key.age".file = "/Nixos/secrets/kitchenowl-jwt-key.age";
  };
}
