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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/light3r/etc/profile.d/hm-session-vars.sh
  #
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
