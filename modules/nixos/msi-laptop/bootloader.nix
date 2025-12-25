{ inputs, pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = false;
    grub.useOSProber = true;

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      theme = inputs.nixos-grub-themes.packages.${pkgs.system}.hyperfluent;
    };
  };
}
