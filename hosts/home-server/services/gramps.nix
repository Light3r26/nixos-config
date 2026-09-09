{ lib, config, ... }:

let
  cfg = config.gramps;
  baseGramps = {
    image = "ghcr.io/gramps-project/grampsweb:latest";
    environment = {
      GRAMPSWEB_TREE = "Gramps Web";
      GRAMPSWEB_CELERY_CONFIG__broker_url = "redis://gramps-redis:6379/0";
      GRAMPSWEB_CELERY_CONFIG__result_backend = "redis://gramps-redis:6379/0";
      GRAMPSWEB_RATELIMIT_STORAGE_URI = "redis://gramps-redis:6379/1";
      # GUNICORN_NUM_WORKERS = 8 # optional variable, each worker increases efficiency, but takes resources (CPU and RAM)
    };
    volumes = [
      "gramps_users:/app/users"
      "gramps_index:/app/indexdir"
      "gramps_thumb_cache:/app/thumbnail_cache"
      "gramps_cache:/app/cache" 
      "gramps_secret:/app/secret" 
      "gramps_db:/root/.gramps/grampsdb" 
      "gramps_media:/app/media"
      "gramps_tmp:/tmp"
    ];
  };

in 
{
  options.gramps = {
    enable = lib.mkEnableOption "Enable Gramps";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.oci-containers = {
      backend = "podman";
      containers = {
        gramps = baseGramps // {
          ports = [ "4896:4896" ];
          dependsOn = [ "gramps-redis" ];
        };
        gramps-celery = baseGramps // {
          dependsOn = [ "gramps" "gramps-redis" ];
          cmd = [ "celery" "-A" "gramps_webapi.celery" "worker" "--loglevel=INFO" "--concurrency=2" ];
        };

        gramps-redis = {
          image = "docker.io/valkey/valkey:8-alpine";
        };
      };
    };
  };
}
