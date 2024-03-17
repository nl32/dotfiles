{
  homeImports,
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    specialArgs = {inherit inputs self;};
    mod = "${self}/system";
  in {
    lightstorm = nixosSystem {
      inherit specialArgs;
      modules = [
        ./lightstorm.nix
        "${mod}"
        "${mod}/programs/hyprland.nix"
        "${mod}/services/gnome-services.nix"
        {
          home-manager = {
            users.ebickel.imports = homeImports."ebickel@lightstorm";
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    };
  };
}
