{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    autocd = true;
    prezto = {
      enable = true;
      editor.keymap = "vi";
    };
    shellAliases = {
      # NixOS & Sistema
      list-generations = "nixos-rebuild list-generations";
      size = "du -ah --max-depth=1 | sort -h";
      ip-show = "curl ifconfig.me";
      pmount = "sudo mount -o uid=1000,gid=100";
      ls = "lsd";
      open = "xdg-open";
      fopen = "nemo";
      copy = "wl-copy";
      paste = "wl-paste";
      dup = "kitty &>/dev/null&";
      # Bluetooth
      auricolari-bt = "bluetoothctl connect B8:F8:BE:60:54:BE";
      dualsense-ps5 = "bluetoothctl connect 4C:B9:9B:10:B8:F9";
      disconnetti-bt = "bluetoothctl disconnect";
      # Wifi
      mostra-connessioni = "nmcli device wifi list";
      hotspot-telefono = "nmcli device wifi connect Light3r";
    };
    initContent = ''
      export XCURSOR_THEME=~/.icons/macOS
      export XCURSOR_SIZE=24
      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      eval "$(starship init zsh)"
    '';
  };
}
