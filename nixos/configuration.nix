{ config, pkgs, inputs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ../modules/nixos
      inputs.home-manager.nixosModules.default 
    ];

  networking.hostName = "light3r"; # Define your hostname.
  networking.networkmanager.enable = true; # Enable networking
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Sets trusted users
  nix.settings.trusted-users = [ "root" "light3r"];

  # Enable sound with pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "it_IT.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "it";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "it";

  # Define a user account.
  users.users.light3r = {
    isNormalUser = true;
    description = "Jacopo Soria";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
        
  # Enable Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

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

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.caskaydia-cove
    nerd-fonts.jetbrains-mono
  ];
  
  # Enabled services
  services.openssh.enable = true;

  system.stateVersion = "24.11"; # Do not change
}
