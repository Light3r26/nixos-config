{ config, pkgs, inputs, ... }:

{
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ]; 

  home.packages = with pkgs; [
    obsidian
    discord
    spotify
    gimp3 # FOSS image processing software
    qimgv # Image viewer
    pavucontrol
    libreoffice
    bitwarden-desktop
    blueman
    kdePackages.kdenlive # Editing software
    obs-studio
    godot
    gapless # Music player
    easyeffects # Audio effects for PipeWire applications
    czkawka-full # App to remove duplicates and unnecessary files
    losslesscut-bin # Lossless video/audio editing
    textpieces # Text processing utility
    identity # Image and videos comparison tool
    piper # Mouse configuration app
    protonmail-desktop # Email client
    wasistlos # Unofficial Whatsapp Web Client 
    glow # Terminal Markdown Renderer
    kid3 # Audio tag editor
    #aseprite
    #freecad
    #synology-drive-client
  ];

  # Flatpak packages
  services.flatpak.packages = [
    { appId = "com.github.d4nj1.tlpui"; origin = "flathub";  }
  ];

}
