{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware/lightstorm.nix
    ./modules/common.nix
    ./modules/system.nix
    ./modules/wayland
    ../system
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

  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.openssh.enable = true;
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  programs.hyprland.enable = true;
}
