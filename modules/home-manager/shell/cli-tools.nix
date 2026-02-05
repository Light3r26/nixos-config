{ pkgs, ... }:

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
    zip
    unzip
    ffmpeg
    bitwarden-cli
    upower # Battery utility
    wl-clipboard
    fanctl # Fan control
    gamemode # Gaming optimiser
    tlp # Advanced power manager
    uv
    #Needed for Rider
    dotnet-sdk
    dotnet-ef
    msbuild
  ];
}
