# default config for linux machines
{
  lib,
  self,
  inputs,
  ...
}: {
  imports = [
    inputs.hyprlock.homeManagerModules.default
  ];

  home.stateVersion = "23.11";
  home.username = "ebickel";
  home.homeDirectory = "/home/ebickel";

  programs.home-manager.enable = true;
}
