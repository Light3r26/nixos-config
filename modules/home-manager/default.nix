{
  imports = [
    # Shell 
    ./shell/bash.nix
    ./shell/cli-tools.nix
    ./shell/fastfetch.nix
    ./shell/kitty.nix
    ./shell/starship.nix
    # Desktop
    ./desktop/hypridle.nix
    ./desktop/hyprland.nix
    ./desktop/hyprlock.nix
    ./desktop/hyprpaper.nix
    ./desktop/rofi.nix
    ./desktop/styling.nix
    ./desktop/waybar.nix
    ./desktop/wlogout.nix
    # Apps
    ./apps/firefox.nix
    ./apps/librewolf.nix
  ];
}
