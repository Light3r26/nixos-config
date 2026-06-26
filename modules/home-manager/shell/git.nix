{ lib, config, ... }:
let
  cfg = config.git;

in
{
  options = {
    git.enable = lib.mkEnableOption "Enable custom Git";
  };
  
  config = lib.mkIf cfg.enable {
    programs = {
      git = {
        enable = true;
        signing.format = null;
      };
      diff-so-fancy = {
        enable = true;
        enableGitIntegration = true;
      };
    };
  };
}
