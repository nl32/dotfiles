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
  homeConfigurations = {
    "ebickel@lightstorm" = homeManagerConfiguration {
      modules = homeImports."ebickel@lightstorm";
      inherit pkgs extraSpecialArgs;
    };
  };
}
