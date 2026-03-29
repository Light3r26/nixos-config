{
  description = "Light3r's NixOS systems config flake";

  inputs = {
    # Unstable packages for laptop configuration
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Stable packages for home-server configuration
    nixpkgs-stable.url = "github:nixos/nixpkgs/25.11";

    # Other miscellaneous input
    nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes"; # Bootloader theme
    nvf.url = "github:notashelf/nvf"; # Neovim Nix Framework NVF
    nvf.inputs.nixpkgs.follows = "nixpkgs-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest"; # Declarative Flatpak
    agenix.url = "github:ryantm/agenix";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self, 
    nixpkgs-unstable,
    home-manager,
    nixpkgs-stable,
    nvf,
    nix-flatpak,
    agenix,
    nixos-hardware,
    ... 
  }@inputs: {
    nixosConfigurations = {
      msi-laptop = nixpkgs-unstable.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/msi-laptop/configuration.nix
          home-manager.nixosModules.default
          nvf.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };
    }; 
    nixosConfigurations = {
      nixbook-pro = nixpkgs-unstable.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/nixbook-pro/configuration.nix
          home-manager.nixosModules.default
          nvf.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak
          #nixos-hardware.nixosModules.apple-macbook-pro-12-1
        ];
      };
    }; 
    nixosConfigurations = {
      home-server = nixpkgs-stable.lib.nixosSystem {
        specialArgs = let
          system = "x86_64-linux";
        in 
        {
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
        };
        modules = [
          ./hosts/home-server/configuration.nix
          agenix.nixosModules.default
        ];
      };
    };
  };
}
