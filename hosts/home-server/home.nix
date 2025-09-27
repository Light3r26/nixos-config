{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home-manager/shell/bash.nix
    ../../modules/home-manager/shell/cli-tools.nix
    ../../modules/home-manager/shell/fastfetch.nix
    ../../modules/home-manager/shell/git.nix
    ../../modules/home-manager/shell/starship.nix
  ];

  home = { 
    username = "nixos";
    homeDirectory = "/home/";
    stateVersion = "24.05";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.sessionPath = [
    "/Nixos/scripts"
    "/Nixos/scripts/nixos"
    "/Nixos/scripts/system"
    "/Nixos/scripts/hypr"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
