{ pkgs, ... }:

let
  flake-rebuild = import ./flake-rebuild.nix { inherit pkgs; };
in
{
  environment.systemPackages = [
    flake-rebuild
  ];
}
