{
  description = "My shitty NixoS shit";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOs/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager 
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.cuckboi = import ./home/nix;
              backupFileExtension = "backup";
            };
          }
        ];
      }; 
};
