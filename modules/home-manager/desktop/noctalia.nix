{ lib, config, inputs, ... }:

let
  cfg = config.noctalia;

in
{
  imports = [ inputs.noctalia.homeModules.default ];

  options = {
    noctalia.enable = lib.mkEnableOption "Enable noctalia shell";
  };

  config = lib.mkIf cfg.enable {
    programs.noctalia-shell = {
      enable = true;
    };
  };
}
