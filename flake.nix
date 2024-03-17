{
  description = "dotfiles but it's the whole OS";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    devenv.url = "github:cachix/devenv/v0.6.3";
    flake-utils.url = "github:numtide/flake-utils";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
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
    specialArgs = {inherit inputs self;};
  in
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        ./home/profiles
        ./nixos/lightstorm.nix
      ];
      flake = {
        homeConfigurations = {
          "ethanbickel@Ethans-MacBook-Pro-2.local" = home-manager.lib.homeManagerConfiguration {
            pkgs = darwinPackages;
            modules = [
              ./home/users/ethanbickel/home.nix
            ];
          };
        };
      };
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
    };
}
