{config,lib,pkgs,...}:

{
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
  home.username = "ethanbickel";
  home.homeDirectory = "/Users/ethanbickel";

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  imports = [
    ../../programs/neovim
    ../../programs/zsh.nix
  ];
}
