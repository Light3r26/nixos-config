{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nemo-with-extensions
    nemo-fileroller
    nemo-preview
    nemo-emblems
    folder-color-switcher
    bulky # Cinnamon bulk renaming app
  ];
  
  # Set Nemo as default file browser
  xdg.desktopEntries.nemo = {
    name = "Nemo";
    exec = "${pkgs.nemo-with-extensions}/bin/nemo";
  };

  dconf = {
    settings = {
      # Set Kitty as default Nemo terminal
      "org/cinnamon/desktop/default-applications/terminal" = {
        exec = "kitty";
        exec-arg = "--working-directory";
      };

      "org.cinnamon.desktop.keybindings" = {
        open-terminal = [ "<Shift>d" ];
      };
    };
  };
}



