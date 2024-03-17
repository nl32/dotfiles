{
  description = "dotfiles but it's the whole OS";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    devenv.url = "github:cachix/devenv/v0.6.3";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    devenv,
    flake-utils,
    home-manager,
    nixpkgs,
    hyprlock,
    ...
  } @ inputs: let
    config = {
      allowUnfree = true;
      permittedInsecurePackages = ["electron-25.9.0"];
    };
    nixosPackages = import nixpkgs {
      system = "x86_64-linux";
      inherit config;
    };

    darwinPackages = import nixpkgs {
      system = "aarch64-darwin";
      inherit config;
    };
  in {
    inherit inputs;
    imports = [
      ./home/profiles
    ];
    homeConfigurations = {
      "ethanbickel@Ethans-MacBook-Pro-2.local" = home-manager.lib.homeManagerConfiguration {
        pkgs = darwinPackages;
        modules = [
          ./home/users/ethanbickel/home.nix
        ];
      };
    };
    nixosConfigurations = {
      lightstorm = inputs.nixpkgs.lib.nixosSystem {
        inherit inputs;
        system = "x86_64-linux";
        pkgs = nixosPackages;
        modules = [
          ./nixos/lightstorm.nix
        ];
      };
    };
  };
}
