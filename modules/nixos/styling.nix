{ config, pkgs, ... }:

{
  config = {
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
      image = ../../.assets/wallpapers/dark-bright-mountains.jpg;

      cursor = {
        package = pkgs.whitesur-cursors;
        name = "WhiteSur-cursors";
        size = 24;
      };

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.caskaydia-cove;
          name = "CaskaydiaCove Nerd Font Mono";
        };

        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };

        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
      };

      opacity.terminal = 0.7;
      targets = {
        grub.enable = false;
      };
    };

    home-manager.users.light3r = {
      stylix.targets = {
        starship.enable = false;
        zen-browser.enable = false;
        waybar.enable = false;
      };
    };
  };
}
