{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/neovim.nix
    ./zfs.nix
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  
  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/disk/by-id/ata-Lexar_SSD_NS100_256GB_QFJ505R0159490S340";
    #device = "/dev/sda";
    useOSProber = false;
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "home-server"; # Define your hostname.
  networking.hostId = "007f0200";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nixos = {
    isNormalUser = true;
    description = "NixOS Server";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    gh
    inputs.agenix.packages."x86_64-linux".default
  ];

  programs.bash.shellAliases = {
    list-nixos-generations = "nixos-rebuild list-generations"; 
    ip-show = "curl ifconfig.me";
    vim = "nvim";
    vi = "nvim";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  age.identityPaths = [ "/home/nixos/.ssh/ssh_host_ed25519_key" ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = true;

  system.stateVersion = "25.05"; # Do not change
}
