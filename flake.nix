{
  description = "Light3r's NixOS system config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Bootloader theme
    nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes";

    # SDDM theme 
    sddm-sugar-candy-nix.url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";

    # Neovim Nix Framework NVF
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Declarative Flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";
  };

  outputs = {
    self, 
    nixpkgs,
    home-manager,
    nvf,
    sddm-sugar-candy-nix,
    nix-flatpak,
    ... 
  }@inputs: {
    nixosConfigurations = {
      msi-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/msi-laptop/configuration.nix
          home-manager.nixosModules.default
	        nvf.nixosModules.default
          sddm-sugar-candy-nix.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
    }; 
  };
}
