{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
  home.username = "ebickel";
  home.homeDirectory = "/home/ebickel/";
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.packages = with pkgs; [
    kitty
    curl
    gnumake
    ripgrep
    gnugrep
    wget
    tree
    neofetch
    obsidian
  ];
  imports = [
    ../../programs/neovim
    ../../programs/zsh.nix
    ../../programs/git.nix
    ../../programs/gh.nix
    ../../programs/ssh.nix
    ../../programs/firefox.nix
  ];
}
