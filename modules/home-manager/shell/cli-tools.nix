{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
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
    toilet
    zip
    unzip
    ffmpeg
    fastfetch
  ];
}
