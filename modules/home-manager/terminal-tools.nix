{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    starship # Customisable prompt
    yazi # Terminal file manager
    htop # Process manager
    killall
    # Compilers and interpreters
    gcc
    python3
    # Other tools
    gh # GitHub CLI
    tree
    wget
    fastfetch
    toilet
    zip
    unzip
    ffmpeg
  ];
}
