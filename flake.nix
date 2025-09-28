{
  description = "Light3r's NixOS systems config flake";

  inputs = {
    # Unstable packages for laptop configuration
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Stable packages for home-server configuration
    nixpkgs-stable.url = "github:nixos/nixpkgs/25.05";
    home-manager-stable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    # Other miscellaneous input
    nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes"; # Bootloader theme
    sddm-sugar-candy-nix.url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix"; # SDDM theme
    nvf.url = "github:notashelf/nvf"; # Neovim Nix Framework NVF
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest"; # Declarative Flatpak
  };

  outputs = {
    self, 
    nixpkgs-unstable,
    home-manager-unstable,
    nixpkgs-stable,
    home-manager-stable,
    nvf,
    sddm-sugar-candy-nix,
    nix-flatpak,
    ... 
  }@inputs: {
    nixosConfigurations = {
      msi-laptop = nixpkgs-unstable.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/msi-laptop/configuration.nix
          home-manager-unstable.nixosModules.default
	        nvf.nixosModules.default
          sddm-sugar-candy-nix.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
    }; 
    nixosConfigurations = {
      home-server = nixpkgs-stable.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/home-server/configuration.nix
          home-manager-stable.nixosModules.default
          nvf.nixosModules.default
        ];
      };
    };
  };
}
