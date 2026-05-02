{ lib, config, pkgs, inputs, ... }:

let
  cfg = config.common.home-programs;
in 
{
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ]; 

  options = {
    common.home-programs.enable = lib.mkEnableOption "Enable common programs";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      obsidian
      logseq
      discord
      gimp3 # Image processing software
      qimgv # Image viewer
      pavucontrol
      libreoffice
      bitwarden-desktop
      blueman
      kdePackages.kdenlive # Editing software
      obs-studio
      easyeffects # Audio effects for PipeWire applications
      czkawka-full # App to remove duplicates and unnecessary files
      losslesscut-bin # Lossless video/audio editing
      textpieces # Text processing utility
      identity # Image and videos comparison tool
      piper # Mouse configuration app
      protonmail-desktop # Email client
      glow # Terminal Markdown Renderer
      kid3 # Audio tag editor
      feishin # Music player
      dino # XMPP client
      pika-backup 
      #freecad
      prismlauncher # FOSS Minecraft Launcher
      #synology-drive-client
      xfce.thunar
      #jetbrains.rider
      opencode
      papers # Gnome PDF Viewer
    ];

    # Flatpak packages
    services.flatpak.packages = [
      { appId = "org.vinegarhq.Sober"; origin = "flathub";  }
      { appId = "app.fluxer.Fluxer"; origin = "flathub";  }
    ];
  };
}
