{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    # Prevent cursor from becoming invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    wayland
    xwayland
    kitty
    waybar
    wofi
    kdePackages.dolphin # File manager
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
  ];
}
