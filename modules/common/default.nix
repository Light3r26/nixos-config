{ lib, config, pkgs, ... }:

let
  cfg = config.common;

in
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.caskaydia-cove
    nerd-fonts.jetbrains-mono
    montserrat
  ]; 

  services.xserver.xkb = {
    layout = "it";
    variant = "";
  };
  console.keyMap = "it";

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
}
