{ lib, config, pkgs, ... }:

let cfg = config.nemo;

in {
  options = {
    nemo.enable = lib.mkEnableOption "Enable Nemo file manager";
  };
    
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      (nemo-with-extensions.override {
        extensions = with pkgs; [ 
          nemo-fileroller # For archives
          nemo-preview
          nemo-emblems
        ];
      })
    ];

    dconf.settings = {
      "org/cinnamon/desktop/applications/terminal" = {
        exec = "kitty";
      };
      "org/nemo/desktop" = {
        show-desktop-icons = false;
      };
    };
  };
}
