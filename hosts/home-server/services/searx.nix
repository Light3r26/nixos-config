{ lib, config, ... }:

let
  cfg = config.searx;
  searx-key = "$(cat ${config.age.secrets."searx-key.age".path})";

in
{
  options.searx = {
    enable = lib.mkEnableOption "Enable Searx";
  };

  config = lib.mkIf cfg.enable {
    services.searx = {
      enable = true;
      settings.server = {
        bind_address = "127.0.0.1";
        port = 5313;
        secret_key = searx-key;
      };
    };

    services.traefik.dynamicConfigOptions.http = {
      services.searx.loadbalancer.servers = [
        {
          url = "http://localhost:5313";
        }
      ];
      
      routers.searx = {
        rule = "host(`search.light3r.dev`)";
        tls.certresolver = "hostinger";
        service = "searx";
        entrypoints = [ "websecure" ];
      };
    };
  };
}
