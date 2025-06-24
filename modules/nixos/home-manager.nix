{ inputs, ... }:

{
  home-manager = {
    extraSpecialArgs = { inherit inputs; }; # Passes inputs to HM modules
    useGlobalPkgs = true; # NixOS and HM use the same global packages
    users = {
      "light3r" = { 
        imports = [
          ../../home-manager/home.nix
          #inputs.self.outputs.homeManagerModules.default
        ];
      };
    };
  };
}
