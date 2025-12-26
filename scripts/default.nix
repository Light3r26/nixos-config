{ pkgs, ... }:

let
  flake-rebuild = import ./flake-rebuild.nix { inherit pkgs; };
  delete-generations = import ./delete-generations.nix { inherit pkgs; };
  hyprlock-crash-fix = import ./hyprlock-crash-fix.nix { inherit pkgs; };
in
{
  environment.systemPackages = [
    flake-rebuild
    delete-generations
    hyprlock-crash-fix
  ];
}
