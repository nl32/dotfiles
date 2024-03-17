{
  config,
  pkgs,
  lib,
  homeImports,
  ...
}: {
  imports = [
    ./hardware/lightstorm.nix
    ./modules/common.nix
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
  networking.hostName = "lightstorm";

  services.openssh.enable = true;
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  programs.hyprland.enable = true;
}
