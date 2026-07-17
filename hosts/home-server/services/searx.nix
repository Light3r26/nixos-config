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
        #secret_key = builtins.getEnv "SEARX-KEY";
        secret_key = searx-key;
      };
    };

    age.secrets."searx-key.age".file = "/Nixos/secrets/searx-key.age";
    #programs.bash.sessionVariables = {
      #SEARX-KEY = "$(cat ${config.age.secrets."searx-key.age".path})";
    #};
  };
}
