{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.home-manager.enable = true;
  home.username = "ebickel";
  home.homeDirectory = "/home/ebickel/";
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.packages = with pkgs; [
    kitty
    curl
    gnumake
    rupgrep
    gnugrep
    wget
    tree
    neofetch
    obsidian
  ];
}
