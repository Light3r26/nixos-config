{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tree
    bat
    lsd
    yazi # Terminal file manager
    htop # Process manager
    btop # Advanced process manager
    killall
    # Other tools
    gh # GitHub CLI
    wget
    toilet
    zip
    unzip
    ffmpeg
    bitwarden-cli
    upower # Battery utility
    wl-clipboard
    fanctl # Fan control
    gamemode # Gaming optimiser
    tlp # Advanced power manager
  ];
}
