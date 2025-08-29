{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      # NixOS & Sistema
      list-nixos-generations = "nixos-rebuild list-generations"; 
      flake-check = "nix flake check";
      size = "du -ah --max-depth=1 | sort -h";
      ip-show = "curl ifconfig.me";
      # Bluetooth
      auricolari-bt = "bluetoothctl connect B8:F8:BE:60:54:BE";
      dualsense-ps5 = "bluetoothctl connect 4C:B9:9B:10:B8:F9";
      disconnetti-bt = "bluetoothctl disconnect";
      # Wifi
      mostra-connessioni = "nmcli device wifi list";
      hotspot-telefono = "nmcli device wifi connect Light3r";
    };
    bashrcExtra = ''
      eval "$(starship init bash)"
      export XCURSOR_THEME=~/.icons/macOS
      export XCURSOR_SIZE=24
      '';
    initExtra = ''
      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" 
    '';
  };
}
