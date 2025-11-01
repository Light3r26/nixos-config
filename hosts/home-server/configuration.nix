{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system-modules
    ../../modules/nixos/home-server
    ../../modules/nixos/msi-laptop/neovim.nix
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    gh
    inputs.agenix.packages."x86_64-linux".default
  ];

  age.identityPaths = [ "/home/nixos/.ssh/id_ed25519" ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "25.05"; # Do not change
}
