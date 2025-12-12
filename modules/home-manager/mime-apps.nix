{ config, pkgs, ... }:

{
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        # Directories
        "inode/directory" = ["nemo.desktop"]; 
        "application/x-gnome-saved-search" = [ "nemo.desktop" ];
        # Text files
        "text/*" = ["neovim.desktop"]; 
        "text/plain" = ["neovim.desktop"];
        # PDFs
        "application/pdf" = ["okular.desktop"];
        # Links
        "x-scheme-handler/https" = ["firefox.desktop"]; 
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/mailto" = ["protonmail-desktop.desktop"];
        # Video files
        "video/*" = ["mpv.desktop"]; 
        # Images
        "image/*" = ["qimgv.desktop"]; 
        "image/png" = ["qimgv.desktop"];
        "image/jpeg" = ["qimgv.desktop"];
        "image/heic" = ["qimgv.desktop"];
      };
    };
  };
}
