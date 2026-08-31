{
  description = "Welcome to The Cubos configuration";

  inputs = {
    # System base tracked on the stable branch (adjust version if yours differs)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs"; # Forces home-manager to match system packages
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      # The target name matching your networking.hostName
      satella = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/satella/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.cubos = import ./users/cubos/home.nix;
          }
        ];
      };

      vivy = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./vms/vivy/qtile-vm.nix ]; 
      };

    };
  };
}
