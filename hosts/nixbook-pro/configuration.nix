{ pkgs, inputs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ./system-modules
      ../../modules/nixos/msi-laptop
      ../../scripts
      inputs.home-manager.nixosModules.default 
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes"];
    substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://cache.nixos.org/"
    ];
    trusted-substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://cache.nixos.org/"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; }; # Passes inputs to HM modules
    useGlobalPkgs = true; # NixOS and HM use the same global packages
    users = {
      "light3r" = { 
        imports = [
          ./home.nix
          inputs.nvf.homeManagerModules.default
        ];
      };
    };
    backupFileExtension = "backup";
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/Nixos";
  };

  services.flatpak = {
    enable = true;
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };

  # Fix SDDM not starting any DE session
  services.dbus.packages = with pkgs; [ dconf ];
  
  services.libinput.touchpad = {
    tappingButtonMap = "lrm";
    clickMethod = "buttonareas";
  };

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    # Prevent cursor from becoming invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
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
     ventoy-full-gtk
  ];

  # Custom modules
  gaming.enable = true;
  servers.enable = false;
  sddm.enable = true;
  bootloader = {
    enable = true;
    multiBootSupport = false;
  };

  # NixOS options
  programs.hyprland.enable = true;
  programs.zsh.enable = true;

  # Needed to get zsh completion for system packages
  environment.pathsToLink = [ "/share/zsh" ];

  # Enabled services
  services = { 
    openssh.enable = true;
    usbmuxd.enable = true;
    upower.enable = true;
  };

  # Macbook-specific fixes
  services = {
    mbpfan = {
      enable = true;
      settings = {
        general = {
          low_temp = 70;      # Fan minimum speed temp
          high_temp = 90;     # Fan starts speeding up
          max_temp = 100;      # Fan max speed
          min_fan_speed = 2000; # RPM
        };
      };
    };

    thermald.enable = true;
    auto-cpufreq.enable = true;
    xserver.videoDrivers = [ "intel" ];
  };

  powerManagement.enable = true;

  boot.kernelParams = [
    "apple_night_mode=1"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  system.stateVersion = "25.11"; # Do not change
}
