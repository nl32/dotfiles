{
  pkgs,
  homeImports,
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    specialArgs = {inherit inputs self;};
  in {
    inherit specialArgs;
    lightstorm = nixosSystem {
      modules = [
        ./hardware/lightstorm.nix
        ./modules/common.nix
        ./modules/system.nix
        ../system
        ../system/services/gnome-services.nix
        {
          home-manager = {
            users.ebickel.imports = homeImports."ebickel@lightstorm";
            extraSpecialArgs = specialArgs;
          };
        }
        {
          environment.systemPackages = with pkgs; [
            neovim
            kitty
            curl
            wget
            lazygit
            openssl
            git
          ];

          services.openssh.enable = true;
          services.xserver = {
            layout = "us";
            xkbVariant = "";
          };

          programs.hyprland.enable = true;
        }
      ];
    };
  };
}
