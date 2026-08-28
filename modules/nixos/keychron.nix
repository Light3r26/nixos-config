{ lib, config, ... }:

let
  cfg = config.keychron;
in
{
  options.keychron.enable = lib.mkEnableOption "Keychron keyboard WebHID/udev support";

  config = lib.mkIf cfg.enable {
    # Grant the active user access to Keychron HID devices so browser
    # WebHID apps (launcher.keychron.com, ZMK Studio) can connect.
    services.udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
  };
}
