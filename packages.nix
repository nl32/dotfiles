{
  devenv,
  pkgs,
  ...
}: let
  core-tools = with pkgs; ([
    ]
    ++ lib.optionals stdenv.isLinux [
      gcc
      zsh
      kitty
      curl
      gnumake
      ripgrep
      gnugrep
      wget
      tree
      neofetch
      wl-clip-persist
      wl-clipboard
      cliphist
    ]);
  nix-tools = [devenv.packages.${pkgs.stdenv.system}.default];
in {
  home.packages =
    core-tools
    ++ nix-tools;
}
