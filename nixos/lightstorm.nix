{
  config,
  pkgs,
  lib,
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

  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  networking = {
    hostName = "lightstorm";
    networkmanager.enable = true;
  };
  time.timeZone = "America/Chicago";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };
  services.openssh.enable = true;
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  programs.zsh.enable = true;
  programs.hyprland.enable = true;
  users.users.ebickel = {
    isNormalUser = true;
    description = "Ethan Bickel";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };
  system.stateVersion = "23.11";
}
