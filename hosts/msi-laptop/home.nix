{ pkgs, ... }:

{
  imports = [
    ../../modules/home-manager
  ];

  home = { 
    username = "light3r";
    homeDirectory = "/home/light3r";
    stateVersion = "24.05"; # Do not change
  };

  home.packages = with pkgs; [
    dconf
  ];

  home.sessionVariables = {
    TERMINAL = "kitty";
    EDITOR = "nvim";
    VISUAL = "nvim";
    HYPRSHOT_DIR = "/home/light3r/Screenshots";
  };

  kitty.enable = true;
  zsh.enable = true;
  starship.enable = true;
  fastfetch.enable = true;
  neovim.enable = true;

  hyprland = {
    enable = true;
    monitors = [
      "eDP-1, 1920x1080@60.01Hz, 1920x0, 1" # PC Monitor
      "HDMI-A-1, 1920x1080@144.00Hz, 0x0, 1" # ASUS monitor
    ];
    workspace = [ 
      "1, monitor:HDMI-A-1"
      "2, monitor:HDMI-A-1"
      "3, monitor:HDMI-A-1"
      "4, monitor:HDMI-A-1"
      "5, monitor:HDMI-A-1"
      "6, monitor:eDP-1"
      "7, monitor:eDP-1"
      "8, monitor:eDP-1"
      "9, monitor:eDP-1"
      "10, monitor:eDP-1"
    ];
  };

  hyprpanel.enable = true;
  hyprpaper.enable = true;
  hyprlock.enable = true;
  hypridle.enable = true;
  styling.enable = true;
  rofi.enable = true;
  zen-browser.enable = true;
  mpv.enable = true;
  wlogout.enable = true;
  mime-apps.enable = true;
  common = {
    home-programs.enable = true;
    cli-tools.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
