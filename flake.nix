{
  description = "Light3r's NixOS system config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Bootloader theme
    nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes";

    # Neovim Nix Framework NVF
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nvf, ... }@inputs: {
    nixosConfigurations = {
      light3r = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/light3r/configuration.nix
          inputs.home-manager.nixosModules.default
	  nvf.nixosModules.default
        ];
      };
    }; 
  };
}
