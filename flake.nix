{
  description = "dotfiles but it's the whole OS";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixos.url = "github:nixos/nixpkgs/nixos-23.11";
    devenv.url = "github:cachix/devenv/v0.6.3";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    devenv,
    flake-utils,
    home-manager,
    nixpkgs,
    nixos,
  } @ inputs: let
    config = {
      allowUnfree = true;
      permittedInsecurePackages = ["electron-25.9.0"];
    };
    nixosPackages = import nixpkgs {
      system = "x86_64-linux";
      inherit config;
    };

    x86Packages = import nixpkgs {
      system = "x86_64-linux";
      inherit config;
    };
    armPackages = import nixpkgs {
      system = "aarch64-linux";
      inherit config;
    };
    darwinPackages = import nixpkgs {
      system = "aarch64-darwin";
      inherit config;
    };
  in {
    homeConfigurations = {
      "ebickel@lightstorm" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixosPackages;
        modules = [
          ./home/users/ebickel/home.nix
        ];
      };
      "ethanbickel@Ethans-MacBook-Pro-2.local" = home-manager.lib.homeManagerConfiguration {
        pkgs = darwinPackages;
        modules = [
          ./home/users/ethanbickel/home.nix
        ];
      };
    };
    nixosConfigurations = {
      lightstorm = nixos.lib.nixosSystem {
        system = "x86_64-linux";
        pkgs = nixosPackages;
        modules = [
          ./nixos/lightstorm.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}
