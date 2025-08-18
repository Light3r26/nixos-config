{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nemo
  ];

  dconf = {
    settings = {
      "org/cinnamon/desktop/application/terminal" = {
        exec = "kitty";
      };
    };
  };
}
