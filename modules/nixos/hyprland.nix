{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;

    # Useful for Steam, Proton, ecc.
  hardware.graphics.enable = true;

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
    # Nvidia settings for cursor on second monitor
    #__GLX_VENDOR_LIBRARY_NAME = "nvidia";
    #DRI_PRIME = "1";
    # Prevent cursor from becoming invisible
  };
  
  # Activates NVIDIA drivers
  #services.xserver.videoDrivers = [ "nvidia" ];

  #hardware.nvidia = {
    #modesetting.enable = true;
    #powerManagement.enable = true;
    #nvidiaSettings = true;
    #open = false; 
  #};

  # Needed for fluid cursor with NVIDIA videoDrivers
  #boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  environment.systemPackages = with pkgs; [
    wayland
    xwayland
    kitty
    waybar
    rofi
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
