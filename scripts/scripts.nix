{ pkgs }:

{
  pkgs.writeShellApplication = {
    name = "flake-rebuild";

    runtimeInputs = [
      pkgs.toilet
    ];
    
    text = builtins.readFile ./nixos/flake-rebuild;
  };
}
