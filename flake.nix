{
  description = "SOT for like everything lol";
  inputs = {
    devenv.url = "github:cachix/devenv/v0.6.3";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = {
    self,
    devenv,
    flake-utils,
    home-manager,
    nixpkgs,
    ...
  }:
    (flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        defaultApp = {
          type = "app";
          program = "${home-manager.packages.${system}.default}/bin/home-manager";
        };
      }
    ))
    // (
      let
        homeManagerModules = {
          system,
          username,
          homeDirectory,
          stateVersion,
        }: let
          pkgs = nixpkgs.legacyPackages.${system};
        in [
          {nixpkgs.config.allowUnfree = true;}
          (import ./home.nix {
            inherit username homeDirectory stateVersion pkgs nixpkgs devenv home-manager;
          })
        ];
        rawHomeManagerConfigurations = {
          "ethanbickel@Ethans-MacBook-Pro-2.local" = {
            system = "aarch64-darwin";
            username = "ethanbickel";
            homeDirectory = "/Users/ethanbickel";
            stateVersion = "23.11";
          };
          "ebickel@nixos" = {
            system = "x86_64-linux";
            username = "ebickel";
            homeDirectory = "/home/ebickel";
            stateVersion = "23.11";
          };
        };
        homeManagerConfiguration = {
          system,
          username,
          homeDirectory,
          stateVersion,
        }: (
          let
            pkgs = nixpkgs.legacyPackages.${system};
          in
            home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = homeManagerModules {
                inherit system username homeDirectory stateVersion;
              };
            }
        );
      in {
        # Export home-manager configurations
        inherit rawHomeManagerConfigurations;
        homeConfigurations =
          nixpkgs.lib.attrsets.mapAttrs
          (userAndHost: userAndHostConfig: homeManagerConfiguration userAndHostConfig)
          rawHomeManagerConfigurations;
      }
    )
    // {
      # Re-export devenv, flake-utils, home-manager and nixpkgs as usable outputs
      inherit devenv flake-utils home-manager nixpkgs;
    };
}
