{ config, pkgs, inputs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ../../modules/nixos
      ../../modules/nixos/system
      inputs.home-manager.nixosModules.default 
    ];

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Automatize garbage collection
  nix.gc = {
    automatic = true;
    dates = "3days";
  };

  # Enables Hyprland at system-level to avoid troubles with SDDM
  programs.hyprland.enable = true;

  # Should fix SDDM not starting any DE session
  services.dbus.packages = with pkgs; [ dconf ];
  
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
        
  # Enable Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
     vim
     wget
     git
     home-manager
     starship
     nix-prefetch
     nix-prefetch-github
     sops
  ];

  programs.nix-ld = {
    enable = true; 
    libraries = with pkgs; [
      # Add any missing dynamic libraries for unpackaged
      # programs here, NOT in environment.systemPackages
    ];

  };
    
  # Enabled services
  services.openssh.enable = true;

  system.stateVersion = "24.11"; # Do not change
}
