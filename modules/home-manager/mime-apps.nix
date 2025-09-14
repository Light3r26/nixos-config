{ config, pkgs, ... }:

{
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = ["nemo.desktop"]; # Directories
        "application/x-gnome-saved-search" = [ "nemo.desktop" ];
        "text/*" = ["neovim.desktop"]; # Any text files
        "text/plain" = ["neovim.desktop"]; # Plain text
        "application/pdf" = ["firefox.desktop"]; # .pdf
        "x-scheme-handler/https" = ["firefox.desktop"]; # Links
        "x-scheme-handler/http" = ["firefox.desktop"]; # Links
        "x-scheme-handler/mailto" = ["protonmail-desktop.desktop"]; # Links
        "video/*" = ["mpv.desktop"]; # Any video files
        "image/*" = ["qimgv.desktop"]; # Images
        "image/png" = ["qimgv.desktop"];
        "image/jpeg" = ["qimgv.desktop"];
      };
    };
  };
}
