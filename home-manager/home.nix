{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules
  ];

  home = { 
    username = "light3r";
    homeDirectory = "/home/light3r";
    stateVersion = "24.05"; # Do not change
  };

  home.packages = with pkgs; [
    obsidian
    discord
    firefox
    floorp
    tree
    htop # Process manager
    killall
    upower # Battery utility
    zip
    unzip
    gcc
    python3
    starship
    mpv # Video utility
    alsa-utils
    spotify
    gimp
    qimgv # Image viewer
    pavucontrol
    pulseaudio
    wl-clipboard
    thunderbird
    libreoffice
    bitwarden-desktop
    bitwarden-cli
    blueman
    kdePackages.kdenlive # Editing software
    wl-screenrec # Minimal screen recorder 
    ffmpeg
    obs-studio
    godot
    aseprite
  ];

  home.file = {

  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.git = {
    enable = true;
    userName = "Light3r26";
    userEmail = "soria.jacopo@gmail.com";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
