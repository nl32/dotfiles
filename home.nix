{
  username,
  homeDirectory,
  stateVersion,
  pkgs,
  nixpkgs,
  devenv,
  home-manager,
  ...
}: {
  imports =
    [
      (import ./dotfiles.nix )
      (import ./packages.nix {inherit devenv pkgs;})
      (import ./programs.nix )
      (import ./neovim.nix)
    ];
  home = {inherit username homeDirectory stateVersion;};
}
