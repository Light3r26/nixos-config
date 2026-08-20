{ pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    image = /Nixos/.assets/wallpapers/dark-bright-mountains.jpg;
    cursor = {
      package = pkgs.whitesur-cursors;
      name = "WhiteSur-cursors";
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

    #stylix.targets.nvf.enable = false;
  };
}
