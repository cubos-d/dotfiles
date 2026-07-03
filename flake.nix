{
  description = "Welcome to The Cubos configuration";

  inputs = {
    # System base tracked on the stable branch (adjust version if yours differs)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    # Home Manager tracking the matching stable branch
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs"; # Forces home-manager to match system packages
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      # The target name matching your networking.hostName
      satella = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/satella/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cubos = import ./users/cubos/home.nix;
          }
        ];
      };
    };
  };
}
