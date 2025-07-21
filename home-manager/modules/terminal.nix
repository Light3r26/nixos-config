{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    starship # Customisable prompt
    yazi # Terminal file manager
    htop # Process manager
    killall
    # Compilers and interpreters
    gcc
    python3
    # Other tools
    gh # GitHub CLI
    tree
    wget
    fastfetch
    toilet
    zip
    unzip
    ffmpeg
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      # NixOS & Sistema
      lista-generazioni-nixos = "nixos-rebuild list-generations"; 
      flake-check = "nix flake check";
      size = "du -ah --max-depth=1 | sort -h";
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
      export PATH="~/.scripts:$PATH"
      export PATH="~/.scripts/nixos:$PATH"
      export PATH="~/.scripts/hypr:$PATH"
    '';
    initExtra = ''
      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" 
    '';
  };

  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerd-fonts.caskaydia-cove;
      name = "CaskaydiaCove Nerd Font Mono";
      size = 14;
    };
    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      background_opacity = 0.7;
      enable_audio_bell = false;
      confirm_os_windows_close = 0;
    };
    shellIntegration.enableBashIntegration = true;
    themeFile = "adwaita_dark";
  };
}
