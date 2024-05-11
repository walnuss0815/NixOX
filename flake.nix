{
  description = "walnuss0815 NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware }:

    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };

    in {
      nixosConfigurations = {
        alexander-nb2 = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./hosts/alexander-nb2/configuration.nix
            nixos-hardware.nixosModules.lenovo-thinkpad-x280
            ./modules/system/docker
            ./modules/system/printing
            ./modules/system/nix-storage-optimisation
          ];
        };
      };

      homeConfigurations = {
        alexander = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./users/alexander
            ./modules/user/shell
            ./modules/user/git
            ./modules/user/vscode
          ];
        };
      };
    };
}
