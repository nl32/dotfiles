{
    devenv,
    pkgs,
    ...
}: let 
core-tools = with pkgs; [
kitty
curl
gnumake
ripgrep
grep
wget
zsh
tree
neofetch
];
nix-tools = [devenv.packages.${pkgs.stdenv.system}.default];
in {
    home.packages = 
    core-tools
    ++nix-tools;
  }

