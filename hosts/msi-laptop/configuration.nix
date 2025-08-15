{ config, pkgs, inputs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ./system-modules
      ../../modules/nixos
      inputs.home-manager.nixosModules.default 
    ];

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];

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

  # Enables Hyprland at system-level to avoid troubles with SDDM
  programs.hyprland.enable = true;

  # Fix SDDM not starting any DE session
  services.dbus.packages = with pkgs; [ dconf ];
  
  # Useful for Steam, Proton, ecc. (Enables OpenGL)
  hardware.graphics.enable = true;
  
  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    # Prevent cursor from becoming invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
  };
  
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
  ];

  # Enabled services
  services.openssh.enable = true;

  system.stateVersion = "24.11"; # Do not change
}
