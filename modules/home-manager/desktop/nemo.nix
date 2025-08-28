{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nemo-with-extensions
  ];
  
  # Set Nemo as default file browser
  xdg.desktopEntries.nemo = {
    name = "Nemo";
    exec = "${pkgs.nemo-with-extensions}/bin/nemo";
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
        "inode/directory" = [ "nemo.desktop" ];
        "application/x-gnome-saved-search" = [ "nemo.desktop" ];
    };
  };

  dconf = {
    settings = {
      # Set Kitty as default Nemo terminal
      "org/cinnamon/desktop/application/terminal" = {
        exec = "kitty";
      };
      # Needed to change keyboard shortcuts 
      "org/cinnamon/desktop/interface" = {
        can-change-accels = true;
      };
    };
  };

  home.file = {
    # Set keyboard shortcut to open terminal
    ".gnome2/accels/nemo".text = ''
    (gtk_accel_path "<Actions>/DirViewActions/OpenInTerminal" "<Shift>d")
    '';
  };
}



