{ lib, config, ... }:

let
  cfg = config.mime-apps;

in
{
  options = {
    mime-apps.enable = lib.mkEnableOption "Enable mime-apps module";
  };

  config = lib.mkIf cfg.enable {
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
          "application/pdf" = ["zen-browser.desktop"];
          # Links
          "x-scheme-handler/https" = ["zen-browser.desktop"]; 
          "x-scheme-handler/http" = ["zen-browser.desktop"];
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
  };
}
