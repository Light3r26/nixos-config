{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.caskaydia-cove
    nerd-fonts.jetbrains-mono
  ]; 
}
