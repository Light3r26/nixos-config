{ pkgs, ... }:

{
  imports = [
    ../../modules/home-manager
  ];

  home = { 
    username = "light3r";
    homeDirectory = "/home/light3r";
    stateVersion = "25.11"; # Do not change
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
    monitors = [ "eDP-1, preferred, auto, 1.25" ];
  };
  hyprpanel = {
    enable = true;
    bar.transparency = false;
  };
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
