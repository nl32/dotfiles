{
  config,
  pkgs,
  lib,
  homeImports,
  self,
  inputs,
  ...
}: let
  specialArgs = {inherit inputs self;};
in {
  imports = [
    ./hardware/lightstorm.nix
    ./modules/common.nix
    ./modules/system.nix
    ../system
    ../system/services/gnome-services.nix
  ];
  environment.systemPackages = with pkgs; [
    neovim
    kitty
    curl
    wget
    lazygit
    openssl
    git
  ];
  home-manger = {
    users.ebickel.imports = homeImports."ebickel@lightstorm";
    extraSpecialArgs = specialArgs;
  };
  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.openssh.enable = true;
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  programs.hyprland.enable = true;
}
