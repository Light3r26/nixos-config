{ inputs, ... }:

{
  home-manager = {
    extraSpecialArgs = { inherit inputs; }; # Passes inputs to HM modules
    useGlobalPkgs = true; # NixOS and HM use the same global packages
    users = {
      "light3r" = { 
        imports = [
          ../../hosts/light3r/home.nix
          #inputs.self.outputs.homeManagerModules.default
        ];
      };
    };
    backupFileExtension = "backup";
  };
}
