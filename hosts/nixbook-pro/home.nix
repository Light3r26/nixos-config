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
    terminal = "kitty";
    browser = "zen-browser";
    fileManager = "nemo";
    lockingProgram = "noctalia-shell ipc call lockScreen lock";
    menu = "noctalia-shell ipc call launcher toggle";    
    monitors = [ "eDP-1, preferred, auto, 1.40" ];
    gestures = [
      "3, horizontal, workspace"
    ];
    programs-autostart = [
      "noctalia-shell"
    ];
    environment-variables = [
      "XCURSOR_THEME, WhiteSur-cursors"
      "XCURSOR_SIZE, 24"
      "HYPRSHOT_DIR, /home/light3r/Screenshots"
      "XDG_SESSION_TYPE, wayland"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_DESKTOP, Hyprland"
      "LIBVA_DRIVER_NAME, nvidia"
      "GBM_BACKEND, nvidia-drm"
      "__GLX_VENDOR_LIBRARY_NAME, nvidia"
      "NIXOS_OZONE_WL, 1"
      "WLR_NO_HARDWARE_CURSORS, 1"
    ];
    #plugins = with pkgs.hyprlandPlugins; [ 
      #hyprspace
    #];
  };
  #hyprpanel = {
  # enable = true;
  # bar.transparency = false;
  # bar.background = "#323844";
  #};
  noctalia.enable = true;
  styling.enable = true;
  zen-browser.enable = true;
  mpv.enable = true;
  mime-apps.enable = true;
  nemo.enable = true;
  common = {
    home-programs.enable = true;
    cli-tools.enable = true;
  };

  xdg.portal.config.common.default = "*";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
