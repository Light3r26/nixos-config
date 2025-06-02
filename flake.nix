{
  description = "Light3r's NixOS system config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      light3r = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          /Nixos/hosts/light3r/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    }; 
  };
}
