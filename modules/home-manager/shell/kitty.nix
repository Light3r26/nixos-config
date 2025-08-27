{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerd-fonts.caskaydia-cove;
      name = "CaskaydiaCove Nerd Font Mono";
      size = 14;
    };    

    shellIntegration.enableBashIntegration = true;
    themeFile = "SpaceGray";

    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      background_opacity = 0.7;
      enable_audio_bell = false;
      confirm_os_windows_close = false;
      copy_on_select = true;
      #extraConfig = ''
      #  selection_background #F5E0DC
      #  selection_foreground #ECEFF4
      #'';
    };
  };
}
