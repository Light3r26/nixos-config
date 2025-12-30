{ pkgs, inputs, ... }:

{
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ]; 

  services.kdeconnect.enable = true;

  home.packages = with pkgs; [
    obsidian
    logseq
    discord
    gimp3 # Image processing software
    qimgv # Image viewer
    pavucontrol
    libreoffice
    bitwarden-desktop
    blueman
    kdePackages.kdenlive # Editing software
    obs-studio
    godot
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
    feishin # Music player
    #freecad
    #synology-drive-client
  ];

  # Flatpak packages
  services.flatpak.packages = [
    { appId = "com.github.d4nj1.tlpui"; origin = "flathub";  }
  ];

}
