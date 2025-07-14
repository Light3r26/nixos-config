{ config, pkgs, inputs, ... }:

{
  imports = [
    ../modules/home-manager
  ];

  home.username = "light3r";
  home.homeDirectory = "/home/light3r";

  home.stateVersion = "24.05"; # Do not change

  # Enable fonts installation
  fonts.fontconfig.enable = true;

  # The home.packages option allows you to install Nix packages into your environment.
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
  ];

  home.file = {

  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. 

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
