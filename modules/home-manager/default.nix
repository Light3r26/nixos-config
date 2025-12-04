{
  imports = [
    ./battery-notification.nix
    ./mime-apps.nix
    # Shell 
    ./shell/cli-tools.nix
    ./shell/fastfetch.nix
    ./shell/git.nix
    ./shell/kitty.nix
    ./shell/starship.nix
    ./shell/zsh.nix
    # Desktop
    ./desktop/desktop-apps.nix
    ./desktop/hypridle.nix
    ./desktop/hyprland.nix
    ./desktop/hyprlock.nix
    ./desktop/hyprpaper.nix
    ./desktop/mpv.nix
    ./desktop/nemo.nix
    ./desktop/rofi.nix
    ./desktop/styling.nix
    ./desktop/swaync.nix
    ./desktop/waybar.nix
    ./desktop/wlogout.nix
    # Apps
    ./apps/floorp.nix
  ];
}
