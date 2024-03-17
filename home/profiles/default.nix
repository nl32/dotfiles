{
  self,
  inputs,
  ...
}: let
  extraSpecialArgs = {inherit inputs self;};
  homeImports = {
    "ebickel@lightstorm" = [../. ./lightstorm];
  };
  inherit (inputs.home-manager.lib) homeManagerConfiguration;
  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  _module.args = {inherit homeImports;};
  flake = {
    homeConfigurations = {
      "ethanbickel@Ethans-MacBook-Pro-2.local" = homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "aarch64-darwin";
          config = {
            allowUnfree = true;
          };
        };
        modules = [
          ../users/ethanbickel/home.nix
        ];
        inherit extraSpecialArgs;
      };
      "ebickel@lightstorm" = homeManagerConfiguration {
        modules = homeImports."ebickel@lightstorm";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
