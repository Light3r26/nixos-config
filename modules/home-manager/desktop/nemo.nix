{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nemo
  ];

  dconf = {
    settings = {
      "org/cinnamon/desktop/application/terminal" = {
        exec = "kitty";
      };
      "org/cinnamon/desktop/interface" = {
        can-change-accels = true;
      };
    };
  };

  home.file = {
    ".gnome2/accels/nemo".text = ''
    (gtk_accel_path "<Actions>/DirViewActions/OpenInTerminal" "<Shift>d")
    '';
  };
}



