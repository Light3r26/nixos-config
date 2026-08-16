{ pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system-modules
    ../../scripts
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

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
    toilet
  ];

  services.tailscale = {
    enable = true;
    authKeyFile = age.secrets."mountain-server-tailscale-key.age".path;
    extraUpFlags = [
      "--login-server=https://headscale.jacoposoria.it"
      "--accept-routes"
    ];
  };
  age.secrets."mountain-server-tailscale-key.age".file = "/Nixos/secrets/mountain-server-tailscale-key.age";
 
  age.identityPaths = [ "/home/nixos/.ssh/id_ed25519" ];

  services.openssh.enable = true;

  users.users.root.openssh.authorizedKeys.keys =
  [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHvcTV9j2DcLNQreiBZ7yOLLcbMmBlHfxu+/jdBqI7+t light3r@nixbook-pro"
  ];

  system.stateVersion = "26.05";
}
