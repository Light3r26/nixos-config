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
    gapless
    synology-drive-client
    localsend
  ];
}
