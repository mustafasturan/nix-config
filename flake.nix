{
  description = "NixOS configuration for Mustafa's machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # Build command: 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations.nixpc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/nixpc/configuration.nix
      ];
    };

    # Build command: 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "mustafa@nixpc" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        modules = [ ./home/mustafa/home.nix ];
      };
    };
  };
}
