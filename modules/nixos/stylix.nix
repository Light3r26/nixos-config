{ pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ../../wallpapers/bright-mountains.jpg;
    targets.grub.enable = false;
  };
}
