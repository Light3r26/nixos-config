{ config, pkgs, ... }:

{
  # Hyprland enabled in configuration.nix to assure sistem-level-changes 

  home.packages = with pkgs; [
    wayland
    xwayland
    waybar
    rofi
    kdePackages.dolphin # File manager
    kdePackages.kio-fuse # To mount remote filesystems via FUSE
    kdePackages.kio-extras # Extra protocols support (sftp, fish and more)
    kdePackages.qtsvg # Support for svg icons
    hyprshot # Screenshot utility
    jq # JSON parser and manipulator
    grim # Screenshot tool
    slurp # Screenshot selector
    wl-clipboard # Wayland clipboard
    libnotify # Notification sender
    swaynotificationcenter # Notification daemon
    hyprlock # Screen locker
    hypridle # Screen idling program
    hyprpaper # Screen background
    wlogout # Wayland logout menu
    brightnessctl
  ];
}
