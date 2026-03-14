{ lib, config, inputs, pkgs, ... }:

let
  cfg = config.bootloader;

in
{
  options.bootloader = {
    enable = lib.mkEnableOption "Enable bootloader module";
    multiBootSupport = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether to enable/disable grub's OS prober";
    };
  };

  config = lib.mkIf cfg.enable {
    boot.loader = {
      systemd-boot.enable = false;

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        useOSProber = cfg.multiBootSupport;
        efiSupport = true;
        device = "nodev";
        theme = inputs.nixos-grub-themes.packages.${pkgs.stdenv.hostPlatform.system}.hyperfluent;
      };
    };
  };
}
