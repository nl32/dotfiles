{pkgs, ...}: {
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
    libgcc
  ];
  imports = [
    ../../programs/neovim
    ../../programs/zsh.nix
    ../../programs/git.nix
    ../../programs/gh.nix
    ../../programs/ssh.nix
    ../../programs/firefox.nix
    ../../programs/wayland
    ../../programs
  ];
}
