{ lib, config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    sugarCandyNix = {
      enable = true;
      Background = lib.cleanSource ./bright-mountains.jpg;
      ScreenWidth = 1920;
      ScreenHeight = 1080;
      FormPosition = "left";
      HaveFormBackground = true;
      PartialBlur = true;

  };
}
