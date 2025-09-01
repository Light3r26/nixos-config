{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian
    discord
    mpv # Video utility
    spotify
    gimp
    qimgv # Image viewer
    pavucontrol
    libreoffice
    bitwarden-desktop
    blueman
    kdePackages.kdenlive # Editing software
    obs-studio
    godot
    aseprite
    freecad
    gapless # Music player
    synology-drive-client
    localsend # Cross-platform FOSS alternative to Airdrop
    easyeffects # Audio effects for PipeWire applications
    fanctl # Fan control
    czkawka-full # App to remove duplicates and unnecessary files
    losslesscut-bin # Lossless video/audio editing
    textpieces # Text processing utility
    identity # Image and videos comparison tool
    stirling-pdf # PDF editor
  ];

}
