{ pkgs, ... }:

let
  flake-rebuild = import ./flake-rebuild.nix { inherit pkgs; };
  delete-generations = import ./delete-generations.nix { inherit pkgs; };
in
{
  environment.systemPackages = [
    flake-rebuild
    delete-generations
  ];
}
