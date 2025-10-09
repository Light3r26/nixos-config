{ config, pkgs, inputs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ./system-modules
      ../../modules/nixos/msi-laptop
      inputs.home-manager.nixosModules.default 
    ];

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; }; # Passes inputs to HM modules
    useGlobalPkgs = true; # NixOS and HM use the same global packages
    users = {
      "light3r" = { 
        imports = [
          ../../hosts/msi-laptop/home.nix
          #inputs.self.outputs.homeManagerModules.default
        ];
      };
    };
    backupFileExtension = "backup";
  };

  # Automatize garbage collection
  nix.gc = {
    automatic = true;
    dates = "3days";
  };

  services.flatpak = {
    enable = true;
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };

  # Enables Hyprland at system-level to avoid troubles with SDDM
  programs.hyprland.enable = true;

  # Fix SDDM not starting any DE session
  services.dbus.packages = with pkgs; [ dconf ];
  
  # Video Acceleration and OpenGL
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl
    ];
  };

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    # Prevent cursor from becoming invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
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
     exfatprogs
  ];

  programs.nix-ld.enable = true;

  # Enabled services
  services.openssh.enable = true;

  system.stateVersion = "24.11"; # Do not change
}
