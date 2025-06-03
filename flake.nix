{
  description = "NixOS configuration for Mustafa's machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:danth/stylix";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      ...
    }@inputs:
    {
      # Build command: 'sudo nixos-rebuild switch --flake .#hostname'
      nixosConfigurations.nixpc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixpc/configuration.nix
        ];
      };

      # Build command: 'home-manager switch --flake .#username@hostname'
      # If you don't have home-manager installed, try nix shell nixpkgs#home-manager
      homeConfigurations = {
        "mustafasturan@nixpc" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          modules = [
            stylix.homeModules.stylix
            ./home/mustafasturan/home.nix
          ];
          extraSpecialArgs = { inherit stylix; };
        };
      };
    };
}
