{ lib, config, ... }:

let
  cfg = config.nix-settings;

in 
{
  options.nix-settings = {
    flakes.enable = lib.mkEnableOptions "Enable flakes";
    cache-substituters.enable = lib.mkEnableOptions "Enable cache substituters";
    allow-unfree = lib.mkEnableOption "Allow unfree packages";
  };

  config = lib.mkMerge [
    ( 
      lib.mkIf cfg.flakes.enable { 
        nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
      }
    )
    (
      lib.mkIf cfg.cache-substituters.enable {
        nix.settings.substituters = [
          "https://hyprland.cachix.org"
          "https://nix-community.cachix.org"
          "https://cache.nixos.org/"
        ];
        nix.settings.trusted-substituters = [
          "https://hyprland.cachix.org"
          "https://nix-community.cachix.org"
          "https://cache.nixos.org/"
        ];
        nix.settings.trusted-public-keys = [
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
      }
    )
    (
      lib.mkIf cfg.allow-unfree {
        nixpkgs.config.allowUnfree = true;
      }
    )
  ];
}
