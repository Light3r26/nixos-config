{ pkgs, ... }:

{
  services.udiskie = {
    enable = true;
    settings.program-options = {
      file_manager = "${pkgs.nemo-with-extensions}/bin/nemo";
    };
  };
}
